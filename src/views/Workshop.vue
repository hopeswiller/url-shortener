// eslint-disable-next-line

<template>
  <div class="workshop">
    <div class="p-5 mb-4 bg-light rounded-3" id="banner">
      <h2>{{ _mod.content.header }}</h2>
      <p>
        {{ _mod.content.headerInfo }}
      </p>
    </div>

    <div class="container">
      <div class="container w-75 mt-4 mb-4">
        <TheAlertNotification
          v-if="processed"
          :url="new_url"
          :alerttype="status"
          :mod="mod"
        />

        <!-- @submit.prevent prevents browser refresh -->
        <form action="" @submit.prevent="methodCall">
          <div class="input-group">
            <input
              id="old_url"
              type="text"
              class="form-control"
              placeholder="Paste your link here to shorten..."
              required
              v-model="old_url"
            />
            <div class="input-group-append">
              <input class="btn btn-custom" type="submit" value="process" />
            </div>
          </div>
        </form>
        <span v-if="mod == 'shorten' ? true : false"
          >Try this one <a href="">https://weatherextension.com/</a></span
        >
        <br />
        <button
          v-if="status === 'success' && ['shorten', 'expand'].includes(mod)"
          @click="copyText('link')"
          class="m-50 btn btn-dark"
        >
          Copy to Clipboard
        </button>
      </div>

      <router-view
        v-if="mod == 'stats' && status === 'success'"
        :stats="stats"
        :key="$route.path"
      />
    </div>

    <p id="link" v-show="false">{{ new_url }}</p>
  </div>
</template>

<script>
import TheAlertNotification from "@/components/TheAlertNotification.vue";
import Store from "@/assets/store.js";

// const { URLSearchParams } = require("url");

const url = new URL("https://t.ly/api/v1/link");
let api_key = process.env.API_TOKEN;
let headers = {
  "Content-Type": "application/json",
  Accept: "application/json",
};

export default {
  data() {
    return {
      old_url: "",
      new_url: "",
      status: "",
      stats: "",
      processed: false,
    };
  },
  components: {
    TheAlertNotification,
  },
  props: { mod: { type: String, required: true } },
  computed: {
    _mod() {
      return Store.functionalities.find(
        (i) => i.name.toLowerCase() === this.mod
      );
    },
  },
  methods: {
    methodCall() {
      switch (this.mod) {
        case "shorten":
          this.shortenUrl();
          break;
        case "expand":
          this.expandUrl();
          break;
        case "delete":
          this.deleteUrl();
          break;
        case "stats":
          this.urlStats();
          break;

        default:
          this.shortenUrl();
      }
    },
    async shortenUrl() {
      this.processed = false;

      let body = {
        long_url: this.old_url,
        api_token:
          api_key ||
          "qnZX77rpksviT5hcfs231mpnFXi5yBQtKUhjlfXsCsTI0hTyXTqQVtynM9BU",
      };

      fetch(`${url}/shorten`, {
        method: "POST",
        headers: headers,
        body: JSON.stringify(body),
      })
        .then((response) => response.json())
        .then((json) => {
          console.log(`json : ${JSON.stringify(json)}`);
          if (json != null && json.short_url != null) {
            this.new_url = json.short_url;
            this.status = "success";
          } else {
            this.status = "danger";
          }
          this.processed = true;
        })
        .catch((err) => {
          console.log(`error occured shortening url : ${err}`);
          this.status = "danger";
        });
    },
    expandUrl() {
      this.processed = false;
      let body = {
        short_url: this.old_url,
        api_token:
          api_key ||
          "qnZX77rpksviT5hcfs231mpnFXi5yBQtKUhjlfXsCsTI0hTyXTqQVtynM9BU",
      };

      fetch(`${url}/expand`, {
        method: "POST",
        headers: headers,
        body: JSON.stringify(body),
      })
        .then((response) => response.json())
        .then((json) => {
          this.new_url = json.long_url;
          this.status = "success";
        })
        .catch((err) => {
          console.log(`error oocured expanding url : ${err}`);
          this.status = "danger";
        });
      this.processed = true;
    },
    deleteUrl() {
      console.log(`deleting link....`);
      this.processed = false;
      let body = {
        short_url: this.old_url,
        api_token:
          api_key ||
          "qnZX77rpksviT5hcfs231mpnFXi5yBQtKUhjlfXsCsTI0hTyXTqQVtynM9BU",
      };

      fetch(url, {
        method: "DELETE",
        headers: headers,
        body: JSON.stringify(body),
      })
        .then((response) => response.json())
        .then((json) => {
          console.log(json);
          //   this.new_url = json.long_url;
          this.status = "success";
        })
        .catch((err) => {
          console.log(`error oocured deleting url : ${err}`);
          this.status = "danger";
        });
      this.processed = true;
    },
    async urlStats() {
      console.log("running here ...");

      this.processed = false;
      let params = {
        short_url: this.old_url,
        api_token:
          api_key ||
          "qnZX77rpksviT5hcfs231mpnFXi5yBQtKUhjlfXsCsTI0hTyXTqQVtynM9BU",
      };

      var _url = new URL(`${url}/stats`);
      _url.search = new URLSearchParams(params).toString();

      fetch(_url, {
        method: "GET",
        headers: headers,
      })
        .then((response) => response.json())
        .then((json) => {
          console.log(json);
          if (json != null && "browsers" in json) {
            this.stats = JSON.stringify(json);
            this.status = "success";
          }
        })
        .catch((err) => {
          console.log(`error occured getting stats of url : ${err}`);
          this.status = "danger";
        });
      this.processed = true;
      this.$router.push({ name: "Stats" });
    },
    copyText(id) {
      let element = document.getElementById(id);
      navigator.clipboard.writeText(element.textContent);
    },
  },
};
</script>

<style scoped>
.workshop {
  margin-top: 2.22%;
}
.btn-custom {
  background-color: #d46c27;
  color: white;
}
</style>
