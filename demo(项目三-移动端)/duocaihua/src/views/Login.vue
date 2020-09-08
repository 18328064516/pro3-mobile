<template>
  <div>
    <my-header></my-header>
  <van-form>
  <!-- 用户名-->
    <van-field
      type="text"
      label="用户名"
      placeholder="请输入用户名"
      v-model="username"
      :state="usernameState"
      @blur.native.capture="checkUsername"
    />
    <!-- 密码 -->
    <van-field
      type="password"
      label="密码"
      placeholder="请输入密码"
      v-model="passwd"
      :state="passwdState"
      disableClear
      @blur.native.capture="checkPasswd"
    />
    <div class="mdl">
      <van-checkbox v-model="checked" checked-color="#ff6298" shape="square" icon-size="14px">
         <span class="jzw">记住我（两周内免登录）</span>
      </van-checkbox>  
    </div>
    <div style="margin: 16px;">
      <van-button round block type="info" @click="handle">
          登录
      </van-button>
    </div>
    <div class="wjzc">
      <a href="/" class="wjmm">忘记密码？</a>
      <a href="/register" class="mfzc">免费注册</a>
    </div>
  </van-form>

  </div>
</template>
<script>
export default {
  data(){
    return {
      //保存用户名
      username:'',
      //保存密码
      passwd:'',
      checked: true,
      //保存用户名的状态
      usernameState:'',
      //保存密码的状态
      passwdState:'',
    }
  },
  methods:{
    //检测用户名
    checkUsername(){
        let username = this.username;
        //校验用户名,用户名的规则为:匹配中文，英文字母和数字及下划线_
        let usernameRegExp = /^[\u4e00-\u9fa5_a-zA-Z0-9]+$/;
        if(usernameRegExp.test(username)){
          this.usernameState = 'success';
          return true;
        } else{
          this.usernameState = 'error';
          this.$toast({
            message:"请输入合法用户名",
            position:"top",
            duration:2000
          });
          return false;
        }
    },
    //检测密码
    checkPasswd(){
      let passwd = this.passwd;
      //校验密码,密码的规则为:字母、数字及下划线的组合,长度为8~20个字符
      let passwdRegExp = /^[0-9A-Za-z_]{8,20}$/;
      if(passwdRegExp.test(passwd)){
        this.passwdState = 'success';
        return true;
      } else {
        this.passwdState = 'error';
        this.$toast({
          message:"请输入合法密码",
          position:"top",
          duration:2000
        });
        return false;
      }
    },
    handle(){     
      this.axios.post('/user/login','username='+this.username+'&passwd='+this.passwd).then(res=>{ 
              //登录成功
              if(res.data.code == 1){
                this.$router.push('/mycenter');
                //调用Vuex中Mutations来修改state中的状态
                this.$store.commit('login_mutation',res.data.results);
                //将用户登录的状态存储到WebStorage中
                //之所以要将用户登录的状态存储到webStorage中的
                //原因是：为防止用户刷新页面中,整个页面重新加载
                sessionStorage.setItem('isLogin',true);
                sessionStorage.setItem('username',res.data.results.username); 
              } else {
                //登录失败
                this.$messagebox("登录提示","用户名或密码错误");
              }
          });
      
    }
  }
}
</script>

<style>
  .van-form{margin-top:80px !important;padding-left: 30px;padding-right: 30px;}
  .van-button--info {
    color: #fff;
    background-color: #ff6298 !important;
    border: 1px solid #ff6298 !important;
  }
  .mdl{text-align: left;margin-top: 1.5rem;margin-left: 10%;}
  .jzw{color: grey;font-size: 12px;}
  .wjzc{text-align: right;margin-right: 1.9rem;}
  .wjmm,.mfzc{color: #ff6298;font-size: 0.7rem;}

</style>