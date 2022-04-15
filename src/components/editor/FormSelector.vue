<template>
  <editor-container v-model:column="columnProp">
    <view-input v-model="labelProp"
                placeholder="Título del campo"
                label="Título del campo"
                :uuid="labelInputUuid"
                :column="4" />

    <view-input v-model="nameProp"
                placeholder="Nombre en la base de datos"
                label="Nombre de la propiedad"
                :uuid="nameInputUuid"
                :column="4" />

    <view-selector v-model="inputTypeProp"
                   :column="4"
                   label="Tipo de dato"
                   :select-options="inputTypeOpts"
                   :uuid="inputTypeUuid"/>

    <view-checkbox v-model="isArrayProp"
                   label="Múltiples valores"
                   :column="4"
                   :uuid="isArrayUuid"/>

    <view-checkbox v-model="searchableProp"
                   label="Habilitar Búsqueda"
                   :column="4"
                   :uuid="searchableProp"/>

    <hr>
    <h5>Agregar elementos</h5>
    <div class="col-md-12">
      <div class="row">
        <div class="col-md-4 border-end">
          <view-input v-model="optForm.value"
                      label="Valor"
                      :input-type="inputTypeProp"/>
          <view-input v-model="optForm.text"
                      label="Descripción"/>
          <button class="btn btn-primary"
                  @click="addOptionToList">Agregar</button>
        </div>
        <div class="col-md-8">
          <div v-for="(opt, ind) in selectOptionsProp"
               :key="opt.value"
               class="row border-bottom border-1">
            <div class="col-md border-end">
              <p v-text="opt.value" class="text-end m-2"></p>
            </div>
            <div class="col-md">
              <p v-text="opt.text" class="m-2"></p>
            </div>
            <div class="col-1">
              <button type="button"
                      class="btn-close"
                      @click="removeElementOption(ind)"></button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <template v-slot:example>
      <view-selector v-bind="$props" />
    </template>
  </editor-container>
</template>

<script>
import EditorContainer from "./components/EditorContainer";
import ViewSelector from "../forms/ViewSelector";
import ViewInput from "../forms/ViewInput";
import ViewCheckbox from "../forms/ViewCheckbox";

export default {
  name: "FormSelector",
  components: {
    ViewCheckbox,
    ViewInput,
    EditorContainer,
    ViewSelector
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
    selectOptions: Array,
    validation: {
      default: () => { return {}},
      type: Object
    },
    isArray: Boolean,
    searchable: Boolean
  },
  data() {
    return {
      nameInputUuid: this.uuidv4(),
      inputTypeUuid: this.uuidv4(),
      labelInputUuid: this.uuidv4(),
      inputTypeInputUuid: this.uuidv4(),
      isArrayUuid: this.uuidv4(),
      searchableUuid: this.uuidv4(),

      inputTypeOpts: [
        { text: 'Texto', value: 'text' },
        { text: 'Número', value: 'number' },
      ],

      optForm: {
        text: '',
        value: ''
      }
    }
  },
  computed: {
    columnProp: {
      get() { return this.column },
      set(h) {
        this.$emit('update:column', h)
      }
    },
    inputTypeProp: {
      get() { return this.inputType },
      set(x) { this.$emit('update:inputType', x) }
    },
    isArrayProp: {
      get() { return this.isArray },
      set(x) { this.$emit('update:isArray', x) }
    },
    searchableProp: {
      get() { return this.searchable },
      set(x) { this.$emit('update:searchable', x) }
    },
    labelProp: {
      get() { return this.label },
      set(x) { this.$emit('update:label', x) }
    },
    nameProp: {
      get() { return this.name },
      set(x) { this.$emit('update:name', x) }
    },
    selectOptionsProp: {
      get() { return this.selectOptions },
      set(x) { this.$emit('update:selectOptions', x) }
    },
    validationProp: {
      get() { return this.validation },
      set(x) { this.$emit('update:validation', x) }
    }
  },
  methods: {
    addOptionToList() {
      this.selectOptionsProp.push(this.optForm)
      this.optForm = {
        text: '',
        value: ''
      }
    },
    removeElementOption(ind = 0) {
      if (ind > -1) {
        this.selectOptionsProp.splice(ind, 1)
      }
    }
  }
}
</script>

<style scoped>

</style>