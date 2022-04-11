<template>
  <div class="container-fluid">
    <div v-for="el in formDesign" :key="el.uuid">
      <view-container v-if="el.type === 'container'"
                      :level="el.level"
                      :header="el.header"
                      :column="el.column"
                      :content="el.content"/>
    </div>
  </div>
</template>

<script>
import ViewContainer from "./forms/ViewContainer";
export default {
  name: "FormVisualizer",
  components: {ViewContainer},
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
  computed: {
    formDesign: {
      get() { return this.formDesignProp },
      set(f) { this.$emit('update:form-design-prop', f) }
    },

  },
  mounted() {

  },
  methods: {

  }
}
</script>

<style scoped>

</style>