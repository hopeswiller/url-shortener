<template>
  <div :class="msgtype" role="alert" id="notify">
    <strong>{{ alerttype.toUpperCase() || "INFO" }}!</strong> {{ msgContent }}
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
    mod: {
      type: String,
      required: false,
      default: "shorten",
    },
  },
  computed: {
    msgtype() {
      return `alert alert-${
        this.alerttype || "info"
      } alert-dismissible fade show`;
    },
    msgContent() {
      if (this.alerttype === "success") {
        if (this.url != "") {
          return `Url converted to ${this.url}`;
        } else if (this.mod === "delete") {
          return "Your request has been accepted for processing..";
        } else if (this.mod === "stats") {
          return "Stats show below..";
        } else {
          return "...";
        }
      } else {
        return `Action failed, try again please`;
      }
    },
  },
  methods: {},
};
</script>

<style scoped>
#notify {
  margin: 10px;
}
</style>
