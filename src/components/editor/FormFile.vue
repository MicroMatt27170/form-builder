<template>
  <EditorContainer v-model:column="columnProp">
    <ViewInput v-model="labelProp"
               placeholder="Título del campo"
               label="Título del campo"
               :uuid="labelInputUuid"
               :column="4"/>

    <ViewInput v-model="nameProp"
               placeholder="Nombre en la base de datos"
               label="Nombre de la propiedad"
               :uuid="nameInputUuid"
               :column="4"/>

    <ViewCheckbox v-model="isArrayProp"
                  label="Múltiples valores"
                  :column="4"
                  :uuid="isArrayUuid"/>

    <template v-slot:example>
      <ViewFile v-bind="$props"/>
    </template>
  </EditorContainer>
</template>

<script>
import EditorContainer from "@/components/editor/components/EditorContainer";
import ViewInput from "@/components/forms/ViewInput";
import ViewFile from "@/components/forms/ViewFile";
import ViewCheckbox from "@/components/forms/ViewCheckbox";
export default {
  name: "FormFile",
  components: {ViewCheckbox, ViewFile, ViewInput, EditorContainer},
  props: {
    uuid: String,
    column: {
      default: 12,
      type: Number
    },
    label: String,
    name: String,
    isArray: Boolean,
  },
  data() {
    return {
      nameInputUuid: this.uuidv4(),
      isArrayUuid: this.uuidv4(),
      labelInputUuid: this.uuidv4(),
    }
  },
  computed: {
    columnProp: {
      get() { return this.column },
      set(h) {
        this.$emit('update:column', h)
      }
    },
    isArrayProp: {
      get() { return this.isArray },
      set(x) { this.$emit('update:isArray', x) }
    },
    labelProp: {
      get() { return this.label },
      set(x) { this.$emit('update:label', x) }
    },
    nameProp: {
      get() { return this.name },
      set(x) { this.$emit('update:name', x) }
    },
  }
}
</script>

<style scoped>

</style>