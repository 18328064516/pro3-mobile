<template>
    <div>
        <my-header></my-header>
        <div>
            <div class="slrlb">
                <div v-for="(item,index) of Proleibie" :key="index" class="sptwo">
                  <router-link :to="`/details/${item.lid}`">
                    <img v-lazy="item.simg" alt="图片未加载" class="spimg"><br>
                  </router-link>
                    <div class="sptext">
                      <router-link :to="`/details/${item.lid}`">
                        <p class="spte">{{item.sname}}</p>
                        <p class="spx">销量：&nbsp;{{item.xiaolaing}}</p>
                      </router-link>
                        <p  class="spx">
                          <router-link :to="`/details/${item.lid}`">
                          <span class="dpri">
                            价格：&nbsp;¥{{parseFloat(item.price).toFixed(2)}}
                          </span>
                          </router-link>
                          <span @click="showBase" >
                              <img src="../assets/products/gwc.png" alt="" class="gwctb" >
                          </span>
                          <!-- 弹窗部分开始 -->
                          <div>       
                            <div class="van-overlay" v-show="isshow">
                                <div class="van-popup van-popup--bottom  van-sku-container" style="z-index: 2002;">
                                    <div>
                                        <div class="tchx">
                                            <div class="ctimg">
                                                <img v-lazy="item.simg" alt="图片未加载" class="ctimg2" >  
                                            </div>
                                            <div class="tcnapr">
                                              <p class="tcname">{{item.sname}}</p>
                                              <!-- parseFloat() 函数解析一个参数(必要时先转换为字符串)并返回一个浮点数。 -->
                                              <p class="tcprice">¥ {{parseFloat(item.price).toFixed(2)}}</p>
                                            </div>
                                        </div>
                                        <div class="gmsl2"> 
                                            <span class="gmsl">购买数量：</span>
                                            <span class="gman">
                                                <a class="ctsljj">
                                                  <span @click="minus">-</span>
                                                </a>
                                                <!-- <span>&nbsp;{{n}}&nbsp;</span> -->
                                                <input type="text" v-model="count" class="spyinp">
                                                <a class="ctsljj">
                                                  <span @click="add">+</span>
                                                </a>
                                            </span>
                                        </div>
                                        <div class="ljgm">
                                            <a href="/cart" class="jrgwcz">
                                              <span @click="join(lid)">加入购物车</span>
                                            </a>
                                            <a href="/"  class="ljgmy">
                                              <span>立即购买</span>
                                            </a>
                                        </div>
                                    </div>
                                    <span @click="ShowHidden" class="closetb">
                                        <van-icon name="close" size="20" class="cticon"/>
                                    </span>
                                </div>
                            </div>
                            
                        </div>
                          <!-- 弹窗部分结束 -->
                        </p>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</template>

<script>
export default {
  props:["kw"],
  data(){
      return {
        Proleibie:[],
        isshow:false,
        count:1,

        lid:'',
        simg:'',
        sname:'',
        price:'',
      }
    },
    methods:{
      getProductItem(){
        let lid=this.$route.params.lid;
        // this.axios.get('pro/productsall?kw='+this.kw+'&page='+this.page).then(res=>{
         this.axios.get('pro/productsall?kw='+this.kw).then(res=>{
          if(res.data!=0){
            this.Proleibie=res.data.productsall;
          console.log(this.Proleibie);
          //将服务器返回的总页数存储到pagecount变量中
          //  this.pagecount=res.data.pagecount; 

          this.lid=res.data.proleibie[0].lid;
          this.simg=res.data.proleibie[0].simg;
          this.sname=res.data.proleibie[0].sname;
          this.price=res.data.proleibie[0].price;
          }else{
            this.$toast({
              message:"未找到该商品！",
              position:"center",
              duration:3000
            });
            this.$router.go(-1);
          }
        })
      },
      add(){
        this.count++;
      },
      minus(){
        if(this.count>1){ this.count-- };
      },
      ShowHidden:function(){
        this.isshow = false;
      },
      showBase:function(){
        this.isshow = true;   
      },
      join(lid){
        if(!this.$store.state.isLogin){
          this.$toast({
            message:"请您先登录！",
            position:"center",
            duration:3000
          });
          this.$router.push('/')
        }else{
          this.$router.push('/cart')
        };
        //点击之后，把当前商品的所有信息都搜集起来
        let goodsInfo={
          lid:this.lid,
          simg:this.simg,
          sname:this.sname,
          price:this.price,
          addCount:this.count,
        }
        //调用store中的mutaitions 来将商品加入购物车
        this.$store.commit('addToCar',goodsInfo);
        console.log(goodsInfo)
      },
    },
    created(){
      this.kw=this.$route.params.kw;
      this.getProductItem();
     
    },
    watch:{
      $route(){
        // this.kw=this.$route.params.kw;
        // this.getProductItem();
        this.axios.get('pro/productsall?kw='+this.$route.params.kw).then(res=>{      
          this.Proleibie=res.data.productsall;
          this.$router.go(-1) 
        })
      }
        // kw(){this.getProductItem()},
    }
}
</script>

<style >
  .slrlb{display: inline-block;background-color: #fff;width: 100%;margin-top: 3.5rem;}
  .sptwo,.sptwo2{float: left;width: 47%;overflow: hidden;margin-top: 0.8rem;padding: 0.3rem;}
  .sptext{margin-top: 1rem;margin-bottom: 0.2rem;}  
  .spimg{width: 100%;position: relative;}
  .spte{font-size: 1rem;margin-left: 0.7rem;color: #000;}
  .spx{
    font-size: 0.7rem;
    color: #666;
    line-height: 1rem;
    margin-left: 0.7rem;
  }
  .dpri{color: #ff6298;}
  .gwctb{float: right;}
  .ctimg{
    width:7.8rem ;
    height: 7.8rem;
    margin-top: -1rem;
    margin-left: 1rem;
    border: 1px solid #f5f5f5;
    border-radius:0.8rem;
    background-color: #fff;
    display: inline-block;
    margin-bottom: 0.5rem;
  }
  .ctimg2{width:7.2rem ;height: 7.2rem; padding-left: 0.3rem;padding-top: 0.3rem;border-radius:0.8rem;}
  .gmsl{margin-top: 1.5rem;margin-bottom: 1.5rem;margin-right: 40%;width: 100%;}
  .ljgm{text-align: center;}
  .tcnapr{line-height: 2rem;margin-top: 1.5rem;float: right;margin-right:34%;}
  .tcname{color: #000;font-size: 0.8rem;}
  .tcprice{color:#ff6298;font-size: 1rem;}
  .van-sku-container{min-height: 25% !important;}
  .tchx{border-bottom: 1px solid #f5f5f5;}
  .closetb{position: absolute;margin-left: 92%;margin-top: 0.7rem;}
  .gmsl{margin-right: 50%;}
  .gmsl2{margin-left: 3%;margin-top: 1.5rem;margin-bottom: 1.5rem;}
  .gman{font-size: 1rem;height: 1.5rem;line-height: 1.5rem;}
  .ctsljj{
    border: 1px solid #f5f5f5;
    background-color: #f5f5f5;
    display: inline-block; 
    width: 1.5rem;
    height: 1.5rem;
    text-align: center;
  }
  .jrgwcz,.ljgmy{color: #fff;width: 50%;height: 2.4rem;display: inline-block;line-height: 2.4rem;}
  .jrgwcz{background-color: #fc6f6f;}
  .ljgmy{background-color: #ff478d;}
  .spyinp{margin-left:0rem;width: 25px;height: 23px;border: 0;text-align: center;}
</style>