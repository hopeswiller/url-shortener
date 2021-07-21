<template>
  <div :class="msgtype" role="alert">
    <strong>{{ alerttype.toUpperCase() }}!</strong> {{ msgContent }}
    <button
      type="button"
      class="btn-close"
      data-bs-dismiss="alert"
      aria-label="Close"
    ></button>
  </div>
</template>

<script>
// function capitalize(word) {
//   const lower = str.toLowerCase();
//   return;
//   str.charAt(0).toUpperCase() + lower.slice(1);
// }

export default {
  data() {
    return {};
  },
  props: {
    alerttype: {
      type: String,
      default: "info",
    },
    url: {
      type: String,
      required: false,
    },
  },
  computed: {
    msgtype() {
      return `alert alert-${this.alerttype} alert-dismissible fade show px-10`;
    },
    msgContent() {
      return this.alerttype == "success"
        ? `Url converted to ${this.url}`
        : `Sorry URL failed to convert to short format, try again please..`;
    },
  },
  methods: {},
};
</script>

<style scoped></style>
