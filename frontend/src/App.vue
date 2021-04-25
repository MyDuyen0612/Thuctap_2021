<template>
  <div id="app">
    <!-- <div id="nav">
      <router-link to="/">Login</router-link> |
      <router-link to="/register">Register</router-link>
    </div> -->
    <transition
        name="fade"
        mode="out-in"
      >
        <router-view/>
    </transition>
  </div>
</template>

<style lang="scss">
#nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
.fade-enter-active, .fade-leave-active {
  transition: opacity .3s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
</style>
