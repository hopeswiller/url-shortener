<template>
  <div>
    <TheNavigationBar />
    <!-- <router-link to="/">Home</router-link> | -->
    <!-- <router-link to="/about">About</router-link> -->
    <router-view />
  </div>
</template>

<script>
import TheNavigationBar from "@/components/TheNavigationBar.vue";

export default {
  components: {
    TheNavigationBar,
  },
};
</script>
<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
