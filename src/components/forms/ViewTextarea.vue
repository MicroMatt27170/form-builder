<template>
  <div :class="containerClass">
    <label :for="uuid"
           class="form-label text-start w-100"
           v-text="label"></label>
    <textarea class="form-control"
              :id="uuid"
              :name="name"
              :rows="textareaRows"
              :placeholder="placeholder"
              v-model="inputData"></textarea>
  </div>
</template>

<script>
export default {
  name: "ViewTextarea",
  props: {
    uuid: String,
    column: {
      default: 12,
      type: Number
    },
    textareaRows: {
      default: 5,
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
}
</script>

<style scoped>

</style>