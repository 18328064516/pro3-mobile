import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    //标识用户是否登录
    //如果用户已登录，isLogin的值为sessionStorage中的值，即为true
    isLogin:sessionStorage.getItem('isLogin') || false,
    username:sessionStorage.getItem('username') || '',

    //组件一开始加载时，执行这个文件时，先从本地缓存把购物车数据拉下来，保存进全局
    //本地缓存没有数据时，需要返回一个空的数组，只要数组还有数组API，如果不写成空数组就会报错
    car:JSON.parse(localStorage.getItem('cart')||'[]'),

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
      state.car=[]
    },
    addToCar(state,goodsInfo){ //点击加入购物车按钮后，把商品保存到store的car上
      let flag=false;//假设购物车中没有找到
      //如果购物车之前有商品，只需要更新数量，否则添加新的商品
      state.car.forEach(item => {
        if(item.lid==goodsInfo.lid){
          item.addCount += parseInt(goodsInfo.addCount);
          flag=true;
          return true;
        }
      });
      //如果最终循环完毕，得到flag还是false，则把商品数据直接添加到car中
      if(!flag){
        state.car.push(goodsInfo);
      }
      // console.log(state.car)
      //把car 存储到本地的localstorage里面
      localStorage.setItem('cart',JSON.stringify(state.car))
    },
    
  },
  actions: {  //专门发起异步请求，负责从服务器拿数据
  },
  modules: {
  },
  getters:{ //相当于vue中的计算属性computed
    //用来获取加入购物车的数量，总数量c
    //  (state){
    //   var c =0;
    //   state.car.forEach(item=>{
    //     c+=item.addCount;
    //   })
    //   return c;
    // }
  }
})

