<template>
    <div class="cartbg">
        <my-header></my-header>      
        <div  v-if="this.$store.state.car.length>0">       
            <div class="carbg2">
                <div v-for="(i,k) in this.$store.state.car" :key="k" class="gwcmgsp"> 
                        <input type="checkbox" @click="selectSingle(k)" :checked="allSelectedGoods.indexOf(i.lid)>=0" class="xaun">                       
                        <span class="gwcspxx">
                            <img v-lazy="i.simg" alt="图片未加载" class="gwcimgdx" >  
                        </span>
                        <span class="gwcspxx2">
                            <p class="gwcwzdx">
                                <router-link :to="`/details/${i.lid}`" class="gspwzys">
                                    {{i.sname}}
                                </router-link>
                                <a @click="remove(i)">
                                    <img src="../assets/cart/delete.png" alt="" class="gwcspsc">
                                </a>  
                            </p>
                            <div class="spname">
                                <router-link :to="`/details/${i.lid}`">
                                    <span class="gwcjgys">¥ {{parseFloat(i.price* i.addCount).toFixed(2)}}</span>
                                </router-link>
                                <p class="sljj">
                                    <a class="jsl">
                                        <span @click="minus(i)">-</span>
                                    </a>
                                    <input readonly :value="i.addCount" class="inputsl">
                                    <a class="jsl2">
                                        <span @click="add(i)">+</span>
                                    </a>
                                </p>
                            </div>
                        </span>
                </div>
            </div>
            <div class="dbzwc">
                <div class="gwcdb dbtx">
                    <input type="checkbox"  @click="selectAll()" :checked="this.$store.state.car.length===allSelectedGoods.length&&this.$store.state.car.length" class="xaun2">
                    <span class="qxwz">全选</span>
                    <span class="zongji">
                        <p class="dbzj">总计： 
                            <span class="zqys">¥ {{parseFloat(totalPrice).toFixed(2)}}</span>
                        </p>
                        <p class="bdys">已省：¥0.00</p>
                    </span>
                    <span class="gwcjs">
                        <a href="">
                            <p class="gwcjswz">结算</p>
                        </a>
                    </span>
                </div>
            </div>
            
        </div>
        
        <div class="gwckk" v-else>
            <p>
                <img src="../assets/cart/kgwc.png" alt="" class="kgwctp">
            </p>
            <p>亲，您的购物车空空的哟~</p>
            <p>
                <a href="/">
                    <p class="jxgwan">继续购物</p>
                </a>
            </p>
        </div>
    </div>
</template>
 
<script>
import { Dialog } from 'vant';
export default {
    data(){
        return{
            //控制全选
            allChecked: true,
            //存放被选择的数据
            allSelectedGoods: []
        }
    },
    methods:{
        minus(i){
            if(i.addCount>1){i.addCount--}
        },
        add(i){
           i.addCount++            
        },
        remove(i){ 
            Dialog.confirm({
                message: '确定要将该产品从购物车中移除吗？',
            })
            .then(() => {
                this.$store.state.car= this.$store.state.car.filter((item)=>{
                    return item !=i;
                    
                })
                //获取到最新的一个对象
                    //把这个对象转换成json字符串，存入本地缓存
                    let shopcar =JSON.stringify( this.$store.state.car);
                    localStorage.setItem('car',shopcar);
                    //将移除之后的数据重新赋值给 store商店 里面的 car数组，以后取得时候，就会得到修改之后的car数组
                    this.$store.state.car= this.$store.state.car;
            });
        },
        //点击单选按钮
        selectSingle(k) {
            if (event.currentTarget.checked) {
                this.allSelectedGoods.push(this.$store.state.car[k].lid)
            } else {
                for (var i = 0; i < this.allSelectedGoods.length; i++) {
                    if (this.$store.state.car[k].lid === this.allSelectedGoods[i]) {
                        this.allSelectedGoods.splice(i, 1);
                        this.allChecked = false;
                        break;
                    }
                }
            }
            console.log(this.allSelectedGoods)
        },
        //点击全选按钮
        selectAll() {
            //event.currentTarget.checked表示点击完后该选择框的状态
            if (!event.currentTarget.checked) {
                this.allSelectedGoods = [];
            } else {

                this.allSelectedGoods = [];//先置空，然后再重新添加，不然数组里会有重复！因为有可能点击全选之前已经选择了几个单选按钮。也就是数组里已经添加过了对应的id。
                this.$store.state.car.forEach((i, k) => {
                    this.allSelectedGoods.push(i.lid)
                })
            }
            console.log(this.allSelectedGoods)
        },
    }, 
    computed: {
        //totalPrice计算总价
        totalPrice() {
            var totalprice = 0;
            //加入选择框以后的计算总价
            this.$store.state.car.forEach((i, k) => {
                if (this.allSelectedGoods.indexOf(i.lid) !== -1) {
                    totalprice += i.price * i.addCount;
                }
            });
            return totalprice;
        },
    }
}
</script>

<style>
    .cartbg{background-color: #f7f7f7;height: 150vh;}
    .carbg2{background-color: #fff;border-radius:0.3rem;margin-top: 4rem;margin-bottom: 8rem; display: inline-block;width: 94%;margin-left:3%;margin-right: 3%;}
    .inputsl{width: 23px;position: absolute;margin-left: 2.5rem;height: 21px;text-align: center;border: 1px solid #ccc;border-right: 0;}
    .gwcimgdx{width: 100%;border-radius: 8%;}
    .gwcspxx,.gwcspxx2{float: left;width:30%;}
    .gwcmgsp{width: 100%;display: inline-block;border-bottom: 1px solid #ccc;}
    .gwcspxx2{padding-top: 4%;padding-left: 5%;}
    .gwcspxx{padding-top: 2%;padding-bottom: 2%;margin-left: 1.5rem;}
    .gwcwzdx{font-size: 0.9rem;padding-bottom: 3.2rem;padding-top: -2rem;}
    .gwcjgys{color: #ff6298;}
    .jsl{width: 23px;height: 23px;border: 1px solid #ccc;position: absolute;margin-left: 1rem;}
    .jsl2{width: 23px;height: 23px;border: 1px solid #ccc;position: absolute;margin-left: 4rem;}
    .sljj a span{width: 20%;display: inline-block;}
    .sljj{margin-top: -5%;position: absolute;text-align: center;padding-left:25%;}
    .jsl span{padding-top: 0.1rem;}
    .jsl2 span{padding-top: 0.22rem;padding-right: 0.2rem;}
    .gwcspsc{position: absolute;padding-left: 30%;}
    .xaun{position: absolute; margin-left: 0.2rem;margin-top: 2.8rem;}

    .gwckk{padding-top: 8rem;width: 100%; text-align: center;color: #666;font-size: 0.8rem;}
    .jxgwan{border: 1px solid #ff6298;border-radius:1rem;width: 50%;margin: 0 auto;margin-top: 1rem;color: #ff6298;padding: 0.5rem;}
    .kgwctp{width: 30%;margin-bottom: 1rem;}

    .gwcdb{ width: 100%;border-top: 1px solid #e3e3e3;height: 3rem; background-color: #fff;position: fixed;bottom: 0;left: 0;}
    .gwcjs{width: 30%;float: right;background-color: #ff6298;height: 3rem;text-align: center;line-height: 3rem;}
    .gwcjswz{color: #fff;}
    .xaun2{margin-left: 0.8rem;margin-top: 0.8rem;display: inline-block;}

    .qxwz{margin-left: 2rem;line-height: 1rem;text-align: center;margin-left: 0.5rem;} 
    .zongji{margin-left: 1.3rem;margin-bottom: 1rem;position: absolute;margin-top: 0.8rem;}
    .dbzj{font-size: 0.9rem;}
    .zqys{color: #ff6298;font-size: 1rem;}
    .bdys{font-size: 0.5rem;color: #ccc;padding-bottom: 1rem;display: inline;}
    .gspwzys{color: #000;font-size: 0.9rem;}

    .xaun,.xaun2{
        -webkit-appearance: radio;
        border: 1px solid #fff;
        width: 15px;height: 15px;
        border-radius: 50%;
    }
    .xaun[type="checkbox"]::before,.xaun2[type="checkbox"]::before {
        content: "";
        position: absolute;
        background: #fff;
        width: 15px;
        height: 15px;
        border: 1px solid #ff6298;
        border-radius: 50%;
        color: #fff;
        box-sizing: border-box;
    }
    .xaun[type="checkbox"]::before {
        top: 0;
        left: 0;
    }
    .xaun[type="checkbox"]:checked::before,.xaun2[type="checkbox"]:checked::before {
        content: "\2713";
        background-color: #ff6298;
        position: absolute;
        width: 15px;
        height: 15px;
        color: #fff;
        font-size: 1rem;
        border-radius: 50%;
    }
    .xaun[type="checkbox"]:checked::before{
        top: 0;
        left: 0;
    }
    .xaun2[type="checkbox"]::before {
        top:0.8rem;
        left:0.8rem;
    }
    .xaun2[type="checkbox"]:checked::before {
        top:0.8rem;
        left:0.8rem;
    }
</style>