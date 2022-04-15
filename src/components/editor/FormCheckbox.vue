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

    <template v-slot:example>
      <view-checkbox v-bind="$props" />
    </template>
  </editor-container>
</template>

<script>
import EditorContainer from "./components/EditorContainer";
import ViewCheckbox from "../forms/ViewCheckbox";
import ViewInput from "../forms/ViewInput";
export default {
  name: "FormCheckbox",
  components: {ViewInput, ViewCheckbox, EditorContainer},
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
  },
  data() {
    return {
      labelInputUuid: this.uuidv4(),
      nameInputUuid: this.uuidv4(),
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
    nameProp: {
      get() { return this.name },
      set(x) { this.$emit('update:name', x) }
    },
    validationProp: {
      get() { return this.validation },
      set(x) { this.$emit('update:validation', x) }
    }
  }
}
</script>

<style scoped>

</style>