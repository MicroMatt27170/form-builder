<template>
  <div :class="mainClass">
    <div class="container">
      <div class="p-3 w-100">
        <component :is="titleType" v-text="header" />
      </div>
      <div class="row">
        <component v-for="el in content"
                   :is="getComponent(el.type)"
                   v-bind="el"
                   :key="el.uuid">

        </component>
      </div>
    </div>
  </div>
</template>

<script>
 import ViewInput from './ViewInput'
 import ViewSelector from "./ViewSelector";
 import ViewCheckbox from "./ViewCheckbox";
 import ViewTextarea from "./ViewTextarea";
 import ViewRadio from "./ViewRadio";
 import ViewFile from "@/components/forms/ViewFile";
export default {
  name: "ViewContainer",
  props: {
    level: {
      default: 1,
      type: Number
    },
    header: String,
    column: Number,
    content: Array,
    containerDeep: Number
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
        case 'container': return 'ViewContainer'
        case 'input': return ViewInput
        case 'selector': return ViewSelector
        case 'checkbox': return ViewCheckbox
        case 'textarea': return ViewTextarea
        case 'radio': return ViewRadio
        case 'file': return ViewFile
      }
    }
  }
}
</script>

<style scoped>

</style>