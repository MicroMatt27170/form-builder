<template>
  <div class="modal fade" ref="modal" tabindex="-1">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
        <div class="modal-header">
          <div>
            <slot name="header"></slot>
          </div>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <slot></slot>
        </div>
        <div class="modal-footer">
          <slot name="footer"></slot>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "EditorModal",
  props: {
    show: Boolean
  },
  data() {
    return {
      modal: null
    }
  },
  mounted() {
    // eslint-disable-next-line no-undef
    this.modal = new bootstrap.Modal(this.$refs.modal)

    this.$refs.modal.addEventListener('hide.bs.modal',  () => {
      this.modalShow = false
      this.$emit('on-close')
    })
    this.$refs.modal.addEventListener('show.bs.modal',  () => {
      this.modalShow = true
      this.$emit('on-show')
    })
  },
  methods: {
    showModal() {
      this.modal.show()
    },
    hideModal() {
      this.modal.hide()
    }
  },
  computed: {
    modalShow: {
      get() {
        return this.show
      },
      set(x) {
        this.$emit('update:show', x)
      }
    }
  },
  watch: {
  }
}
</script>

<style scoped>

</style>