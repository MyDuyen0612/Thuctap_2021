<template>
    <div class="addproduct">
      <b-form @submit="submit">
        <p v-if="errors.length" style="color: red">
          <b>Please correct the following error(s):</b>
          <ul>
            <li v-for="error in errors" :key="error">{{ error }}</li>
          </ul>
        </p>
        <h4 class="title">Sửa thông tin danh mục</h4>
        <b-row>
          <b-col>
            <b-form-group
              id="name"
              label="Tên danh mục:"
              label-for="name"
            >
              <b-form-input
                id="name"
                v-model="category.name"
                name="name"
                type="text"
                placeholder="Nhập tên danh mục"
                trim
              ></b-form-input>
            </b-form-group>
            <b-button type="submit" variant="primary">Sửa</b-button>
          </b-col>
        </b-row>
      </b-form>
    </div>
</template>

<script>
export default {

  name: "Addproduct",
  data() {
    return {
      errors: [],
      category:{
        name: '',      
      }
    };
  },
  methods: {
    submit: function (e) { 
      e.preventDefault();

      this.errors = [];
      if (!this.category.name) {
        this.errors.push("Nhập tên danh mục");
        return;
      }
    this.axios
        .put("http://127.0.0.1:8000/api/category/"+this.$route.params.id,this.category)
        .then(() => {
          alert("Sửa thành công");
            this.$router.push("category");
        })
        .catch((error) => {
            alert(error);
        });
    },
  },
  mounted(){
        // console.log(this.$route.params.id);
       this.axios
        .get("http://127.0.0.1:8000/api/category/"+this.$route.params.id)
        .then((response) => {
          this.category =response.data;
        })
        .catch((error) => {
            alert(error);
        });
  },
}
</script>

<style lang="scss" scoped>
.title{
  text-align: center;
  font-family: Arial, Helvetica, sans-serif;
}
</style>

