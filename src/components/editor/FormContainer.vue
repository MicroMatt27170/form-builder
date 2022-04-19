<template>
  <div class="card mt-2">
    <div class="card-header">
      <div class="d-flex">
        <div>
          <div class="input-group mb-3">
            <span class="input-group-text">Columna(s)</span>
            <select class="form-select me-3" aria-label=".form-select-lg example" v-model="columnProp">
              <option v-for="ind in 12" :value="ind" :key="ind">{{ ind }}</option>
            </select>
          </div>
        </div>
        <div class="flex-grow-1">
          <div class="row">
            <label class="col-md-3 col-form-label text-end">Encabezado</label>
            <div class="col-md-9">
              <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Encabezado del contenedor" v-model="headerProp">
                <button class="btn btn-secondary dropdown-toggle"
                        type="button"
                        data-bs-toggle="dropdown"
                        aria-expanded="false">Nivel {{ level }}</button>
                <ul class="dropdown-menu dropdown-menu-end">
                  <li><a class="dropdown-item"
                         v-for="type in types"
                         @click="levelProp = type"
                         :key="type">Nivel {{ type }}</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="m-1 ms-3">
          <button type="button"
                  class="btn-close"
                  aria-label="Close"
                  @click="$emit('close')"></button>
        </div>
      </div>
    </div>
    <div class="card-header">
      <div class="d-flex flex-row p-2">
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
          <div class="btn-group btn-group-sm me-2 mt-1" role="group" aria-label="Contenedores">
            <button @click="addContainer" type="button" class="btn btn-primary">+ Contenedor</button>
          </div>
          <div class="btn-group btn-group-sm me-2 mt-1" role="group" aria-label="Texto">
            <button class="btn btn-outline-secondary"
                    type="button"
                    @click="addInput">Texto</button>
            <button class="btn btn-outline-secondary"
                    type="button"
                    @click="addTextarea">Párrafo</button>
          </div>

          <div class="btn-group btn-group-sm me-2 mt-1" role="group" aria-label="Número">
            <button class="btn btn-outline-secondary"
                    type="button"
                    @click="addSelector">Selector</button>
            <button class="btn btn-outline-secondary"
                    type="button" @click="addRadio">Radio</button>
            <button class="btn btn-outline-secondary"
                    type="button"
                    @click="addCheckbox">Casillas</button>
          </div>

          <div class="btn-group btn-group-sm me-2 mt-1" role="group" aria-label="Archivo">
            <button class="btn btn-outline-secondary"
                    type="button"
                    @click="addFile">Archivo</button>
          </div>
        </div>
      </div>
    </div>
    <div class="card-body">
      <div class="row">
        <component v-for="element in contentProp"
                   :is="getComponentView(element.type)"
                   :container-deep="containerDeep + 1"
                   @edit="editElementUuid = $event"
                   @close="removeElementEditor(element.uuid)"
                   :key="element.uuid"
                   v-model:header="element.header"
                   v-model:level="element.level"
                   v-model:column="element.column"
                   v-model:content="element.content"
                   v-bind="element"/>
      </div>

      <editor-modal v-model:show="modalShow"
                    @on-close="editElementUuid = null"
                    ref="editModal">
        <component v-if="editSelected != null"
                   :is="getComponent(editSelected.type)"
                   :container-deep="containerDeep + 1"
                   v-model:header="editSelected.header"
                   v-model:level="editSelected.level"
                   v-model:column="editSelected.column"
                   v-model:content="editSelected.content"
                   v-model:inputType="editSelected.inputType"
                   v-model:uuid="editSelected.uuid"
                   v-model:label="editSelected.label"
                   v-model:name="editSelected.name"
                   v-model:placeholder="editSelected.placeholder"
                   v-model:validation="editSelected.validation"
                   v-model:selectOptions="editSelected.selectOptions"
                   v-model:isArray="editSelected.isArray"
                   v-model:searchable="editSelected.searchable"
                   v-model:textareaRows="editSelected.textareaRows"
                   v-model:radioInline="editSelected.radioInline"
                   v-bind="editSelected">

        </component>
      </editor-modal>

    </div>
  </div>
</template>

<script>
import FormInput from "./FormInput";
import FormSelector from "./FormSelector";

import {reactive} from "vue";
import EditorElement from "./components/EditorElement";
import EditorModal from "./components/EditorModal";
import FormCheckbox from "./FormCheckbox";
import FormTextarea from "./FormTextarea";
import FormRadio from "./FormRadio";
import FormFile from "@/components/editor/FormFile";

export default {
  name: "FormContainer",
  components: {EditorModal, EditorElement, FormInput },
  props: {
    header: String,
    level: Number,
    column: Number,
    content: Array,
    containerDeep: Number
  },
  data() {
    return {
      types: [1, 2, 3, 4],
      elementUuid: null,
      modalShow: false,
    }
  },
  computed: {
    editElementUuid: {
      get() { return  this.elementUuid },
      set(uuid) {
        let x = this.content.find(f => f.uuid === uuid)
        if (x == null) {
          this.elementUuid = null
        }
        else {
          this.$refs.editModal.showModal()
          this.elementUuid = uuid
        }
      }
    },
    headerProp: {
      get() { return this.header },
      set(h) { this.$emit('update:header', h) }
    },
    levelProp: {
      get() { return this.level },
      set(h) { this.$emit('update:level', h) }
    },
    columnProp: {
      get() { return this.column },
      set(h) { this.$emit('update:column', h) }
    },
    contentProp: {
      get() { return this.content },
      set(c) { this.$emit('update:content', c) }
    },
    editSelected() {
      return this.content.find(f => f.uuid === this.editElementUuid)
    },
  },
  methods: {
    getComponentView(type) {
      return (type === 'container') ? 'FormContainer' : EditorElement
    },
    removeElementEditor(uuid) {
      let ind = this.contentProp.findIndex(f => f.uuid === uuid)

      if (ind > -1) {
        this.contentProp.splice(ind, 1)
      }
    },
    getComponent(type) {
      switch (type) {
        case 'container': return 'FormContainer'
        case 'input': return FormInput
        case 'selector': return FormSelector
        case 'checkbox': return FormCheckbox
        case 'textarea': return FormTextarea
        case 'radio': return FormRadio
        case 'file': return FormFile
        default: return null
      }
    },
    addInput() {
      this.contentProp.push(reactive({
        type: 'input',
        inputType: 'text',
        uuid: this.uuidv4(),
        column: 12,
        label: 'Formulario',
        name: 'input_prop_'+this.content.length+'_'+this.randNum(),
        placeholder: '',
        validation: {
          min: 0,
          max: 255,
          nullable: false,
          required: false,
          default: null,
        }
      }))
    },
    addTextarea() {
      this.contentProp.push(reactive({
        type: 'textarea',
        uuid: this.uuidv4(),
        column: 12,
        textareaRows: 5,
        label: 'Formulario',
        name: 'textarea_prop_'+this.content.length+'_'+this.randNum(),
        placeholder: '',
        validation: {
          min: 0,
          max: 255,
          nullable: false,
          required: false,
          default: null,
        }
      }))
    },
    addCheckbox() {
      this.contentProp.push(reactive({
        type: 'checkbox',
        uuid: this.uuidv4(),
        label: 'Casilla',
        name: 'checkbox_prop_'+this.content.length+'_'+this.randNum(),
        column: 12,
        validation: {
          nullable: false,
          required: false,
          default: false
        }
      }))
    },
    addSelector() {
      this.contentProp.push(reactive({
        type: 'selector',
        inputType: 'text',
        uuid: this.uuidv4(),
        column: 12,
        label: 'Selector',
        selectOptions: [],
        name: 'selector_prop_'+this.content.length+'_'+this.randNum(),
        isArray: false,
        searchable: false,
        validation: {
          nullable: false,
          required: false,
          default: null,
        }
      }))
    },
    addFile() {
      this.contentProp.push(reactive({
        type: 'file',
        uuid: this.uuidv4(),
        column: 12,
        label: 'Archivo',
        name: 'file_prop_'+this.content.length+'_'+this.randNum(),
        isArray: false,
        validation: {
          nullable: false,
          required: false,
          default: null,
        }
      }))
    },
    addRadio() {
      this.contentProp.push(reactive({
        type: 'radio',
        uuid: this.uuidv4(),
        name: 'radio_prop_'+this.content.length+'_'+this.randNum(),
        column: 12,
        radioInline: false,
        label: 'Radio',
        selectOptions: [],
        validation: {
          nullable: false,
          required: false,
          default: null,
        }
      }))
    },
    addContainer() {
      this.contentProp.push(reactive({
        type: 'container',
        uuid: this.uuidv4(),
        level: this.containerDeep >= 3 ? 4 : this.containerDeep + 1,
        column: 12,
        header: 'Encabezado '+(this.contentProp.filter(c => c.type === 'container').length + 1),
        content: []
      }))
    },
    uuidv4() {
      return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
          (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
      );
    },
    randNum(l = 4) {
      return parseInt((Math.random() * (10 ** l)).toString())
    }
  }
}
</script>

<style scoped>

</style>