<template>
  <div class="home">
    <div class="p-5 mb-4 bg-light rounded-3" id="banner">
      <h1>URL Shortener</h1>
      <p>
        We are the best link management service to help track, brand, and share
        short URLs in one simple click. <br />We make long links look cleaner
        and easier to share! Add your own Custom Domains to personalize your
        brand!
      </p>
      <router-link
        :to="{
          name: 'Workshop',
          params: { mod: 'shorten' },
        }"
      >
        <button class="btn btn-bg btn-success">Get Started</button>
      </router-link>
    </div>
    <div class="container">
      <div class="container w-75 mt-4 mb-4">
        <!-- @submit.prevent prevents browser refresh -->
        <form action="" @submit.prevent="shortenUrl">
          <div class="input-group">
            <input
              id="long_link"
              type="email"
              class="form-control"
              placeholder="Subscribe to receive updates via email..."
              v-model="long_url"
            />
            <div class="input-group-append">
              <span class="input-group-text" id="basic-addon2"
                >@example.com</span
              >
            </div>
          </div>
        </form>
      </div>

      <h2>Our Workshop</h2>

      <div class="row align-items-md-stretch pt-20">
        <div v-for="mod in mods" :key="mod.name" class="col-md-6">
          <div :class="mod.style">
            <div class="h-100 p-5 rounded-3">
              <h2>{{ mod.name }} URL</h2>
              <p>
                Swap the background-color utility and add a `.text-*` color
                utility to mix up the jumbotron look. Then, mix and match with
                additional component themes and more.
              </p>
              <router-link
                :to="{
                  name: 'Workshop',
                  params: {
                    mod: mod.name.toLowerCase(),
                  },
                }"
              >
                <button :class="mod.btnStyle" type="button">Explore..</button>
              </router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import functionalities from "@/assets/functionalities.js";

export default {
  name: "Home",
  components: {},
  data() {
    return {
      mods: functionalities.functionalities,
    };
  },
  methods: {},
};
</script>

<style scoped>
#banner {
  /* padding: 50px 0px; */
  margin-top: 3%;
}
</style>
