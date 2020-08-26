<template>
  <div class="carousel">
    <van-swipe :autoplay="3000">
        <van-swipe-item v-for="(i, index) in imgList" :key="index">
            <img class="img2" :src="i.img" alt="">
        </van-swipe-item>
    </van-swipe>
  </div>
</template>

<script>
// import Vue from 'vue';
// import { Swipe, SwipeItem } from 'vant';
// Vue.use(Swipe);
// Vue.use(SwipeItem);

export default {
  data(){
    return{
      imgList:[]
    }  
  },
  methods:{
    getBannerList(){
      this.axios.get('/user/bannerList').then(res=>{
        console.log(res.data);
        this.imgList = res.data;
      })
    }
  },
  mounted(){
    this.getBannerList();
  }
}
</script>

<style>
  .img2{width: 100%;}
  .carousel{
    width: 100%;
    margin-top: 46px;
  }
  /*样式穿透*/
  /* .swiper >>> .swiper-pagination-bullet{
    background-color:blue;
  }  */
</style>
