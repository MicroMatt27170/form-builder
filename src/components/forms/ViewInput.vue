<template>
  <div :class="containerClass">
    <label :for="uuid"
           class="form-label text-start w-100"
           v-text="label"></label>
    <input :type="inputType"
           class="form-control"
           :id="uuid"
           :name="name"
           :placeholder="placeholder"
           v-model="inputData">
  </div>
</template>

<script>
export default {
  name: "ViewInput",
  props: {
    inputType: {
      default: "text",
      type: String
    },
    uuid: String,
    column: {
      default: 12,
      type: Number
    },
    label: String,
    name: String,
    placeholder: String,
    validation: {
      default: () => { return {}},
      type: Object
    },
    modelValue: {
      type: [String, Number]
    }
  },
  data() {
    return {

    }
  },
  computed: {
    containerClass() {
      return [
          'mb-3',
          'col-md-'+this.column
      ]
    },
    inputData: {
      get() { return this.modelValue },
      set(d) { this.$emit('update:modelValue', d) }
    }
  },
  methods: {

  }
}
</script>

<style scoped>

</style>