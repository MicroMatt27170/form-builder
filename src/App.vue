<template>
  <div id="app">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li :class="'nav-item ' + (isEditor ? 'active text-bold': '')">
            <a class="nav-link" aria-current="page" @click="view = 'editor'">Editor</a>
          </li>
          <li :class="'nav-item ' + (isForm ? 'active text-bold' : '')">
            <a class="nav-link" aria-current="page" @click="view = 'form'">Formulario</a>
          </li>
          <li :class="'nav-item ' + (isForm ? 'active text-bold' : '')">
            <a class="nav-link" aria-current="page" @click="view = 'editor-json'">Json</a>
          </li>
        </ul>
      </div>
    </nav>
    <div class="container-fluid" v-if="isEditor">
      <form-editor v-model:form-design-prop="formDesign.forms"/>
    </div>
    <div class="container-fluid" v-if="isForm">
      <form-visualizer :form-design-prop="formDesign.forms"/>
    </div>
    <div class="container-fluid" v-if="isJsonEditor">
      <CodeEditor v-model="jsonFormDesign" width="100%" height="800px"/>
    </div>
  </div>
</template>

<script>
import FormEditor from "./components/FormEditor";
import FormVisualizer from "./components/FormVisualizer";
import {reactive} from "vue";
import CodeEditor from 'simple-code-editor';

export default {
  name: 'App',
  components: {
    FormVisualizer,
    FormEditor,
    CodeEditor
  },
  props: {

  },
  data() {
    return {

      formDesign: {
        tableName: '',
        title: '',
        forms: []
      },
      view: 'editor'
    }
  },
  computed: {
    isEditor() { return this.view === 'editor' },
    isForm() { return this.view === 'form' },
    isJsonEditor() { return this.view === 'editor-json' },
    jsonFormDesign: {
      get() {
        return JSON.stringify(this.formDesign)
      },
      set(x) {
        try {
          let arr = JSON.parse(x)
          this.formDesign = reactive(arr)
        }catch (e) {
          console.log(e)
        }
      }
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
</style>
