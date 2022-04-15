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
<!--          <button type="button" class="btn-close" aria-label="Close"></button>-->
        </div>
      </div>

    </div>

    <div class="card-body">
      <div class="row">
        <div class="col-md-12">
          <div class="row">
            <h5 v-text="exampleTitle"></h5>
            <slot name="example"></slot>
          </div>
        </div>
        <hr>
        <div class="col-md-12">
          <div class="row">
            <slot></slot>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "EditorContainer",
  props: {
    column: Number,
    exampleTitle: {
      default: 'Ejemplo',
      type: String
    }
  },
  computed: {
    columnProp: {
      get() { return this.column },
      set(x) { this.$emit('update:column', x) }
    }
  }
}
</script>

<style scoped>

</style>