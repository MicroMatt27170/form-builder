<template>
  <editor-container v-model:column="columnProp">
    <view-input v-model="labelProp"
                placeholder="Título del campo"
                label="Título del campo"
                :uuid="labelInputUuid"
                :column="6" />

    <view-input v-model="nameProp"
                placeholder="Nombre en la base de datos"
                label="Nombre de la propiedad"
                :uuid="nameInputUuid"
                :column="6" />

    <view-input v-model="placeholderProp"
                placeholder="Placeholder"
                label="Placeholder"
                :uuid="placeholderInputUuid"
                :column="6" />

    <view-selector v-model="inputTypeProp"
                   :uuid="inputTypeInputUuid"
                   placeholder="Tipo de entrada"
                   label="Tipo de entrada"
                   :select-options="inputTypeOpts"
                   :column="6"/>

    <template v-slot:example>
      <h5>Ejemplo</h5>
      <view-input :placeholder="placeholder"
                  :validation="validation"
                  :input-type="inputType"
                  :column="12"
                  :label="label"
                  :name="name"
                  :id="uuid"/>
    </template>
  </editor-container>
</template>

<script>
import FormInput from "../forms/ViewInput";
import FormSelector from "../forms/ViewSelector";
import "vue-select/dist/vue-select.css";
import EditorContainer from "./components/EditorContainer";

export default {
  name: "FormInput",
  components: {
    EditorContainer,
    'viewInput': FormInput,
    'viewSelector': FormSelector
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
      nameInputUuid: this.uuidv4(),
      placeholderInputUuid: this.uuidv4(),
      labelInputUuid: this.uuidv4(),
      inputTypeInputUuid: this.uuidv4(),
      inputTypeOpts: [
        { value: 'text', text: 'Texto' },
        { value: 'number', text: 'Número' },
        { value: 'email', text: 'Correo electrónico' },
        { value: 'phone', text: 'Teléfono' },
      ]
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
    labelProp: {
      get() { return this.label },
      set(x) { this.$emit('update:label', x) }
    },
    nameProp: {
      get() { return this.name },
      set(x) { this.$emit('update:name', x) }
    },
    placeholderProp: {
      get() { return this.placeholder },
      set(x) { this.$emit('update:placeholder', x) }
    },
    validationProp: {
      get() { return this.validation },
      set(x) { this.$emit('update:validation', x) }
    }
  },
  methods: {

  }
}
</script>

<style scoped>

</style>