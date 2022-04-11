<template>
  <editor-container>

    <template v-slot:example>
      <h4>Ejemplo</h4>
      <view-selector/>
    </template>
  </editor-container>
</template>

<script>
import EditorContainer from "./components/EditorContainer";
import ViewSelector from "../forms/ViewSelector";

export default {
  name: "FormSelector",
  components: {
    EditorContainer,
    ViewSelector
  }
}
</script>

<style scoped>

</style>