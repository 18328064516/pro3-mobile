<template>
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
            <van-tabbar-item  to="/cart" class="dljgm1">
                <span class="jrgwcwz">加入购物车</span>
            </van-tabbar-item>
            <van-tabbar-item  to="/" class="dljgm2">
                <span class="jrgwcwz">立即购买</span>  
            </van-tabbar-item>
        </van-tabbar>
    </div>
</template>


<style>
    .footer{margin-top: 3rem;}
    .dljgm1{background-color: #fa938a;}
    .dljgm2{background-color: #ff6298;}
    .jrgwcwz{font-size: 0.8rem;color: #fff;}
    #biankaungxain{border-left: 0.1px solid #ccc;border-top: 0.1px solid #ccc;}
    #biankaungxain1{border-top: 0.1px solid #ccc;}
</style>