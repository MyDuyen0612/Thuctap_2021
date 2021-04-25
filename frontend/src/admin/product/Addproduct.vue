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
                        :value="itemCategory"
                        >{{ itemCategory.name }}</b-form-select-option
                      >
                    </b-form-select>
                  </b-form-group>

                  <b-button variant="primary" @click="themCategory"
                    >Thêm danh mục</b-button
                  >
                  <div>
                    Danh mục được chọn:
                    <strong>{{ product.category.name }}</strong>
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

            <b-col>
              <b-row
                v-for="(itemColor, indexColor) in product.color"
                :key="indexColor"
              >
                <b-container>
                  <b-row>
                    <b-col>
                      <b-form-group
                        id="input-color"
                        label="Tên màu sắc:"
                        label-for="input-color"
                      >
                        <b-form-input
                          v-model="itemColor.name"
                          id="input-color"
                          type="text"
                          required
                        >
                        </b-form-input>
                      </b-form-group>
                    </b-col>
                    <b-col>
                      <b-button
                        variant="danger"
                        @click="deleteColor(indexColor)"
                        style="margin-top: 2em"
                        >Xoá màu sắc</b-button
                      >
                    </b-col>
                  </b-row>
                  <b-row cols-md="3">
                    <b-col>
                      <b-form-group
                        id="input-color-code"
                        label="Mã màu sắc:"
                        label-for="input-color-code"
                      >
                        <b-form-input
                          v-model="itemColor.code"
                          id="input-color-code"
                          type="color"
                          required
                        >
                        </b-form-input>
                      </b-form-group>
                    </b-col>
                    {{ itemColor.code }}
                  </b-row>
                  <b-row>
                    <b-col>
                      <b-form-file
                        class="mt-3"
                        plain
                        @change="imageChange(indexColor, $event)"
                        accept="image/jpeg, image/jpeg, image/png, image/gif"
                        required
                      >
                      </b-form-file>
                    </b-col>
                  </b-row>
                </b-container>
                <b-container>
                  <b-row
                    v-for="(itemSize, indexSize) in itemColor.size"
                    :key="indexSize"
                  >
                    <b-col>
                      <b-form-group
                        id="input-size"
                        label="Tên Size:"
                        label-for="input-size"
                      >
                        <b-form-input
                          id="input-size"
                          type="text"
                          required
                          v-model="itemSize.name"
                        ></b-form-input> </b-form-group
                    ></b-col>

                    <b-col>
                      <b-form-group
                        id="input-soluong"
                        label="Số lượng của size:"
                        label-for="input-soluong"
                      >
                        <b-form-input
                          id="input-soluong"
                          type="number"
                          min="1"
                          required
                          v-model="itemSize.amount"
                        ></b-form-input>
                      </b-form-group>
                    </b-col>
                    <b-col>
                      <b-button
                        variant="danger"
                        @click="deleteSize(indexSize, indexColor)"
                        style="margin-top: 2em"
                        >Xoá size</b-button
                      >
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col>
                      <b-button variant="primary" @click="newSize(indexColor)"
                        >Thêm Size</b-button
                      >
                    </b-col>
                  </b-row>
                </b-container>
              </b-row>
              <b-row class="mt-3">
                <b-col>
                  <b-button variant="primary" @click="newColor()"
                    >Thêm màu sắc</b-button
                  >
                </b-col>
              </b-row>
            </b-col>
          </b-row>
        </b-container>
      </b-form>
    </b-overlay>
  </div>
</template>

<script>
export default {
  name: "Addproduct",
  data() {
    return {
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
      image: [], //mảng ảnh đầu vào
      categorys: [],
      selectCategory: {},
      show: false,
    };
  },
  methods: {
    deleteColor: function(indexColor) {
      if (indexColor > 0) {
        this.product.color.splice(indexColor, 1);
      }
    },
    deleteSize: function(indexSize, indexColor) {
      if (indexSize > 0) {
        this.product.color[indexColor].size.splice(indexSize, 1);
      }
    },
    newColor: function() {
      const colorNew = {
        name: "",
        size: [
          {
            name: "",
            amount: 12,
          },
        ],
        image: [],
      };
      this.product.color.push(colorNew);
    },
    newSize: function(indexColor) {
      const sizeNew = {
        name: "",
        amount: 12,
      };
      this.product.color[indexColor].size.push(sizeNew);
    },
    submit: function(e) {
      e.preventDefault();
      this.show = true;

      const formdata = new FormData();
      formdata.append("product", JSON.stringify(this.product));
      for (let index = 0; index < this.image.length; index++) {
        formdata.append("image[]", this.image[index]);
      }
      this.axios
        .post("http://127.0.0.1:8000/api/product", formdata)
        .then(() => {
          this.show = false;
          alert("thành công");
          this.$router.push("sanpham");      
        })
        .catch((error) => {
          this.show = false;
          alert(error.response.data);
        });
    },
    imageChange: function(indexColor, event) {
      for (let index = 0; index < event.target.files.length; index++) {
        this.image.push(event.target.files[index]);
      }
      event.target.files.forEach((element) => {
        const file = {
          fileName: element.name,
        };
        this.product.color[indexColor].image = file.fileName;
      });
    },
    themCategory: function() {
      this.product.category = this.selectCategory;
      // console.log(this.product.category);
    },
  },
  mounted() {
    this.axios
      .get("http://127.0.0.1:8000/api/category")
      .then((response) => {
        this.categorys = response.data;
      })
      .catch((error) => {
        alert(error);
      });
  },
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
