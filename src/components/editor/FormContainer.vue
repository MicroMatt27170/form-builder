<template>
  <div class="card mt-2">
    <div class="card-header">
      <div class="d-flex">
        <div>
          <div class="input-group mb-3">
            <span class="input-group-text">Columna(s)</span>
            <select class="form-select me-3" aria-label=".form-select-lg example" v-model="columnProp">
              <option v-for="ind in 12" :value="ind" :key="ind">{{ ind }}</option>
            </select>
          </div>
        </div>
        <div class="flex-grow-1">
          <div class="row">
            <label class="col-md-3 col-form-label text-end">Encabezado</label>
            <div class="col-md-9">
              <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Encabezado del contenedor" v-model="headerProp">
                <button class="btn btn-secondary dropdown-toggle"
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
    <div class="card-header">
      <div class="d-flex flex-row p-2">
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
          <div class="btn-group btn-group-sm me-2 mt-1" role="group" aria-label="Contenedores">
            <button @click="addContainer" type="button" class="btn btn-primary">+ Contenedor</button>
          </div>
          <div class="btn-group btn-group-sm me-2 mt-1" role="group" aria-label="Texto">
            <button type="button" class="btn btn-outline-secondary" @click="addInput">Texto</button>
            <button type="button" class="btn btn-outline-secondary">Párrafo</button>
            <button type="button" class="btn btn-outline-secondary">Texto Largo</button>
          </div>
          <div class="btn-group btn-group-sm me-2 mt-1" role="group" aria-label="Número">
            <button type="button" class="btn btn-outline-secondary">Número</button>
            <button type="button" class="btn btn-outline-secondary">Rango Númerico</button>
          </div>
          <div class="btn-group btn-group-sm me-2 mt-1" role="group" aria-label="Número">
            <button type="button" class="btn btn-outline-secondary">Selector</button>
            <button type="button" class="btn btn-outline-secondary">Radio</button>
            <button type="button" class="btn btn-outline-secondary">Casillas</button>
          </div>
        </div>
      </div>
    </div>
    <div class="card-body">
      <component v-for="element in content"
                 :is="getComponent(element.type)"
                 v-bind="element"
                 :key="element.uuid">

      </component>

    </div>
  </div>
</template>

<script>
import FormInput from "./FormInput";

export default {
  name: "FormContainer",
  components: { FormInput },
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
  },
  methods: {
    getComponent(type) {
      switch (type) {
        case 'container': return 'FormContainer'
        case 'input': return FormInput
        default: return null
      }
    },
    addInput() {

      let obj = {
        type: 'input',
        inputType: 'text',
        uuid: this.uuidv4(),
        column: 12,
        label: 'Formulario',
        name: 'input-prop-'+this.content.length,
        placeholder: '',
        validation: {
          min: 0,
          max: 255,
          nullable: false,
          required: false,
          default: null,
        }
      }

      let len = this.contentProp.push(obj)

      this.$set(this.contentProp, len - 1, obj)
    },
    addContainer() {
      let c = {
        type: 'container',
        uuid: this.uuidv4(),
        level: 2,
        column: 12,
        header: 'Encabezado '+(this.contentProp.filter(c => c.type === 'container').length + 1),
        content: []
      }

      let len = this.contentProp.push(c)

      this.$set(this.contentProp, len - 1, c)
    },
    uuidv4() {
      return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
          (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
      );
    }
  }
}
</script>

<style scoped>

</style>