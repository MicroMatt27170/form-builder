<template>
  <div class="card mt-2">
    <div class="card-header">
      <div class="d-flex justify-content-between">
        <div>
          <div class="input-group mb-3">
            <span class="input-group-text">Columna(s)</span>
            <select class="form-select me-3" aria-label=".form-select-lg example" v-model="columnProp">
              <option v-for="ind in 12" :value="ind" :key="ind">{{ ind }}</option>
            </select>
          </div>
        </div>
        <div class="m-1 ms-3">
          <button type="button" class="btn-close" aria-label="Close"></button>
        </div>
      </div>

    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-8">

        </div>
        <div class="col-md-4">
          <div class="row">
            <div class="">
              <h5>Ejemplo</h5>
              <view-input :placeholder="placeholder"
                          :validation="validation"
                          :input-type="inputType"
                          :column="column"
                          :label="label"
                          :name="name"
                          :id="uuid"/>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import FormInput from "../forms/FormInput";

export default {
  name: "FormInput",
  components: {
    'viewInput': FormInput
  },
  props: {
    inputType: {
      type: String,
      default: 'text'
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
  },
  data() {
    return {

    }
  },
  computed: {
    columnProp: {
      get() { return this.column },
      set(h) {
        console.log('column updated!', h);
        this.$emit('update:column', h)
      }
    },
  },
  methods: {

  }
}
</script>

<style scoped>

</style>