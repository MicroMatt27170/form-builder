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

    <view-input v-model="textareaRowsProp"
                placeholder="Número de filas"
                label="Número de filas"
                :uuid="textareaRowsUuid"
                input-type="number"
                :column="6" />

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

    <ViewTextarea v-model="validationProp.default"
                  placeholder=""
                  label="Valor por defecto"
                  :validation="validationProp"/>

    <template v-slot:example>
      <view-textarea v-bind="$props"/>
    </template>
  </editor-container>
</template>

<script>
import EditorContainer from "./components/EditorContainer";
import ViewTextarea from "../forms/ViewTextarea";
import ViewInput from "../forms/ViewInput";
import ViewCheckbox from "../forms/ViewCheckbox";

export default {
  name: "FormTextarea",
  components: {ViewInput, ViewTextarea, EditorContainer, ViewCheckbox },
  props: {
    uuid: String,
    column: {
      default: 12,
      type: Number
    },
    label: String,
    name: String,
    placeholder: String,
    textareaRows: {
      default: 5,
      type: Number
    },
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
      textareaRowsUuid: this.uuidv4()
    }
  },
  computed: {
    columnProp: {
      get() { return this.column },
      set(h) {
        this.$emit('update:column', h)
      }
    },
    labelProp: {
      get() { return this.label },
      set(x) { this.$emit('update:label', x) }
    },
    textareaRowsProp: {
      get() { return this.textareaRows },
      set(x) { this.$emit('update:textareaRows', x) }
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
}
</script>

<style scoped>

</style>