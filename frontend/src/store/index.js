import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    name: "",
    token: "",
    cart: [],
    amount: 0,
  },
  mutations: {
    login(state, name) {
      state.name = name;
    },
    addProdcutToCart(state, cartItem) {
      let index =  state.cart.find(item => {
        return (item.id === cartItem.id && cartItem.color == item.color && item.size == cartItem.size)  
      });
      if(index!=null){
        index.quantity += cartItem.quantity;
        return;
      }
      state.cart.push(cartItem);
      localStorage.setItem('cart', JSON.stringify(state.cart))
    },
    removeProductCart(state, indexremove){
      state.cart = state.cart.filter((item, index) =>{
        return index !== indexremove;
      })
    },
    LoadingVuex(state){
      let cart = localStorage.getItem('cart');
      if(cart != null){
        state.cart = JSON.parse(cart);
      }
      
    }
  },
  actions: {
    addProdcutToCart: (context, cartItem) => {
      context.commit("addProdcutToCart", cartItem);
    },
    removeProductCart: (context,indexremove)=>{
      context.commit("removeProductCart",indexremove);
    },
    render: (context)=>{
      context.commit("LoadingVuex");
    }
  },
  modules: {},
  getters:{
    total(state){
      let total = 0;
      state.cart.forEach(item =>{
        total += item.price * item.quantity;
      })
      return total;
    },
    amount(state){
      return state.cart.length;
    }
  }
});
