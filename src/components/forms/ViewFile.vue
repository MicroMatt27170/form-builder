<template>
  <div :class="containerClass">
    <label :for="uuid" class="form-label" v-text="label"></label>
    <input class="form-control"
           @change="onChangeFile"
           type="file"
           :id="uuid"
           :multiple="isArray"
           :name="name">
  </div>
</template>

<script>
export default {
  name: "ViewFile",
  props: {
    uuid: String,
    column: {
      default: 12,
      type: Number
    },
    label: String,
    name: String,
    isArray: {
      default: false,
      type: Boolean
    },
    validation: {
      default: () => { return {}},
      type: Object
    },
    modelValue: {
      type: [Object, Array]
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
    onChangeFile(event) {
      let fs = event.target.files;
      fs = this.isArray ? fs : fs.length > 0 ? fs[0] : null;
      console.log('file change', fs)
      this.$emit('update:modelValue', fs)
    }
  }
}
</script>

<style scoped>

</style>