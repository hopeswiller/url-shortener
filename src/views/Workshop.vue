<template>
  <div class="workshop">
    <div class="p-5 mb-4 bg-light rounded-3" id="banner">
      <h2>Create Short Links!</h2>
      <p>
        This platform is the best link management service to track, brand, and
        share short URLs in one simple click
      </p>
    </div>

    <div class="container">
      <div class="container w-75 mt-4 mb-4">
        <!-- @submit.prevent prevents browser refresh -->
        <form action="" @submit.prevent="shortenUrl">
          <div class="input-group">
            <input
              id="long_link"
              type="text"
              class="form-control"
              placeholder="Paste your link here to shorten..."
              v-model="long_url"
            />
            <div class="input-group-append">
              <input class="btn btn-success" type="submit" value="convert" />
            </div>
          </div>
        </form>
        <span>Try this one <a href="">https://weatherextension.com/</a></span>
        <br />

        <button
          v-if="status === 'success' ? true : false"
          @click="copyText"
          class="btn btn-dark"
        >
          Copy to Clipboard
        </button>
        <TheAlertNotification
          v-if="processed"
          :url="short_url"
          :alerttype="status"
        />
      </div>
    </div>

    <p id="link">{{ short_url }}</p>
  </div>
</template>

<script>
import TheAlertNotification from "@/components/TheAlertNotification.vue";

const url = new URL("https://t.ly/api/v1/link");
const api_token = process.env.API_TOKEN;
let headers = {
  "Content-Type": "application/json",
};

export default {
  data() {
    return {
      long_url: "",
      short_url: "",
      status: "",
      processed: false,
    };
  },
  components: {
    TheAlertNotification,
  },
  props: { mod: { type: String, required: true } },
  methods: {
    async shortenUrl() {
      this.processed = false;

      let body = {
        long_url: this.long_url,
        api_token: api_token,
      };

      fetch(`${url}/shorten`, {
        method: "POST",
        headers: headers,
        body: JSON.stringify(body),
      })
        .then((response) => response.json())
        .then((json) => {
          this.short_url = json.short_url;
          this.status = "success";
        })
        .catch((err) => {
          console.log(`error oocured shortening url : ${err}`);
          this.status = "danger";
        });

      this.processed = true;
    },
    copyText() {
      /* Get the text field */
      var copyText = document.getElementById("link");
      /*Select the text field */
      copyText.select();
      copyText.setSelectionRange(0, 99999);
      /* For mobile devices */ /* Copy the text inside the text field */
      document.execCommand("copy");
      /* Alert the copied text */
      alert("Copied thetext: " + copyText.value);
    },
  },
};
</script>

<style scoped>
.workshop {
  margin-top: 3%;
}
</style>
