<template>
  <div :class="divClass">
    <div class="p-2 m-1 rounded" :style="divStyle">
      <div class="d-flex">
        <h4 v-text="type" class="flex-fill"></h4>
        <select v-model="columnProp" class="">
          <option v-for="x in 12"
                  :key="x"
                  :value="x"
                  v-text="x"></option>
        </select>
        <button class="btn btn-outline-primary btn-sm"
                @click="editInput(uuid)">
          ✏️
        </button>
        <button class="btn btn-close ms-2" @click="deleteEditor"></button>
      </div>
      <p class="card-subtitle" v-text="label"></p>
      <p class="card-subtitle" v-text="name"></p>

    </div>
  </div>
</template>

<script>
export default {
  name: "EditorElement",
  props: {
    column: {
      default: 12,
      type: Number
    },
    label: String,
    type: String,
    name: String,
    uuid: String
  },
  computed: {
    columnProp: {
      get() { return this.column },
      set(x){ this.$emit('update:column', x )}
    },
    color() {
      switch (this.type) {
        case 'input': return '#1ca1c2'
        case 'selector': return '#c045db'
        case 'checkbox': return '#7ed527'
        case 'textarea': return '#0f6ab8'
        default: return '#c49741'
      }
    },
    divStyle() {
      return {
        border: '4px solid '+this.color
      }
    },
    divClass() {
      return [
          'col-md-'+this.column
      ]
    }
  },
  methods: {
    editInput() {
      this.$emit('edit', this.uuid)
    },
    deleteEditor() {
      this.$emit('close')
    }
  }
}
</script>

<style scoped>

</style>