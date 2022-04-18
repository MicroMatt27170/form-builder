<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <div class="collapse navbar-collapse d-flex">
          <button class="btn btn-primary m-2"
                  @click="addContainer()">Agregar contenedor</button>

        </div>
      </div>
    </nav>

    <div class="container">
      <form-container v-for="fd in formDesign"
                      v-bind="fd"
                      v-model:header="fd.header"
                      v-model:level="fd.level"
                      v-model:column="fd.column"
                      v-model:content="fd.content"
                      :container-deep="0"
                      :key="fd.uuid"/>
    </div>


  </div>
</template>

<script>
import FormContainer from "./editor/FormContainer";
import { reactive } from "vue";

export default {
  name: "FormEditor",
  components: {
    FormContainer,
  },
  props: {
    formDesignProp: {
      type: Array,
      default: () => { return [] }
    }
  },
  data() {
    return {

    }
  },
  mounted() {

  },
  methods: {
    addContainer() {
      let c = {
        type: 'container',
        uuid: this.uuidv4(),
        level: 1,
        column: 12,
        header: 'Encabezado '+(this.formDesign.length + 1),
        content: []
      }

      this.formDesign.push(reactive(c))
    },
    uuidv4() {
      return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
          (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
      );
    }
  },
  computed: {
    formDesign: {
      get() { return this.formDesignProp },
      set(f) { this.$emit('update:form-design-prop', f) }
    },

  }
}
</script>

<style scoped>

</style>