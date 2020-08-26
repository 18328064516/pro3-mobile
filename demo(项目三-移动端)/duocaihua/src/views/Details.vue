<template>
    <div class="xqybg">
        <!-- 第一部分 -->
        <my-header></my-header>
        <div>
            <!-- 第二部分 -->
            <div class="dmidd1">
                <div>
                    <img v-lazy="info.bimg" alt="图片未加载" class="dimg">
                </div>
                <div class="dmidtwo">
                    <div class="dyh">
                        <span class="dsname">{{info.sname}}</span>
                        <span  class="dfenxiang">
                            <div class="dycfx">
                                <div>
                                    <img src="../assets/details/fx.png" alt="">
                                </div>
                                <div>分享</div>
                            </div>
                        </span>
                    </div>
                    <p class="dprice">¥ {{parseFloat(info.price).toFixed(2)}}</p>
                </div>
            </div>
            <!-- 第三部分 -->
            <div class="dmidd2">
                <van-tabs v-model="active">
                    <van-tab title="产品参数">
                        <div class="cpcs">
                            <p class="cpcsjg">
                                <span class="cpcszc">价格：</span>
                                <span class="cpcsyy">¥ {{parseFloat(info.price).toFixed(2)}}</span>   
                            </p>
                            <p class="cpcsjg">
                                 <span class="cpcszc">材料：</span>
                                 <span class="cpcsyy">{{info.cailiao}}</span>   
                            </p>
                            <p class="cpcsjg">
                                <span class="cpcszc">包装：</span>
                                <span class="cpcsyy">{{info.baozhaung}}</span>
                            </p>
                            <p class="cpcsjg">
                                <span class="cpcszc">销量：</span>
                                <span class="cpcsyy">{{info.xiaolaing}}</span>
                            </p>
                        </div>
                    </van-tab>
                    <van-tab title="产品详情">
                        <div id="cpxaingqing">
                            <img v-lazy="info.bimg" alt="图片未加载" class="dimg">
                        </div>
                    </van-tab>
                    <van-tab title="产品评论">
                        <div id="cppinglun">
                            <span class="cpcsyy"> 
                                <div class="pinglun1">
                                    <span>
                                        <img v-lazy="duixaing.split(',')[0]" alt="图片未加载" class="touxiang">
                                    </span>
                                    <span class="plxx">
                                        <p class="plyhmrq">{{duixaing.split(',')[1]}}</p>
                                        <p class="plyhmrq">{{duixaing.split(',')[2]}}</p>
                                    </span>
                                    <p class="pltext">{{duixaing.split(',')[3]}}</p>
                                </div>
                                <div class="pinglun1">
                                    <span>
                                        <img v-lazy="duixaing2.split(',')[0]" alt="图片未加载" class="touxiang">
                                    </span>
                                    <span class="plxx">
                                        <p class="plyhmrq">{{duixaing2.split(',')[1]}}</p>
                                        <p class="plyhmrq">{{duixaing2.split(',')[2]}}</p>
                                    </span>
                                   <p class="pltext">{{duixaing2.split(',')[3]}}</p>
                                </div>
                            </span>
                                
                        </div>
                    </van-tab>
                </van-tabs>
            </div>
            <!-- 底部导航栏 -->
            <div class="footer">
                <van-tabbar route fixed>
                    <van-tabbar-item to="/" icon="wap-home-o" id="biankaungxain1">
                        首页
                    </van-tabbar-item>
                    <van-tabbar-item to="/" icon="service-o" id="biankaungxain">
                        客服
                    </van-tabbar-item>
                    <van-tabbar-item to="/cart" icon="shopping-cart-o" id="biankaungxain">
                        购物车
                    </van-tabbar-item>
                    <!-- <van-tabbar-item  to="/cart" class="dljgm1"> -->
                    <van-tabbar-item class="dljgm1">
                        <span class="jrgwcwz"  @click="join">加入购物车</span>
                    </van-tabbar-item>
                    <van-tabbar-item  to="/" class="dljgm2">
                        <span class="jrgwcwz">立即购买</span>  
                    </van-tabbar-item>
                </van-tabbar>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return {
            //通过数组中的一个对象来存储产品的相关详细信息
           info:{},
           active:0,
           duixaing:'',
           duixaing2:'',
           count:1,//详情页加入购物车的默认商品数量

        }
    },
    created(){
        //动态获取地址栏中的动态的参数cid
        let cid=this.$route.params.cid;//该语句截取的是index.js中的路由中后面的cid(/details/:cid)
        console.log(cid);
        //发送请求
        this.axios.get("/pro/view?id="+cid).then(res=>{
            //将返回结果存储到这个对象中
            this.info=res.data.results[0];//可以在前端取数组的一个对象，也可以直接在后台写results：results[0]。
            //因为是链式操作，所以需要声明一个变量保存info.pinglunwzone，让其split前只有一个点
            this.duixaing=this.info.pinglunwzone;
            this.duixaing2=this.info.pinglunwztwo;
        });
    },
    methods:{
        join(){
            if(!this.$store.state.isLogin){
            this.$toast({
                message:"您需要先登录才能操作",
                position:"center",
                duration:3000,
                
            });
            this.$router.push('/login')
            }else{
            this.$toast({
                message:"添加成功！",
                position:"center",
                duration:3000,
                
            });
            this.$router.push('/cart')
            };

            //点击之后，把当前商品的所有信息都搜集起来
            let goodsInfo={
                lid:this.info.lid,
                simg:this.info.simg,
                sname:this.info.sname,
                price:this.info.price,
                addCount:this.count,
            }
            //调用store中的mutaitions 来将商品加入购物车
            this.$store.commit('addToCar',goodsInfo);
            console.log(goodsInfo)
        },
    },
    
}
</script>

<style>
    .xqybg{background-color: #f5f5f5;}
    .dmidd1{margin-top:2.9rem;background-color: #fff;}
    .dimg{width: 100%;}
    .dname{width: 70%;}
    .dsname{padding-left:0.8rem;font-size: 1rem;line-height: 2rem;}
    .dfenxiang{width: 20%;float: right;border-left: 1px solid #ccc;font-size: 0.7rem;} 
    .dycfx{padding-left: 0.5rem;}
    .dprice{padding:0.7rem;color: #ff6298;font-size: 1.3rem;}
     
    .dmidd2{margin-top:1rem;background-color: #fff;}
    .cpcsjg{border-top: 1px solid #ccc;line-height: 3rem;color: #646566;font-size: 0.6rem;}
    .cpcsyy{margin-left: 4.3rem;}
    .cpcszc{margin-left: 0.8rem;color: #999;}
    .van-tabs__line{width: 30% !important;background-color: #ff6298 !important;height: 2px !important;}
    .touxiang{width: 2.5rem;height: 2.5rem;border-radius: 50%;float: left;}
    .cppinglun{border-top: 1px solid #ccc;}
    .pinglun1{margin-left: 1rem;margin-right: 1rem; border-top: 1px solid #ccc;height: 5rem;margin-top: -1rem;padding-top: 0.8rem;padding-bottom: 0.8rem;}
    .plyhmrq{padding-bottom: 0.3rem;}
    .plxx{float: left;color: #333;font-size: 0.5rem;margin-left: 1rem;margin-top: 0.6rem;}
    .pltext{position: absolute;margin-top: 3.5rem;color: #333;font-size: 0.5rem;margin-right: 1rem;}
</style>