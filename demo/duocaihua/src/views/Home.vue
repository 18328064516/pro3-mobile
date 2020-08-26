<template>
  <div class="home">
    <!-- <my-header></my-header> -->
    <div class="head">
      <van-nav-bar  fixed >
        <template #left>
          <a href="/" class="sylg">
            <img src="../assets/logo.png" slot="icon" class="hzimg" style="width:30px;height:30px;">
          </a>
          <van-search
            shape="round"
            background="#ff6298"
            placeholder="搜索"
            @click.stop="search"
          />
        </template>    
        <template #right>
          <a href="/fenlei/1">
            <img src="../assets/gengduo.png" alt="">
          </a>
        </template>
      </van-nav-bar>
      <div v-show="isshow">
          <div class="van-popup van-popup--bottom  van-sku-container2" style="z-index: 2002;">
            <form action="/">
              <van-search
                class="van-search2"
                v-model="kw"
                show-action
                placeholder="请输入搜索关键词"
                @search="onSearch"
                @cancel="onCancel"
              >
                <template #left>
                  <div @click.stop="onSearch" class="sous">搜索</div>
                </template>
                <template #right>
                  <div @click="onCancel">取消</div>
                </template>
              </van-search>
            </form>
          </div>
      </div>
    </div> 

    <my-carousel></my-carousel>
    <!-- 520送花 -->
    <div style="background-color:#fff;height:90px;margin-top:5px">
      <img src="../assets/home/520.jpg" style="width:100%;height:70px;margin-buttom:20px;">
    </div>
    <!-- 8大类-图片-->
    <div>
      <div class="badalei">
        <div v-for="(i,k) of LeibieList" :key="k" class="badiv">
          <router-link to="/">
            <!-- <img :src="i.img" alt="图片未加载" class="baimg"><br> -->
            <img v-lazy="i.img" alt="图片未加载" class="baimg"><br>
            <div class="linxin">
              <div class="cubeLink_curtain" ></div>
            </div>
            <div>
              <p class="bap">{{i.leibie}}</p>
            </div> 
          </router-link>
      </div> 
    </div>
    <!-- 优惠券 -->
    <div class="yhqbg">
      <div class="yhqzc">
        <img src="../assets/home/youhuiquan1.png" alt="">
        <img src="../assets/home/youhuiquan2.png" alt="">
        <img src="../assets/home/youhiuquan3.png" alt="">
        <img src="../assets/home/youhuiquan4.png" alt="">
        <img src="../assets/home/youhuiquan5.png" alt="">
      </div>
      <p style="color:#ff6298;margin-left:1.3rem;margin-bottom:.3rem;margin-top:1rem;font-size:0.8rem;font-weight:bold">送恋人，老婆</p> 
    </div>
    <!-- 送恋人，老婆 下面的商品列表 -->
    <div class="slrlb">
      <div v-for="(i,k) of Spleibie.slice(0,6)" :key="k" class="sptwo">
        <img v-lazy="i.simg" alt="图片未加载" class="spimg"><br>
        <div class="sptext">
          <p class="spte">{{i.sname}}</p>
          <p class="spx">销量：&nbsp;{{i.xiaolaing}}</p>
          <p class="spx">价格：&nbsp;¥{{parseFloat(i.price).toFixed(2)}}</p>
        </div>
      </div>
    </div>
    <!-- 送父母，老师 下面的商品列表 -->
    <div class="sfmsls">
      <p style="color:#ff6298;margin-left:1.3rem;margin-bottom:.3rem;margin-top:1rem;font-size:0.8rem;font-weight:bold">送父母，老师</p> 
      <hr>
      <div v-for="(i,k) of Spleibie.slice(6,14)" :key="k" class="sptwo">
       <img v-lazy="i.simg" alt="图片未加载" class="spimg">
         <div class="sptext">
          <p class="spte">{{i.sname}}</p>
          <p class="spx">销量：&nbsp;{{i.xiaolaing}}</p>
          <p class="spx">价格：&nbsp;¥{{parseFloat(i.price).toFixed(2)}}</p>
        </div>
      </div>
    </div>
    <!-- 生日组合 下面的商品列表 -->
    <div class="srzh">
      <p style="color:#ff6298;margin-left:1.3rem;margin-bottom:.3rem;margin-top:1rem;font-size:0.8rem;font-weight:bold">生日组合</p> 
      <hr>
      <div v-for="(i,k) of Spleibie.slice(14,18)" :key="k" class="sptwo3">
       <img v-lazy="i.simg" alt="图片未加载" class="spimg">
         <div class="sptext">
          <p class="spte">{{i.sname}}</p>
          <p class="spxl">销量：&nbsp;{{i.xiaolaing}}</p>
          <p class="spx">价格：&nbsp;¥{{parseFloat(i.price).toFixed(2)}}</p>
        </div>
      </div>
    </div>
    <div class="hdt">主页&nbsp;会员中心
      <!-- <p>主页 个人中心</p> -->
    </div>
  </div>
    <my-backtop></my-backtop>
    <!-- 底部导航栏 -->
    <div style="margin-top:50px">
      <van-tabbar v-model="active" active-color="#ff6298" fixed>
        <van-tabbar-item icon="wap-home-o">首页</van-tabbar-item>
        <van-tabbar-item icon="shop-o">
           <a href="/fenlei/1" class="cpfl">产品分类</a>
        </van-tabbar-item>
        <!-- <van-tabbar-item icon="service-o" to="tel:18328064516">在线咨询</van-tabbar-item> -->
        <van-tabbar-item icon="service-o" to="/" >在线咨询</van-tabbar-item>
        <!-- <van-tabbar-item icon="chat-o">QQ咨询</van-tabbar-item> -->
        <van-tabbar-item icon="shopping-cart-o"  @click="qgwc" >购物车</van-tabbar-item>
        <van-tabbar-item icon="contact" to="/mycenter">我的</van-tabbar-item>
      </van-tabbar>
    </div>

  </div>
</template>

<script>
import Carousel from '../components/Carousel.vue'


export default {
  name: 'Home',
  components: {
    Carousel
  },
  data(){
      return {
        active:0,
        LeibieList:[],
        Spleibie:[],
        kw:'',
        isshow:false,
        
      }
    },
    methods:{
      getLeibieList(){
        this.axios.get('/user/leibieList')
        .then(res=>{
          // console.log(res.data)
          this.LeibieList = res.data;
        })
      },
      getSpleibie(){
        this.axios.get('/user/spleibie')
        .then(res=>{
          // console.log(res.data)
          this.Spleibie = res.data;
        })
      },
      search:function(){
        this.isshow = true;  
      },
      onCancel:function(){
          this.isshow = false;
          this.$router.go(-2);
      },
      onSearch(){
        clearTimeout(this.timer);
              this.timer=setTimeout(()=>{
                  if(this.kw.trim()!==""){
                      console.log(`查询${this.kw}相关的东西`);
                      this.$router.push("/productsAll/"+this.kw);
                  }
        },1000)
      },
      qgwc(){
        if(!this.$store.state.isLogin){
          this.$toast({
            message:"您需要先登录才能操作",
            position:"center",
            duration:3000,
            
          });
          this.$router.push('/login')
        }else{
          this.$router.push('/cart')
        };
      },
    },
    mounted(){
      this.getLeibieList();
      this.getSpleibie();
    }
}
</script>

<style>
 .van-nav-bar{
    background-color: #ff6298 !important;width: 100%;
  }
  .van-nav-bar__left{padding-left: 12px !important;width: 100% !important;}
  .van-search{
      padding: 0 !important;
      padding-left:20px !important;
      width: 100% !important;
      min-width: 200px !important;
      padding-right: 20px !important;
      margin-right: 50px !important;
    }
  .van-search .van-cell{
      padding-top: 0 !important;
      padding-bottom: 0 !important;
      height: 30px !important;
      width: 100% !important;
    }
  .van-field__control{line-height: 30px !important;}
  .van-icon-search{line-height: 32px !important;}
  .van-nav-bar__right{
      padding-right: 15px !important;
      padding-left: 5px !important;
      width: auto !important;
      height: auto !important;
    }


  .home{background: url(../assets/home/bg.jpg) repeat center center;}
  .badalei{margin-top: 1rem;}
  .badiv{height: 0;float: left;height: 100%;width: 50%;overflow: hidden;}
  .baimg{width: 100%;min-height: 72px;position: relative;}
  .linxin{position: relative;}
  .cubeLink_curtain{
    left: 35%;
    -webkit-transform: skew(-30deg,0deg);
    transform: skew(-30deg,0deg);
    background: -webkit-gradient(linear ,left top,left bottom ,from(#fbfbfb),to(#d2cfd0));
    height: 100%;
    margin-top: -40%;
    position: absolute;
    width: 500px;
    height: 200px;
    width: 80%;
  }
  .yhqbg{display: inline-block;background-color: #fff;width: 100%;margin-top: 0.8rem;}
  .yhqzc{margin-left: 10px;margin-top: 15px;}
  .bap{margin-top: -15%;margin-left: 32%;position: absolute;color: #000;font-size:14px;}
  .yhqzc img{width: 30%;}

  .slrlb{display: inline-block;background-color: #fff;width: 100%;margin-top: 1.5rem;}
  .sptwo,.sptwo2{height: 0;float: left;height: 100%;width: 50%;overflow: hidden;margin-top: 0.8rem;}
  .sptext{margin-top: 1rem;margin-bottom: 0.2rem;}
  .spimg{width: 100%;position: relative;}
  .spte{font-size: 1rem;margin-left: 0.7rem;margin-bottom:0.3rem;}
  .spx{
    font-size: 0.7rem;
    color: #666;
    line-height: .85rem;
    margin-left: 0.7rem;
    padding-top: 0.5rem;
  }
  .sfmsls{display: inline-block;background-color: #fff;width: 100%;margin-top: 0.5rem;}
  .srzh{display: inline-block;background-color: #fff;width: 100%;margin-top: 0.5rem;margin-bottom:1rem;}
  .sptwo3{border: 1px solid #ccc; height: 0;float: left;height: 100%;width: 44%;overflow: hidden;margin-top: 0.4rem;margin-left: 3%;margin-right: 2%;margin-bottom:0.4rem;}
  .hdt{
    display: inline-block;
    font-size: 0.7rem;
    margin-top: -5rem;
    margin-bottom:5rem;
    margin-left: 40%;
    height: 100%;
  }
  .spxl{
    font-size: 0.7rem;
    color: gray;
    line-height: .85rem;
    margin-left: 0.7rem;
    padding-top: 0.5rem;
    border-bottom: 1px dashed #ccc;
    margin-bottom: 3px;
  }
  .cpfl{color: #666;}
  .sylg{height: 30px;}
   .van-search2{margin-top: 1rem !important;}
</style>