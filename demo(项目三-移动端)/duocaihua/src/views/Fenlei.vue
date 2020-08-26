<template>
    <div>
        <div class="head">
            <van-nav-bar  fixed >
                <template #left>
                    <a href="/">
                        <van-icon name="arrow-left" size="2rem" color="#fff" class="flzc" />
                    </a>
                    <van-search
                        shape="round"
                        background="#ff6298"
                        placeholder="搜索"
                        @click.stop="search"
                    />
                </template>    
                <template #right>
                    <a href="/">
                        <van-icon name="wap-home-o" size="1.8rem" color="#fff"/>
                    </a>
                </template>
            </van-nav-bar>
            <div v-show="isshow">
                <div class="van-popup van-popup--bottom  van-sku-container2" style="z-index: 2002;">
                    <form action="/">
                    <van-search
                    class="van-search3"
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
        <!-- 分类 -->
        <div style="flei">
            <div class="zbdhl">
                <div>
                    <ul>
                        <!-- <li class="zblb" v-for="(item,k) of ProductsList" :key="k"  @click="go(k+1)" v-bind:class="{active:currentIndex == k}">     -->
                        <li class="zblb" v-for="(item,k) of ProductsList" :key="k"  @click="go(k+1)" > 
                            <span v-text="item.sname" ></span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="yccpt">
                <div class="yccpkd">
                    <ul v-for="(i,k) of proimglist" :key="k" class="hengpai">
                        <li>
                            <div class="mgcp">
                                <div class="imgcp">
                                    <router-link :to="`/products/${i.xsanid}`">
                                                <div>
                                                    <img v-lazy="i.simg" alt="" class="jgtu">
                                                </div>
                                    </router-link>
                                </div>
                                <div class="spm">
                                    <router-link to="/" style="text-decoration: none;">
                                        <span v-text="i.sname" class="wzys"></span>
                                    </router-link>
                                </div>  
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
export default {
    data(){
        return {
           
            ProductsList:[],
            proimglist:[],
            // url传参,默认被选定的产品类别
            cid:'1',
            kw:'',
            isshow:false,
            n:0,
            // currentIndex:'0'
        }
    },
    methods:{
        // 点击商品分类列表将列表id传给url
        go(cid){
            console.log(cid);
            this.$router.push(`/fenlei/${cid}`);  
       },
        getProductsList(){
            //获取产品分类信息
            this.axios.get('/pro/productslist').then(res=>{
                this.ProductsList=res.data;
                console.log( this.ProductsList);
            });
        },
        getProimgList(){
            this.axios.get('/pro/proimglist?cid='+this.cid).then(res=>{
                //获取服务器返回的产品数据
                this.proimglist=res.data.proimglist;
                console.log(this.proimglist);   
            });
        },
        // back(){
        //     //返回到上一级
        //     this.$router.go(-1);
        // }
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
    },
    watch:{
        $route(){
            this.cid=this.$route.params.cid;
            //  判断得到的参数 执行全局查找
            this.getProimgList();
      }
    },
    mounted(){
      this. getProductsList();
      this. getProimgList();
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
    .flzc{margin-top: 0.5rem;}
    /* .van-sidebar{margin-top: 2.7rem !important;width: 6rem !important;}
    .van-sidebar-item--select::before {
        width: 3px !important;
        height: 60px !important;
        background-color: #ff6298 !important;
    } */
    .zbdhl{margin-top: 46px;width: 30%;}
    .zblb{border: 0.5px solid #ccc;padding: 1rem 0.7rem;font-size: 0.8rem;color: #423f40;}
    .flei{width: 100%;}
    .zbdhl{float: left;} 
    .yccpt{float: right;margin-top: 5rem;width: 70%;} 
    .yccpkd{margin-left: 0.6rem;}
    .hengpai{float: left;width: 30%;margin: 0.2rem;} 
    .jgtu{width: 4rem;height: 4rem;} 
    .hengpai li{font-size: 0.6rem;}
    .wzys{color: grey;}
    .spm{text-align: center;}
    .zbdhl>div>ul>li span:hover{color: #ff6298;}
    /* .active{color:#ff6298;} */
    .van-search3{margin-top: 1rem !important;}
</style>