<template>
  <b-container fluid>
    <b-row>
      <Carousel />
    </b-row>
    <b-row>
      <Product
        v-for="product in listproduct"
        :key="product.id"
        :product="product"
      />
    </b-row>
  </b-container>
</template>

<script>
import Carousel from "../components/Carousel.vue";
import Product from "../components/Product.vue";
export default {
  components: { Carousel, Product },
  data() {
    return {
      isActive: true,
      listproduct: [],
    };
  },
  methods: {
    activeMenu: function () {
      this.isActive = !this.isActive;
    },
  },
  mounted(){
    this.axios
    .get("http://127.0.0.1:8000/api/product")
    .then((response)=>{      
      this.listproduct = response.data.data;
    })
    .catch((error)=>{
      alert(error.response);
    })
  }
};
</script>

<style  scoped>
.vertical-nav {
  min-width: 17rem;
  width: 17rem;
  height: 100vh;
  position: fixed;
  top: 0;
  left: 0;
  box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.1);
  transition: all 0.4s;
}

.page-content {
  width: calc(100% - 17rem);
  margin-left: 17rem;
  transition: all 0.4s;
}

#sidebar.active {
  margin-left: -17rem;
}

#content.active {
  width: 100%;
  margin: 0;
}

@media (max-width: 768px) {
  #sidebar {
    margin-left: -17rem;
  }
  #sidebar.active {
    margin-left: 0;
  }
  #content {
    width: 100%;
    margin: 0;
  }
  #content.active {
    margin-left: 17rem;
    width: calc(100% - 17rem);
  }
}

body {
  background: #599fd9;
  background: -webkit-linear-gradient(to right, #599fd9, #c2e59c);
  background: linear-gradient(to right, #599fd9, #c2e59c);
  min-height: 100vh;
  overflow-x: hidden;
}
</style>