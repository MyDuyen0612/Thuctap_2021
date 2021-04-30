<template>
  <div class="Product">
    <div class="row h-100">
      <div class="col-md-12">
        <h3 class="title">Danh sách danh mục</h3>

        <b-button pill class="addcategory" v-b-modal.modal-center>
          <b-icon icon="plus" scale="2" variant="white"></b-icon>
        </b-button>

        <Inputtable
          :items="listCategory"
          :fields="fields"
          :actions="actions"
          :isAdd="false"
          v-on:render="renderload"
          style="z-index: 2"
        />
      </div>
    </div>

    <!-- Thêm Danh mục -->
    <b-modal
      id="modal-center"
      centered
      title="Thêm danh mục"
      @show="resetModal"
      @hidden="resetModal"
      @ok="handleOk"
      ok-only
      ok-title="Thêm"
      ok-variant="success"
      footer-border-variant="white"
      header-border-variant="white"
    >
      <form ref="form" @submit.stop.prevent="handleSubmit" method="post">
        <b-form-group
          invalid-feedback="Tên danh mục không được để trống"
          :state="nameState"
        >
          <b-form-input
            id="name-input"
            v-model="addcategory.name"
            placeholder="Tên danh mục"
            :state="nameState"
            required
          ></b-form-input>
        </b-form-group>
      </form>
    </b-modal>
  </div>
</template>

<script>
import Inputtable from "../../components/Inputtable.vue";
export default {
  name: "Product",
  components: {
    Inputtable,
  },
  data() {
    return {
      listCategory: [], //biến lưu danh sách danh mục

      actions: "danhmuc",
      nameState: null,

      addcategory: {
        name: "",
      },

      fields: [
        {
          key: "id",
          label: "Mã Danh mục",
        },
        {
          key: "name",
          label: "Tên Danh mục",
        },
        {
          key: "action",
          label: "Hành động",
        },
      ],
    };
  },
  mounted() {
    this.axios
      .get("http://127.0.0.1:8000/api/category")
      .then((response) => {
        this.listCategory = response.data;
      })
      .catch((error) => {
        this.message = error;
      });
  },
  methods: {
    checkFormValidity() {
      const valid = this.$refs.form.checkValidity();
      this.nameState = valid;
      return valid;
    },
    resetModal() {
      this.addcategory.name = "";
      this.nameState = null;
    },
    handleOk(bvModalEvt) {
      // Ngăn chặn phương thức đóng
      bvModalEvt.preventDefault();
      // Xử lý sự kiện handleSubmit
      this.handleSubmit();
    },
    handleSubmit() {
      // Thoát khỏi form có giá trị sai
      if (!this.checkFormValidity()) {
        return;
      } else {
        this.axios
          .post("http://127.0.0.1:8000/api/category", this.addcategory)
          .then(() => {
            alert("Thêm thành công");
            this.renderload();
          })
          .catch((error) => {
            alert(error);
          });
      }
      // Ẩn model
      this.$nextTick(() => {
        this.$bvModal.hide("modal-center");
      });
    },
    renderload() {
      this.axios
        .get("http://127.0.0.1:8000/api/category")
        .then((response) => {
          this.listCategory = response.data;
        })
        .catch((error) => {
          this.message = error;
        });
    },
  },
};
</script>

<style lang="scss" scoped>
.form-group {
  input {
    font-size: 18px;
    padding: 10px 10px 10px 10px;
    display: block;
    width: 100%;
    border: none;
    border-bottom: 2px solid rgba(0, 0, 0, 0.3);
    background: none;
  }
}
.title {
  text-align: center;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
}
.addcategory {
  background-color: green;
  margin: 10px;
}
</style>
