<template>
  <div :class="containerClass">
    <input class="form-check-input"
           type="checkbox"
           :id="uuid"
           :name="name"
           v-model="inputData">
    <label class="form-check-label" v-text="label" :for="uuid"/>
  </div>
</template>

<script>
export default {
  name: "ViewCheckbox",
  props: {
    uuid: String,
    label: String,
    name: String,
    column: {
      default: 12,
      type: Number
    },
    modelValue: {
      type: Boolean
    }
  },
  computed: {
    containerClass() {
      return [
        'mb-3',
        'form-check',
        'col-md-'+this.column
      ]
    },
    inputData: {
      get() { return this.modelValue },
      set(d) { this.$emit('update:modelValue', d) }
    },
  }
}
</script>

<style scoped>
  .form-check {
    padding-left: 2.5rem;
  }
</style>