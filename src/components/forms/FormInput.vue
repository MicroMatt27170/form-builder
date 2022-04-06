<template>
  <div :class="containerClass">
    <label :for="uuid"
           class="form-label text-start w-100"
           v-text="label"></label>
    <input :type="inputType"
           class="form-control"
           :id="uuid"
           :placeholder="placeholder"
           :value="value"
           @input="onInput">
  </div>
</template>

<script>
export default {
  name: "FormInput",
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
    value: {
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
    }
  },
  methods: {
    onInput(event) {
      this.$emit('input', event)
    }
  }
}
</script>

<style scoped>

</style>