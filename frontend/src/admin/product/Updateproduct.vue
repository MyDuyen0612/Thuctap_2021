<template>
  <div class="addproduct">
    <b-overlay :show="show" rounded="sm">
      <h3 class="text-center text-primary">Thêm sản phẩm</h3>
      <b-form @submit="submit">
        <b-container fluid>
          <b-row>
            <b-col>
                <b-row>
                <b-col sm="12">
                  <b-form-group
                    id="name"
                    label="Tên sản phẩm:"
                    label-for="name"
                  >
                    <b-form-input
                      id="name"
                      v-model="product.name"
                      name="name"
                      type="text"
                      required
                      placeholder="Nhập tên sản phẩm"
                      trim
                    ></b-form-input>
                  </b-form-group>
                </b-col>
              </b-row>

              <!-- Danh mục -->
              <b-row>
                <b-col sm="12">
                  <b-form-group id="name" label="Danh mục :" label-for="name">
                    <b-form-select
                      v-model="selectCategory"
                      size="sm"
                      class="mt-3"
                      required
                    >
                      <b-form-select-option
                        v-for="(itemCategory, index) in categorys"
                        :key="index"
                        :value="itemCategory">
                       {{ itemCategory.name }}
                      </b-form-select-option
                      >
                    </b-form-select>
                  </b-form-group>

                  <b-button variant="primary" @click="themCategory"
                    >Thêm danh mục</b-button
                  >
                   <div>
                    Danh mục được chọn:
                    <strong>{{product.category.name||"" }}</strong>
                  </div>
                </b-col> 
              </b-row>

              <b-row>
                <b-col sm="6">
                  <b-form-group id="price" label="Đơn giá:" label-for="price">
                    <b-form-input
                      id="price"
                      v-model="product.price"
                      type="number"
                      name="price"
                      placeholder="Nhập giá sản phẩm"
                      required
                      min="100000"
                      max="2000000"
                    ></b-form-input>
                  </b-form-group>
                </b-col>
              </b-row>

              <b-row>
                <b-col>
                  <b-form-textarea
                    id="describe"
                    v-model="product.describe"
                    type="text"
                    placeholder="Mô tả"
                    required
                    rows="3"
                    max-rows="6"
                  ></b-form-textarea>
                </b-col>
              </b-row>
              <b-row>
                <!-- BUTTOM THÊM SẢN PHẨM -->
                <b-button id="btnThem" type="submit" variant="primary"
                  >Thêm sản phẩm</b-button
                ></b-row
              >
            </b-col>
          </b-row>
        </b-container>
      </b-form>
    </b-overlay>
  </div>
</template>
<script>
export default {
  name: "Updateproduct",
  data() {
    return {
      product: {
        name: "",
        price: 0,
        describe: "",
        category: {
          name: ""
        },
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
      categorys: [],
      selectCategory: {},
      show: false,
    }
  },
  methods: {
    submit: function(e) {
      e.preventDefault();
      const put = {
        product : this.product
      }
        this.axios
        .put("http://127.0.0.1:8000/api/product/"+this.$route.params.url,put)
        .then(() => {
          this.show = !this.show;
          alert("Sửa thành công");
          this.$router.push("sanpham");
        })
        .catch((error) => {
          console.log(error.response.data);
        });
    },
     themCategory: function() {      
        this.product.category = this.selectCategory;
        this.product.category_id = this.selectCategory.id;
    },
  },
  mounted(){
     this.axios
      .get("http://127.0.0.1:8000/api/category")
      .then((response) => {
        this.categorys = response.data;
      })
      .catch((error) => {
        alert(error.response);
      });
     this.axios
        .get("http://127.0.0.1:8000/api/product/"+this.$route.params.url)
        .then((response) => {      
          this.product = response.data.data;
          this.selectCategory = response.data.data.category;
        })
        .catch((error) => {
            alert(error.response);
        });
  }
};
</script>
<style lang="scss" scoped>
#introduce {
  margin-top: 2%;
}
#btnThem {
  margin-top: 2%;
}
</style>
