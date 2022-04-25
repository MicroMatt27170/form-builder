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

    <hr>

    <ViewInput v-model="validationProp.min"
               placeholder="0"
               label="Valor mínimo"
               input-type="number"
               :column="4"
               :validation="{min: 0, max: validationProp.max}"/>


    <ViewInput v-model="validationProp.max"
               placeholder="255"
               label="Valor mínimo"
               input-type="number"
               :column="4"
               :validation="{min: validationProp.max, max: null}"/>

    <ViewCheckbox v-model="validationProp.nullable"
                  label="Nulo permitido"
                  :column="4"/>

    <ViewInput v-model="validationProp.default"
               placeholder=""
               label="Valor por defecto"
               :input-type="inputTypeProp"
               :validation="validationProp"/>


    <template v-slot:example>
      <view-input v-bind="$props"/>
    </template>
  </editor-container>
</template>

<script>
import ViewInput from "../forms/ViewInput";
import ViewSelector from "../forms/ViewSelector";
import "vue-select/dist/vue-select.css";
import EditorContainer from "./components/EditorContainer";
import ViewCheckbox from "../forms/ViewCheckbox";
import {ref} from "vue";

export default {
  name: "FormInput",
  components: {
    ViewCheckbox,
    EditorContainer,
    ViewInput,
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
    },
    validationMin: {
      get() { return this.validation.min },
      set(x) { this.validationProp.min = ref(x) }
    }
  },
  methods: {

  }
}
</script>

<style scoped>

</style>