<template >
  <b-container fluid>
    <b-row>
      <div class="col-lg-6 col-md-12 col-sm-12">
        <image-magnifier class="img"
          :src="imgActive"
          :zoom-src="imgActive"
          width="100%"
          height="100%"
          zoom-width="450"
          zoom-height="350"
        /> 
      </div>

      <div class="col-lg-6 col-md-12 col-sm-12">
        <div class="wrapper">
          <div class="outer">
            <div class="content">
              <span class="product__content"> {{ product.name }}</span>

              <div class="colors-wrap">
                <h6>Color:</h6>
                <span
                  class="colors"
                  v-for="(colorItem, colorIndex) in colors"
                  :key="colorIndex"
                  :style="{ background: colorItem.code }"
                  @click="ColorActive(colorItem,colorIndex)"
                  :class="colorActive.code == colorItem.code ? 'selected' : ''"
                ></span>
              </div>

              <div class="size-wrap">
                <h6>Size:</h6>
                <span
                  class="size"
                  v-for="(itemSize, itemIndex) in sizes"
                  :key="itemIndex"
                  :value="itemSize"
                  @click="SizeActive(itemSize)"
                  :class="sizeAcive.id == itemSize.id ? 'selected' : ''"
                  >{{ itemSize.name }}</span
                >
              </div>
              <div class="button">
                <span
                  >&emsp;
                  <a href="#"> {{ product.price.toLocaleString()}} đ</a>
                  <a
                    class="cart-btn" @click="addCart()"
                  >
                    <i class="fa fa-plus cart-icon" ></i>Thêm vào giỏ</a
                  >
                </span>
              </div>
            </div>
          </div>
        </div>
        <div>
          <b-tabs
            active-nav-item-class="font-weight-bold text-uppercase text-success"
            active-tab-class="font-weight-bold "
          >
            <b-tab title="Mô tả" active
              ><p>{{ product.describe }}</p></b-tab
            >
            <b-tab title="Đánh giá"
              ><p>0 ĐÁNH GIÁ CHO {{ product.name }}</p></b-tab
            >
            <b-tab title="Bình luận"
              ><p>0 BÌNH LUẬN CHO {{ product.name }}</p></b-tab
            >
          </b-tabs>
        </div>
      </div>
      <div class="sameproduct">
          <h3>Danh mục sản phẩm cùng loại</h3>
           <b-row>
            <Product
              v-for="product in sameproduct"
              :key="product.id"
              :product="product"
            />
          </b-row>
      </div>
    </b-row>
  </b-container>
</template>

<script>
import Product from '../components/Product.vue'
import swal from 'sweetalert';
export default {
  name: "Productdetail",
  data() {
    return {
      colors: [],
      sizes: [],
      colorActive: {},
      sizeAcive: {},
      imgActive: "",
      product: {
        name: "",
        price: 0,
        describe: "",
        category: {},
        color: [
          {
            name: "",
            code: "",
            image: "", //ten file hinh cua color
            size: [
              {
                name: "",
                amount: 12,
              },
            ],
          },
        ],
      },
      isActive: true,
      sameproduct:[],
    };
  },
  components:{
    Product
  },
  methods: {
    activeMenu: function () {
      this.isActive = !this.isActive;
    },
    ColorActive: function (colorItem,colorIndex) {
      this.colorActive = colorItem;
      this.imgActive = this.product.color[colorIndex].urlimg;
      this.sizes = this.product.color[colorIndex].size;
      this.sizeAcive = this.product.color[colorIndex].size[0];
    },
    SizeActive: function (itemSize) {
      this.sizeAcive = itemSize;
    },
    addCart(){
      const cartItem = {
        id: this.product.id,
        name: this.product.name,
        size: this.sizeAcive,
        color: this.colorActive,
        img: this.imgActive,
        price: this.product.price,
        quantity: 1
      };
      this.$store.dispatch("addProdcutToCart", cartItem);
      swal("Đã thêm vào giỏ thành công!");
    }
  },
  created() {
   this.axios
    .get("http://127.0.0.1:8000/api/product/"+this.$route.params.url)
    .then((response)=>{
      this.product = response.data.data;
      this.colors = this.product.color;
      this.sizes = this.product.color[0].size;
      this.colorActive = this.product.color[0];
      this.sizeAcive = this.product.color[0].size[0];
      this.imgActive = this.product.color[0].urlimg;
    })
    .catch((error) => {
      console.log(error);
    });

    this.axios
    .get("http://127.0.0.1:8000/api/same/"+this.$route.params.url)
    .then((response)=>{
      this.sameproduct = response.data.data;
    })
    .catch((error) => {
      console.log(error);
    })
  }
}
</script>

<style scoped>
.wrapper {
  display: flex;
  align-items: center;
  justify-content: space-around;
  width: 100%;
  height: 60vh;
  margin-top: 10%;
}
.outer {
  position: relative;
  background-color: #fff;
  height: 100%;
  width: 100%;
  overflow: hidden;
  display: flex;
  align-items: center;
  border-radius: 10px;
  margin-top: -40px;
}
p {
  width: 280px;
  font-size: 13px;
  line-height: 1.4;
  color: #aaa;
  margin: 20px 0;
}
.img {
  /* position: absolute; */
  top: 0px;
  right: 0px;
  width: 100%;
  margin-top: -15px;
  height: 85%;
}
.content {
  position: relative;
  left: 20px;
  z-index: 3;
  margin-top: -20%;
  text-align: left;
}
.bg {
  display: inline-block;
  overflow: hidden;
  position: relative;
  font-size: 15px;

  color: #fff;
  background-color: red;
  text-decoration: none;
  padding: 10px 10px;
  border: 1px solid #aaa;
  font-weight: bold;
  border-radius: 25px;
}
.button {
  width: fit-content;
  height: fit-content;
  margin-top: 10px;
}
.button a {
  display: inline-block;
  overflow: hidden;
  position: relative;
  font-size: 15px;
  color: #111;
  text-decoration: none;
  padding: 10px 10px;
  border: 1px solid #aaa;
  font-weight: bold;
}
.button a:after {
  content: "";
  position: absolute;
  top: 0;
  right: -10px;
  width: 0%;
  background-color: #111;
  height: 100%;
  z-index: -1;
  transition: width 0.3s ease-in-out;
  transform: skew(-25deg);
  transform-origin: right;
}
.product__content {
  font-size: 2.5em;
}
.button a:hover:after {
  width: 150%;
  left: -10px;
  transform-origin: left;
}
.button a:hover {
  color: #fff;
  transition: all 0.5s ease;
}
.button a:nth-of-type(1) {
  border-radius: 50px 0 0 50px;
  border-right: none;
}
.button a:nth-of-type(2) {
  border-radius: 0px 50px 50px 0;
}
.cart-icon {
  padding-right: 8px;
}
@media (max-width: 768px) {
  .outer {
    width: 95%;
    margin-top: 0;
  }
  .content {
    left: 50%;
    transform: translateX(-40%);
  }

  .img {
    /* display: none; */
    width: 100%;
    margin-top: 0px !important;
  }
  .product__content {
    font-size: 1em;
  }
}
.colors {
  width: 20px;
  height: 20px;
  display: inline-block;
  transition: 0.3s all;
  border-radius: 50%;
  border: 1px solid black;
  margin: 0 15px;
}
.colors:hover,
.size:hover {
  transform: scale(1.2);
  box-shadow: 0 0 0 8px rgba(173, 173, 170, 0.3);
  cursor: pointer;
}
.colors:active,
.size:active {
  transform: scale(0.8);
}
.selected {
  box-shadow: 0 0 0 4px #fff, 0 0 0 8px rgba(173, 173, 170, 0.3);
}
.colors-wrap,
.size-wrap {
  width: 100%;
  height: auto;
  margin: 5px auto;
  padding: 10px;
  border-radius: 70px;
  display: flex;
  justify-content: flex-start;
  align-items: center;
}
.size {
  border-radius: 50%;
  width: 30px;
  height: 30px;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0 15px;
  cursor: pointer;
  transition: all 0.3s;
}
.sameproduct{
  margin-top: -10%;
}
</style>