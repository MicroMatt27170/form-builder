<template>
  <div :class="containerClass">
    <label :for="uuid"
           class="form-label text-start w-100"
           v-text="label"></label>
    <select class="form-control"
            v-if="isVanilla"
            :id="uuid"
            :name="name"
            v-model="inputData">
      <option v-for="opt in selectOptions"
              :key="opt.value"
              :value="opt.value"
              v-text="opt.text"></option>
    </select>
    <v-select v-model="inputData"
              :options="selectOptions"
              :reduce="data => data.value"
              label="text"
              v-else/>
  </div>
</template>

<script>
import vSelect from "vue-select";

export default {
  name: "ViewSelector",
  components: {vSelect},
  props: {
    uuid: String,
    label: String,
    name: String,
    column: {
      default: 12,
      type: Number
    },
    validation: {
      default: () => { return {}},
      type: Object
    },
    modelValue: {
      type: [String, Number, Array]
    },
    selectOptions: Array,
    isArray: {
      default: false,
      type: Boolean
    },
    searchable: {
      default: false,
      type: Boolean
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
    },
    isVanilla() {
      return !this.isArray && !this.searchable
    }
  }
}
</script>

<style scoped>

</style>