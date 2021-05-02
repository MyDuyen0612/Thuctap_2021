<template>
  <b-container class="shopping-cart spad">
    <b-row>
      <b-col class="col-lg-12">
        <div class="cart-table">
          <table>
            <thead>
              <tr>
                <th>Image</th>
                <th class="p-name">Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Delete</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(item, index) in cart" :key="index">
                <td class="cart-pic" style="width: 21%">
                  <router-link :to="{ name: 'ProductDetail', params: { url: item.id } }">
                    <img
                      :src="item.img"
                      alt=""
                      style="width: 50%;"
                    />
                  </router-link>
                </td>
                <td class="cart-title">
                  <h5>{{item.name}} / {{item.color.name}} / {{item.size.name}}</h5>
                </td>
                <td class="p-price">{{item.price.toLocaleString()}} đ</td>
                <td class="qua-col">
                  <div class="quantity">
                    <div class="pro-qty">
                      {{item.quantity}}
                    </div>
                  </div>
                </td>
                <td class="total-price ">{{(item.price*item.quantity).toLocaleString()}} đ</td>
                <td class="close-td" @click="removeProductCart(index)"><i class="fas fa-times" style="cursor: pointer;"></i></td>
              </tr>
            </tbody>
          </table>
        </div>
      </b-col>
    </b-row>
    <b-row>
      <b-col class="col-lg-4 offset-lg-8">
        <div class="proceed-checkout">
          <ul>
            <li class="cart-total">Tổng tiền <span>{{total.toLocaleString()}}</span></li>
          </ul>
          <a href="#" class="proceed-btn">Thanh toán</a>
        </div>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
export default {
  computed:{
    cart(){
      return this.$store.state.cart;
    },
    total(){
      return this.$store.getters.total;
    }
  },
  methods:{
    removeProductCart(indexremove){
      this.$store.dispatch('removeProductCart', indexremove);
    }
  }
};
</script>

<style lang="scss" scoped>
.shopping-cart {
  padding-top: 80px;
  padding-bottom: 60px;
  .cart-table {
    margin-bottom: 40px;
    table {
      width: 100%;
      min-width: 480px;
      border: 1px solid #ebebeb;
      tr th {
        font-size: 16px;
        color: #252525;
        font-weight: 700;
        border-bottom: 1px solid #ebebeb;
        text-align: center;
        padding: 18px 0 19px;
        text-transform: uppercase;
        .p-name {
          text-align: left;
        }
      }
      tr td {
        text-align: center;
        padding-bottom: 34px;
        .p-price {
          width: 16%;
        }
        .qua-col {
          width: 16%;
          .quantity {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
          }
        }
        .total-price {
          width: 12%;
        }
      }
    }
  }
  .proceed-checkout {
    .proceed-btn {
      font-size: 14px;
      font-weight: 700;
      color: #ffffff;
      background: #252525;
      text-transform: uppercase;
      padding: 15px 25px 14px 25px;
      display: block;
      text-align: center;
    }
    ul {
      border: 2px solid #ebebeb;
      background: #f3f3f3;
      padding-left: 25px;
      padding-right: 25px;
      padding-top: 16px;
      padding-bottom: 20px;
      li {
        list-style: none;
        font-size: 16px;
        font-weight: 700;
        color: #252525;
        text-transform: uppercase;
        overflow: hidden;
        .cart-total {
          padding-top: 10px;
        }
        span {
          float: right;
          color: #ec1b1b
        }
      }
    }
  }
}
</style>
