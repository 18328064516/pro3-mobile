<template>
  <div class="head">
    <van-nav-bar fixed>
      <template #left>
        <a href="/">
          <img
            src="../assets/logo.png"
            slot="icon"
            class="hzimg"
            style="width:30px;height:30px;"
          />
        </a>
        <a href="/"><p class="yuren">予人鲜花网</p></a>
      </template>
      <template #right>
        <!-- <a @click="go(k+1)" class="ssanah"> -->
        <a @click.stop="search" class="ssanah">
          <span class="spyfdj">
            <van-icon name="search" size="18" color="#fff" />
          </span>
          <span class="sousuo">搜索</span>
        </a>
        <p class="shuxian">|</p>
        <a href="/mycenter">
          <p class="hyzx">
            <a href="/mycenter" class="hyzx">会员中心</a>
          </p>
        </a>
      </template>
    </van-nav-bar>
    <div v-show="isshow">
      <div
        class="van-popup van-popup--bottom  van-sku-container2"
        style="z-index: 2002;"
      >
        <form action="/">
          <van-search
            class="van-search4"
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
</template>

<script>
export default {
  data() {
    return {
      isshow: false,
      kw: "",
      pid: "11",
    };
  },
  methods: {
    search: function() {
      this.isshow = true;
    },
    onCancel: function() {
      this.isshow = false;
      this.$router.go(-2);
    },
    onSearch() {
      //用到了防抖
      clearTimeout(this.timer);
      this.timer = setTimeout(() => {
        if (this.kw.trim() !== "") {
          console.log(`查询${this.kw}相关的东西`);
          this.$router.push("/productsAll/" + this.kw);
        }
      }, 500);
    },
  },
  watch: {
    $route() {
      this.kw = this.$route.params.kw;
    },
  },
};
</script>

<style>
.van-nav-bar {
  background-color: #ff6298 !important;
  width: 100%;
}
.van-nav-bar__left {
  padding-left: 12px !important;
  width: 100% !important;
}
.van-search {
  padding: 0 !important;
  padding-left: 20px !important;
  width: 100% !important;
  min-width: 200px !important;
  padding-right: 20px !important;
  margin-right: 50px !important;
}
.van-search .van-cell {
  padding-top: 0 !important;
  padding-bottom: 0 !important;
  height: 30px !important;
  width: 100% !important;
}
.van-field__control {
  line-height: 30px !important;
}
.van-icon-search {
  line-height: 32px !important;
}
.van-nav-bar__right {
  padding-right: 15px !important;
  padding-left: 5px !important;
  width: auto !important;
  height: auto !important;
}
.hyzx {
  color: #fff;
}
.ssanah {
}
.sousuo {
  color: #fff;
  margin-right: 1rem;
  display: inline-block;
}
.shuxian {
  color: #fff;
  margin-right: 1rem;
}
.yuren {
  color: #fff;
  margin-left: 1rem;
}
.hyzx {
  color: #fff;
}
.van-sku-container2 {
  min-height: 100% !important;
}
.sous {
  font-size: 0.9rem;
  padding-right: 0.5rem;
}
.spyfdj {
  position: absolute;
  left: -1rem;
  bottom: 0.45rem;
}
.van-search4 {
  margin-top: 1rem !important;
}
</style>
