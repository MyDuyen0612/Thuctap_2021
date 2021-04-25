<template>
  <div>
    <b-avatar v-bind:src="img" variant="dark" size="6rem"></b-avatar>
    <div>{{ message }}</div><br/>
     <hr/>
    <input type="text" v-model="noidung" />
    <!-- Sử dụng v-model để chỉ định model thay đổi trong data của đối tượng VUEJS quản lý  -->
    <p>{{ noidung }}</p><br/>
    <hr/><br/>
    <ul class="demo">
      <li v-on:click="chon('login')">Dang nhap</li>
      <li v-on:click="chon('register')">Dang ky</li>
    </ul>
    <div class="login" v-if="show === 'login'">
      <h3>Dang nhap</h3>
      <form action="">
        <input type="text" placeholder="Nhap ten dang nhap" />
        <input type="password" placeholder="Nhap password" />
      </form>
    </div>
    <div class="register" v-else-if="show === 'register'">
      <h3>Dang ky</h3>
      <form action="">
        <input type="text" placeholder="Nhap ten dang nhap" />
        <input type="password" placeholder="Nhap password" />
        <input type="password" placeholder="Nhap lai password" />
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: "Demo",
  data() {
    return {
      noidung: "Hello World",
      message: "Mỹ Duyên",
      img: "https://placekitten.com/320/320",
      show: "login",
    };
  },
  methods: {
    chon(t) {
      this.show = t;
    },
  },
};
</script>

<style lang="scss" scoped>
.demo {
  margin: 0;
  padding: 0;
}

.demo li {
  cursor: pointer;
  display: inline-block;
  border: 2px solid blue;
  padding: 10px;
}

.login,
.register {
  padding: 10px;
  margin-top: 20px;
  border: 4px solid blue;
}
</style>
