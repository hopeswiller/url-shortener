<template>
  <nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light" id="nav">
    <div class="container">
      <div class="navbar-header">
        <router-link class="navbar-brand" :to="{ name: 'Home' }"
          >facio<strong>compendi</strong></router-link
        >
      </div>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbartoggler"
        aria-controls="navbartoggler"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbartoggler">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <router-link
              class="nav-link active"
              aria-current="page"
              :to="{ name: 'Home' }"
              >Home</router-link
            >
          </li>
          <li v-for="item in items" :key="item">
            <router-link
              class="nav-link"
              aria-current="page"
              :to="{
                name: 'Workshop',
                params: {
                  mod: item.name.toLowerCase(),
                },
              }"
              >{{ item.name }}</router-link
            >
          </li>
          <li class="nav-item">
            <router-link
              class="nav-link disabled"
              :to="{ name: 'About' }"
              tabindex="-1"
              aria-disabled="true"
              >About</router-link
            >
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
import Store from "@/assets/store.js";
export default {
  data() {
    return {
      items: Store.functionalities,
    };
  },
};
</script>

<style scoped>
#nav a {
  font-weight: bold;
  color: #2c3e50;
}
#nav a.router-link-exact-active {
  color: #d46c27;
}
</style>
