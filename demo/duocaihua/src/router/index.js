import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import Fenlei from '../views/Fenlei.vue'
import Products from '../views/Products.vue'
import Details from '../views/Details.vue'
import Cart from '../views/Cart.vue'
import Mycenter from '../views/Mycenter.vue'

import ProductsAll from '../views/ProductsAll.vue'



const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}

//1.导入组件文件
// import Header from '../components/Header.vue'
//import Carousel from '../components/Carousel.vue'
//import Footer from '../components/Footer.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/mycenter', 
    component: Mycenter
  },
  {
    path: '/cart', 
    component: Cart
  },
  {
    path: '/productsAll/:kw',
    component: ProductsAll,
    props:true
  },
  {
    path: '/details/:cid', 
    component: Details
  },
  {
    path: '/products/:pid',
    component: Products,
    props:true
  },
  {
    path: '/fenlei/:cid',
    component: Fenlei
  },
  {
    path: '/register',
    component: Register
  },
  {
    path: '/login',
    component: Login
  },
  //2.将组件文件Header加入到路由字典中。在什么位置写入没有关系
  // {
  //   path: '/header',
  //   component: Header
  // },
  // {
  //   path: '/footer',
  //   component: Footer,
  // },
  {
    path: '/',
    name: 'Home',//可以不要name
    component: Home
  },
  // {//只有当用户尝试访问/about路径时，才临时引入About组件内容
  //   path: '/about',
  //   name: 'About',//可以不要name,为分段的组件文件起名
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   //使用匿名函数方式，临时引入组件对象
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
]

const router = new VueRouter({
  mode: 'history',//该模式对应的浏览器中网址后面就不用跟#，例如http://localhost:8080/header
  base: process.env.BASE_URL,
  routes
})

export default router
