<template>
  <div class="card mt-2">
    <div class="card-header">
      <div class="d-flex">
        <div>

        </div>
        <div class="flex-grow-1">
          <div class="row">
            <label class="col-sm-2 col-form-label text-right">Encabezado</label>
            <div class="col-sm-10">
              <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Encabezado del contenedor" v-model="headerProp">
                <button class="btn btn-outline-secondary dropdown-toggle"
                        type="button"
                        data-bs-toggle="dropdown"
                        aria-expanded="false">Nivel {{ level }}</button>
                <ul class="dropdown-menu dropdown-menu-end">
                  <li><a class="dropdown-item"
                         v-for="type in types"
                         @click="levelProp = type"
                         :key="type">Nivel {{ type }}</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="m-1 ms-3">
          <button type="button" class="btn-close" aria-label="Close"></button>
        </div>
      </div>
    </div>
    <div class="card-body">

    </div>
  </div>
</template>

<script>

export default {
  name: "FormContainer",
  components: {  },
  props: {
    header: String,
    level: Number,
    column: Number,
    content: Array
  },
  data() {
    return {
      types: [1, 2, 3, 4]
    }
  },
  computed: {
    headerProp: {
      get() { return this.header },
      set(h) { this.$emit('update:header', h) }
    },
    levelProp: {
      get() { return this.level },
      set(h) { this.$emit('update:level', h) }
    },
    columnProp: {
      get() { return this.column },
      set(h) { this.$emit('update:column', h) }
    },
    contentProp: {
      get() { return this.content },
      set(c) { this.$emit('update:content', c) }
    }
  }
}
</script>

<style scoped>

</style>