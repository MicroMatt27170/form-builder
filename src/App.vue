<template>
  <div id="app">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li :class="'nav-item ' + (isEditor ? 'active text-bold': '')">
            <a class="nav-link" aria-current="page" @click="isEditor = true">Editor</a>
          </li>
          <li :class="'nav-item ' + (isEditor ? '': 'active text-bold')">
            <a class="nav-link" aria-current="page" @click="isEditor = false">Formulario</a>
          </li>
        </ul>
      </div>
    </nav>
    <div class="container-fluid" v-if="isEditor">
      <form-editor :form-design-prop.sync="formDesign"/>
    </div>
    <div class="container-fluid" v-else>
      <form-visualizer />
    </div>
  </div>
</template>

<script>
import FormEditor from "./components/FormEditor";
import FormVisualizer from "./components/FormVisualizer";
export default {
  name: 'App',
  components: {
    FormVisualizer,
    FormEditor

  },
  props: {

  },
  data() {
    return {
      isEditor: true,
      formDesign: []
    }
  },
  computed: {

  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
