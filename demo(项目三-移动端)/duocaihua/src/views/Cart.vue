<!--实现功能： 购物车商品数量的加减，删除，单选和全选 -->
<!-- 购物车的增删改查参考： -->
<template>
    <div class="cartbg">
        <my-header></my-header>      
        <div  v-if="this.$store.state.car.length>0">       
            <div class="carbg2">
                <div v-for="(i,k) in this.$store.state.car" :key="k" class="gwcmgsp"> 
                        <!--以下input输入框中 :checked属性绑定的是存放选中商品的数组中某一个商品的下标大于等于0，即该商品必须存在。-->
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
                                <!-- parseFloat() 函数可解析一个字符串，并返回一个浮点数。 -->
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
                    <!--以下input输入框中 :checked属性绑定的条件是购物车的长度要等于选中商品的数组的长度，且购物车中必须得有商品-->
                    <input type="checkbox"  
                        @click="selectAll()" 
                        :checked="this.$store.state.car.length===allSelectedGoods.length && this.$store.state.car.length" class="xaun2">
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
                //在数组car中过滤出和 准备删除的元素 不相等的元素，返回给数组car，相等的即为要删掉的元素。最后再将过滤后得到的新数组赋值给原数组。
                this.$store.state.car= this.$store.state.car.filter((item)=>{
                    //返回不满足条件的元素，满足条件的即为要删除的元素i
                    return item !=i;
                    
                })
                //获取到最新的一个对象
                    //把这个对象转换成json字符串,存入本地缓存
                    let shopcar =JSON.stringify( this.$store.state.car); 
                    localStorage.setItem('cart',shopcar);
                    //将移除之后的数据重新赋值给 store商店 里面的 car数组，以后取的时候，就会得到修改之后的car数组
                    this.$store.state.car= this.$store.state.car;
            });
        },
        //点击单选按钮
        //单选按钮原理：①先判断是否选中某个商品，如果选中则添加到提前在data中定义的一个存放选中商品的数组里，
        //②如果要取消某个商品的选中状态，则先对那个专门存放选中商品的数组进行遍历，并判断取消选中状态的商品id是否和之前放入选中商品的数组里的某一个商品id相同，如果相同就可以删除，同时要改变全选按钮的选中状态为false。
        selectSingle(k) {
            //event.currentTarget.checked表示点击完后该选择框的状态
            //allSelectedGoods：存放被选中商品的数组
            if (event.currentTarget.checked) {
                this.allSelectedGoods.push(this.$store.state.car[k].lid)
            } else {
                for (var i = 0; i < this.allSelectedGoods.length; i++) {
                    if (this.$store.state.car[k].lid === this.allSelectedGoods[i]) {
                        //splice() 方法的三种使用方法:删除，插入和替换。
                        //插入：可以向指定的位置插入任意数量的项，需要3个参数：起始位置、0（要删除的项数）和要插入的项。
                        //替换：可以向指定位置插入任意数量的项，且同时删除任意数量的项。需要3个参数：起始位置、要删除的项数和要插入的项。
                        //删除：可以删除任意数量的项，只要指定两个参数：要删除的第一项的位置和删除的项数。例如：splice(0,2)会删除数组中的前两项。
                        
                        this.allSelectedGoods.splice(i, 1);//此处的splice用处是删除:删除i位置的一个元素
                        this.allChecked = false;//全选为false，即不全选中  
                        break;
                    }
                }
            }
            console.log(this.allSelectedGoods)
        },
        //点击全选按钮
        //全选按钮原理：①点击全选按钮时先判断全选按钮是否被选中，如果没有选中则将提前在data中定义的存放选中商品的数组清空，
        //            ②如果点击一下全选按钮，全选按钮是选中状态，为了避免数组里数据重复，也需要先将数组置空，然后针对那个专门放置选中商品数组进行遍历，将购物车中所有的商品添加到数组里。
        selectAll() {
            //event.currentTarget.checked表示点击完后该选择框的状态
            if (!event.currentTarget.checked) {
                this.allSelectedGoods = [];
            } else {
                //先置空，然后再重新添加，不然数组里会有重复！因为有可能点击全选之前已经选择了几个单选按钮。也就是数组里已经添加过了对应的id。
                this.allSelectedGoods = [];
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