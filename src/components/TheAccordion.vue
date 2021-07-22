<template>
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
          <slot></slot>
        </button>
      </h2>
      <div
        id="flush-collapseTwo"
        class="accordion-collapse collapse"
        aria-labelledby="flush-headingTwo"
        data-bs-parent="#accordionFlush"
      >
        <div class="accordion-body" style="text-align: left">
          <slot name="content"></slot>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  props: ["header", "body"],
};
</script>

<style scoped>
#accordionFlush {
  padding-bottom: 20px;
}
</style>
