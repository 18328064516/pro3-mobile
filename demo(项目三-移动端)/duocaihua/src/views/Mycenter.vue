<template>
    <div class="wdbg">
        <!-- 顶部 -->
        <div class="grzx">
            <span class="touxia">
                <img src="../assets/wode/touxiang.png" alt="" class="xtouxaing">
            </span>
            <span v-if="!this.$store.state.isLogin" >
                <a href="/login" class="qxdl">请先登录</a> 
            </span>
            <span class="dlhyhm" v-else>{{this.$store.state.username}}</span>
            <span class="pthy">普通会员</span>
        </div>
        <!-- 中间 -->
        <div class="wdddbg">
            <!-- 中间第一部分 -->
            <div class="wddd">
                <div class="wdwddd">
                    <div class="wdddwz">
                        我的订单
                        <van-icon name="arrow" color="#ccc" class="wdddjt" />
                    </div>
                </div>
                <div class="dfk">
                    <ul class="wdjz">
                        <li>
                            <img src="../assets/wode/dfk.png" alt="" class="dfkqb" ><br>
                            待付款
                        </li>
                        <li>
                            <img src="../assets/wode/dfh.png" alt="" class="dfkqb" ><br>
                            待发货
                        </li>
                        <li>
                            <img src="../assets/wode/dsh.png" alt="" class="dfkqb" ><br>
                            待收货
                        </li>
                        <li>
                            <img src="../assets/wode/ysh.png" alt="" class="dfkqb" ><br>
                            已收货
                        </li>
                    </ul>
                </div>
            </div> 
        </div>
        <!-- 中间第二部分 -->
        <div class="wdddbg2">
            <div>
                <img src="../assets/wode/txdd.png" alt="" class="dfkqb" >
                <span>填写订单</span>
                <van-icon name="arrow" color="#ccc" class="wdddjt" />
            </div>
            <div>
                <img src="../assets/wode/wdjf.png" alt="" class="dfkqb" >
                <span>我的积分</span>
                <van-icon name="arrow" color="#ccc" class="wdddjt" />
            </div>
            <div>
                <img src="../assets/wode/yhq.png" alt="" class="dfkqb" >
                <span>我的优惠券</span>
                <van-icon name="arrow" color="#ccc" class="wdddjt" />
            </div>
            <div>
                <img src="../assets/wode/grzl.png" alt="" class="dfkqb" >
                <span>个人资料</span>
                <van-icon name="arrow" color="#ccc" class="wdddjt" />
            </div>
            <div>
                <img src="../assets/wode/xgmm.png" alt="" class="dfkqb" >
                <span>修改密码</span>
                <van-icon name="arrow" color="#ccc" class="wdddjt" />
            </div>
        </div>
         <!-- 中间第三部分 -->
         <div class="wdddbg3">
             <div>
                <img src="../assets/wode/tcdl.png" alt="" class="dfkqb" >
                <span>
                    <a href="/" @click="tuichu" class="tcdl">退出当前登录</a> 
                </span>
                <van-icon name="arrow" color="#ccc" class="wdddjt" />
            </div>
         </div>
        <!-- 底部导航栏 -->
        <div style="margin-top:50px">
        <van-tabbar v-model="active" active-color="#ff6298" fixed>
            <van-tabbar-item icon="wap-home-o" to="/">首页</van-tabbar-item>
            <van-tabbar-item icon="shop-o">
                <a href="/fenlei/1" class="cpfl2">产品分类</a>
            </van-tabbar-item>
            <van-tabbar-item icon="service-o">在线咨询</van-tabbar-item>
            <!-- <van-tabbar-item icon="chat-o">QQ咨询</van-tabbar-item> -->
            <van-tabbar-item icon="shopping-cart-o"  @click="qgwc" >购物车</van-tabbar-item>
            <van-tabbar-item icon="contact" name="contact">我的</van-tabbar-item>
        </van-tabbar>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            active: 'contact',
        }
    },
    methods:{
        tuichu(){
            this.$store.commit('logout_mutation');
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
    }
}
</script>

<style>
    .wdbg{background-color: #f7f7f7;height: 800px;}
    .grzx{height: 5rem;background-color: #fd6980;}
    .dlhyhm{color: #fff;font-size: 14px;margin-top:8%;position: absolute;margin-left:2%;font-size: 1rem;}
    .touxia{margin-left: 2rem;margin-top: 1rem;}
    .xtouxaing{width: 45px;height: 45px;margin-left: 4.8%;margin-top: 5%;border-radius: 50%;}
    .pthy{color: #fff;font-size: 0.6rem;margin-left: 0.5rem;position: absolute;margin-top:13%;}
    .touxia{width: 49px;height: 49px;margin-left: 5%;margin-top: 1.1rem;background-color: #fff;display: inline-block;border-radius: 50%;border: 1px solid #ccc;}
    .dfk ul li{float: left;font-size: 0.7rem;color: #999;margin: 5% 7%;}
    .wdddbg{background-color: #fff;display: inline-block;margin-top: 4%;width: 100%;}
    .wdwddd{padding-bottom: 1.1rem;padding-top: 0.4rem;border-bottom: 1px solid #f0f0f0;}
    .wdddwz{font-size: 0.9rem;color: #666;margin-left: 6%;margin-top: 4%;}
    .wdddjt{float: right;margin-right: 5%;padding-top: 0.3rem;}
    .dfkqb{width: 24px;height: 24px;margin-left: 0.5rem;}
    .dfk{width:100%;margin:0 auto;}

    .wdddbg2{background-color: #fff;display: inline-block;margin-top: 2%;width: 100%;color: #666;font-size: 0.9rem;}
    .wdddbg2 div{border-bottom: 1px solid #f0f0f0;padding-bottom: 0.8rem;padding-top: 0.8rem;padding-left: 1rem;}
    .wdddbg2 div span{position: absolute;padding-top: 0.4rem;padding-left: 0.5rem;}
    
    .wdddbg3{background-color: #fff;display: inline-block;margin-top: 2%;width: 100%;color: #666;font-size: 0.9rem;}
    .wdddbg3 div{padding-bottom: 0.8rem;padding-top: 0.8rem;padding-left: 1rem;}
    .wdddbg3 div span{position: absolute;padding-top: 0.4rem;padding-left: 0.5rem;}
    .tcdl{color:#666 ;}
    .cpfl2{color: #666;}
    .qxdl{color: #fff;position: absolute;margin-top: 1.5rem;margin-left: 0.5rem;}
</style>