<template>
  <div class="menuuser">
    <div class="py-4 px-3 mb-4">
      <div class="media-body">
        <h4 class="m-0 text-center">
          Đăng nhập
        </h4>
      </div>
    </div>
    <div class="list-icon d-flex justify-content-center">
      <b-button
        id="button-1"
        variant="light"
      >
        <b-icon icon="person"></b-icon>
      </b-button>
      <b-button
        id="button-1"
        variant="light"
      >
        <b-icon icon="person"></b-icon>
      </b-button>
      <b-button id="button-2" variant="light" class="btn-icon">
        <b-icon-suit-heart></b-icon-suit-heart>
      </b-button>

      <b-button id="button-3" variant="light" to="/cart1">
        <b-icon-cart></b-icon-cart>
      </b-button>

      <b-tooltip target="button-1" variant="light" placement="top">
        Tài khoản
      </b-tooltip>
      <b-tooltip target="button-2" variant="light" placement="top">
        Sản phẩm yêu thích
      </b-tooltip>
      <b-tooltip target="button-3" variant="light" placement="top">
        Giỏ hàng</b-tooltip
      >
    </div>

    <nav class="mb-3">
      <b-nav vertical>
        <b-nav-item to="/" class="item">NEW ARRIVALS</b-nav-item>
        <b-nav-item to="/shop" class="item">CỬA HÀNG</b-nav-item>
      </b-nav>
    </nav>
  </div>
</template>

<script>
export default {
  name: "Menuuser",
};
</script>
<style  scoped>
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
</style>