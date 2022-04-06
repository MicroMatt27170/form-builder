<template>
  <div :class="mainClass">
    <div class="container">
      <div class="p-3 w-100">
        <component :is="titleType" v-text="header" />
      </div>
      <div class="row">
        <component v-for="el in content"
                   :is="getComponent(el.type)"
                   :key="el.uuid"
                   :level="el.level"
                   :header="el.header"
                   :column="el.column"
                   :content="el.content">

        </component>
      </div>
    </div>
  </div>
</template>

<script>
 import FormInput from '../editor/FormInput'
export default {
  name: "FormContainer",
  props: {
    level: {
      default: 1,
      type: Number
    },
    header: String,
    column: Number,
    content: Array
  },
  computed: {
    titleType() {
      return 'h'+this.level
    },
    mainClass() {
      return 'col-md-'+this.column
    }
  },
  methods: {
    getComponent(type) {
      switch (type) {
        case 'container': return 'FormContainer'
        case 'editor': return FormInput
      }
    }
  }
}
</script>

<style scoped>

</style>