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
        return (item.id === cartItem.id && item.color === cartItem.color && item.size === cartItem.size);  
      });
      if(index!=null){
        index.quantity += cartItem.quantity;
        return;
      }
      state.cart.push(cartItem);
    },
  },
  actions: {
    addProdcutToCart: (context, cartItem) => {
      context.commit("addProdcutToCart", cartItem)
    },
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
