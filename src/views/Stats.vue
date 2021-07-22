// eslint-disable-next-line

<template>
  <div class="container" id="details">
    <h2>Stats</h2>

    <!-- <p>{{ _stats }}</p> -->
    <!-- <TheAccordion>Summr</TheAccordion> -->
    <!-- <TheAccordion name="content">body</TheAccordion> -->

    <!-- <br> -->
    <div class="accordion" id="accordionFlush">
      <!-- start of links -->
      <div class="accordion-item">
        <h2 class="accordion-header" id="flush-headingTwo">
          <button
            class="accordion-button collapsed"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#flush-collapseTwo"
            aria-expanded="false"
            aria-controls="flush-collapseTwo"
          >
            Summary
          </button>
        </h2>
        <div
          id="flush-collapseTwo"
          class="accordion-collapse collapse"
          aria-labelledby="flush-headingTwo"
          data-bs-parent="#accordionFlush"
        >
          <div class="accordion-body" style="text-align: left">
            <span><b>Name: </b>{{ _stats.info.created_by }}</span
            ><br />
            <span><b>Email: </b>{{ _stats.info.email }}</span
            ><br />
            <span
              ><b>Long Version: </b>
              <a :href="_stats.info.long_url">{{
                _stats.info.long_url
              }}</a></span
            ><br />
            <span
              ><b>Short Version: </b
              ><a :href="_stats.info.long_url">{{
                _stats.info.short_url
              }}</a></span
            ><br />
            <span><b>Created At: </b>{{ _stats.info.created_at }}</span>
            <br />
          </div>
        </div>
      </div>
      <!-- start of creation -->
      <div class="accordion-item">
        <h2 class="accordion-header" id="flush-headingThree">
          <button
            class="accordion-button collapsed"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#flush-collapseThree"
            aria-expanded="false"
            aria-controls="flush-collapseThree"
          >
            More Information
          </button>
        </h2>
        <div
          id="flush-collapseThree"
          class="accordion-collapse collapse"
          aria-labelledby="flush-headingThree"
          data-bs-parent="#accordionFlush"
        >
          <div class="accordion-body" style="text-align: left">
            <span><b>Browsers : </b></span>
            <ul>
              <li v-for="browser in _stats.browsers" :key="browser">
                {{ browser.browser }} with {{ browser.total }} number of clicks
              </li>
            </ul>
            <span><b>Platforms : </b></span>
            <ul>
              <li v-for="platform in _stats.platforms" :key="platform">
                {{ platform.platform }} with {{ platform.total }} number of
                clicks
              </li>
            </ul>
            <span><b>Countries : </b></span>
            <ul>
              <li v-for="country in _stats.countries" :key="country">
                {{ country.country_code }}
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-md-6 mt-10">
        <div class="card border-success mb-3 px-0">
          <div class="card-header">Total Clicks</div>
          <div class="card-body text-success">
            <!-- <h5 class="card-title">Success card title</h5> -->
            <p class="card-text">
              {{ _stats.total_clicks }}
            </p>
          </div>
        </div>
      </div>

      <div class="col-md-6 mt-10">
        <div class="card border-success mb-3 px-0">
          <div class="card-header">Unique Clicks</div>
          <div class="card-body text-success">
            <!-- <h5 class="card-title">Success card title</h5> -->
            <p class="card-text">
              {{ _stats.unique_clicks }}
            </p>
          </div>
        </div>
      </div>
    </div>

    <!-- <router-link
      :to="{
        name: 'Workshop',
        params: {
          mod: this.mod,
        },
      }"
    > -->
    <button class="btn btn-md btn-dark">Close Details</button>
    <!-- </router-link> -->
  </div>
</template>

<script>
import { onMounted } from "vue";
// import TheAccordion from "@/components/TheAccordion.vue";
// function humanize(str) {
//   var i,
//     frags = str.split("_");
//   for (i = 0; i < frags.length; i++) {
//     frags[i] = frags[i].charAt(0).toUpperCase() + frags[i].slice(1);
//   }
//   return frags.join(" ");
// }

export default {
  data() {
    return {
      mod: this.$route.params.mod,
      track: {},
    };
  },
  props: ["stats"],
  components: {
    //   TheAccordion
  },
  setup() {
    // mounted
    onMounted(() => {
      console.log(`Component is mounted!`);
    });
  },
  computed: {
    _stats() {
      let parsedData = JSON.parse(this.stats);
      return {
        total_clicks: parsedData.clicks,
        unique_clicks: parsedData.unique_clicks,
        browsers: parsedData.browsers,
        countries: parsedData.countries,
        platforms: parsedData.platforms,
        info: {
          long_url: parsedData.data.long_url,
          short_url: parsedData.data.short_url,
          created_at: parsedData.data.created_at,
          created_by: parsedData.data.user.name,
          email: parsedData.data.user.email,
        },
      };
    },
  },
};
</script>

<style scoped>
#details {
  padding: 20px;
  border: 1px solid rgb(221, 219, 219);
}
.card-text {
  font-size: 40px;
}

#accordionFlush {
  padding-bottom: 20px;
}
</style>
