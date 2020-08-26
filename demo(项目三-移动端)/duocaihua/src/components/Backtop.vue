<template>
  <div class="">
        <transition>
	<div class="gotop-index" v-show="btnFlag">
      <a href="javascript:;" class="gotop-a" @click="backTop"></a>
    </div>
	</transition>
  </div>
</template>
 
<script>
export default {
  data() { 
    return {
        btnFlag: false
    }
  },
  mounted() {
    // 此处true需要加上，不加滚动事件可能绑定不成功
    window.addEventListener("scroll", this.scrollToTop, true);
  },
  destroyed() {
    window.removeEventListener("scroll", this.scrollToTop, true);
  },
  methods:{
      backTop() {
      const that = this;
      let timer = setInterval(() => {
        let ispeed = Math.floor(-that.scrollTop / 5);
        document.documentElement.scrollTop = document.body.scrollTop =
          that.scrollTop + ispeed;
        if (that.scrollTop === 0) {
          clearInterval(timer);
        }
      }, 16);
    },
    // 为了计算距离顶部的高度，当高度大于30显示回顶部图标，小于30则隐藏
    scrollToTop() {
     // console.log(123);
      const that = this;
      let scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
      that.scrollTop = scrollTop;
      if (that.scrollTop > 30) {
        that.btnFlag = true;
      } else {
        that.btnFlag = false;
      }
    },
  },
 }
</script>
 
<style lang="css" scoped>
  .wrap_box{
 
  }
  /*返回顶部*/
.gotop-index {
  position: fixed;
  right: 1rem;
  bottom: 5rem;
  display: block;
  width: 2rem;
  height: 2rem;
  background: #fff;
 /* box-shadow: 0px 0px 4px #ff0000; */
  display: flex;
  border-radius: 50%;
  z-index: 999;
}
.gotop-a {
  display: block;
  width: 3rem;
  height: 3rem;
  background: url(../assets/backtop.png) no-repeat 0 0;
  background-size: 2rem;
  margin: auto;
}
</style>