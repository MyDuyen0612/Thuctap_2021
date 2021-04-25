<template>
  <div class="Product">
    <div class="row h-100">
      <div class="col-md-12">
        <h3 class="title">Danh sách sản phẩm</h3>
        <Inputtable :items="product" :fields="fields" style="z-index: 2" :link="link" :actions="actions" v-on:render="renderload"/>
      </div>
      
    </div>
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
      link: 'addproduct',
      actions: 'sanpham',
      isLoaded: false,
      product: [],
      fields: [
        {
          key: "id",
          label: "ID Sản phẩm",
        },
        {
          key: "name",
          label: "Tên sản phẩm",
        },
        {
          key: "name",
          label: "Tên sản phẩm",
        },
        {
          key: "describe",
          label: "Mô tả",
        },
        {
          key: "price",
          label: "Giá",
        },
        {
          key: "status",
          label: "Tình trạng",
        },
         
        {
          key: "action",
          label: "Hành động",
        },
      ],
    };
  },
   mounted(){
       this.axios
        .get("http://127.0.0.1:8000/api/product")
        .then((response) => {
          this.product =response.data.data
        })
        .catch((error) => {
         this.message = error;
        });
  },
  methods:{
    renderload(){
       this.axios
        .get("http://127.0.0.1:8000/api/product")
        .then((response) => {
          this.product =response.data.data
        })
        .catch((error) => {
         this.message = error;
        });
    }
  }
};
</script>

<style  scoped>
.title{
  text-align: center;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
}
</style>