<template>
  <div>
    <div class="row">
      <div class="col-md-8">

      </div>
      <div class="col-md-4">
        <div class="row">
          <view-input :placeholder="placeholder"
                      :validation="validation"
                      :input-type="inputType"
                      :column="column"
                      :label="label"
                      :name="name"
                      :id="id"/>
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
    id: String,
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

  },
  methods: {

  }
}
</script>

<style scoped>

</style>