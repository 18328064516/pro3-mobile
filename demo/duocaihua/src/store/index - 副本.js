import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    //标识用户是否登录
    //如果用户已登录，isLogin的值为sessionStorage中的值，即为true
    isLogin:sessionStorage.getItem('isLogin') || false,
    // userId:sessionStorage.getItem('userId') || 0,
    username:sessionStorage.getItem('username') || '',
  },
  //在mutationts添加一个登录成功的方法，要修改state中isLogin变量的值为true
  mutations: {
    login_mutation(state,payload){
      state.isLogin=true;
      // state.userId=payload.userId;
      state.username=payload.username;
    },
    logout_mutation:(state)=>{
      state.isLogin=false;
      sessionStorage.clear();
    }
  },
  actions: {
  },
  modules: {
  }
})

