<template>
  <div class="menuuser">
    <div class="py-4 px-3 mb-4">
      <div class="media-body">
        <h4 class="m-0 text-center">
          {{ user == "" || user == null ? "Tài khoản" : user }}
        </h4>
      </div>
    </div>
    <div class="list-icon d-flex justify-content-center">
      <b-button
        id="button-1"
        variant="light"
        to="/login"
        v-show="user == '' || user == null"
      >
        <b-icon icon="person"></b-icon>
      </b-button>

      <b-button
        id="button-1"      
        variant="light"
        to="/profile"
        v-show="user != '' && user != null"
      >
        <b-icon icon="person"></b-icon>
      </b-button>

      <b-button id="cart" variant="light" to="/cart">
        <b-icon-cart></b-icon-cart>
         <span>{{amount}}</span>
      </b-button>

      <b-tooltip target="button-1" variant="light" placement="top">
        Tài khoản
      </b-tooltip>
      <b-tooltip target="cart" variant="light" placement="top">
        Giỏ hàng</b-tooltip
      >
    </div>

    <nav class="mb-3">
      <b-nav vertical>
        <b-nav-item to="/" class="item">NEW ARRIVALS</b-nav-item>
         <b-nav-item
          v-for="(item, index) in category"
          :key="index"
          :to="{ name: 'CategoryUser', params: { idCategory: item.id } }"
          class="item"
          >
            {{ item.name.toUpperCase()}}
          </b-nav-item
        >
      </b-nav>
      
    </nav>
  </div>
</template>

<script>
export default {
  name: "Menuuser",
  props: {
    category: Array,
  },
  computed:{
    user(){
      return this.$store.state.name;
    },
    amount(){
      return this.$store.getters.amount;
    },
  },
}
</script>
<style lang="scss" scoped>
body {
  background: black;
}

.nav-item > .nav-link {
  color: black;
  text-align: center;
}
.nav-item > .nav-link:hover {
  color: rgb(9, 165, 226);
}
.list-icon {
  margin-bottom: 15px;
}

.btn-icon {
  margin: 0px 12px 0px 12px;
}
#cart{
  margin-left: 10px;
  span {
    position: absolute;
    margin-top: -10px;
    height: 15px;
    width: 15px;
    background: #ec410d;
    color: #ffffff;
    border-radius: 50%;
    font-size: 11px;
    font-weight: 700;
    text-align: center;
    line-height: 15px;
}
}
</style>