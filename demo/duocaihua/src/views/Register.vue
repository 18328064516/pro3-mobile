<template>
  <div>
    <my-header></my-header>
  <van-form class="vanf">
  <!-- 账号-->
    <van-field
      type="text"
      label="账号"
      placeholder="请输入账号(必填)"
      v-model="username"
      :state="usernameState"
      @blur.native.capture="checkUsername"
    />
    <!-- 密码 -->
    <van-field
      type="passwd"
      label="密码"
      placeholder="请输入密码(必填)"
      v-model="passwd"
      :state="passwdState"
      disableClear
      @blur.native.capture="checkPasswd"
    />
    <!-- 确认密码 -->
    <van-field
      type="passwd"
      label="密码"
      placeholder="请输入确认密码(必填)"
      v-model="passwd2"
      :state="passwd2State"
      :attr="{maxlength:'10',autocomplete:'off'}"
      @blur.native.capture="checkConPasswd"
    />
    <!-- 姓名-->
    <van-field
      type="text"
      label="姓名"
      placeholder="请输入姓名"
      v-model="xinname"
      :state="xinnameState"
      @blur.native.capture="checkXinname"
    />
    <!-- 手机区号-->
    <!-- <van-field
      type="text"
      label="手机区号"
      placeholder="中国大陆 0086"
      v-model="quhao"
      :state="quhaoState"
      @blur.native.capture="checkQuhao"
    /> -->
    <!-- 手机-->
    <van-field
      type="tel"
      label="手机"
      placeholder="请输入手机(必填)"
      v-model="phonenumber"
      :state="phonenumberState"
      @blur.native.capture="checkPhonenumber"
    />
    <!-- 注册 -->
    <div style="margin: 16px;">
      <van-button round block type="info" @click="handle">
          注册
      </van-button>
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
      //保存确认密码
      passwd2:'',
      xinname:'',
      // quhao:'',
      phonenumber:'',

      //保存用户名的状态
      usernameState:'',
      //保存密码的状态
      passwdState:'',
      //保存确认密码的状态
      passwd2State:'',
      xinnameState:'',
      // quhaoState:'',
      phonenumberState:'',

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
    //检测确认密码
    checkConPasswd(){
      let passwd2 = this.passwd2;
      if(passwd2 == this.passwd){
        this.passwd2State = 'success';
        return true;
      } else {
        this.passwd2State = 'error';
        this.$toast({
          message:"两次密码不一致",
          position:"top",
          duration:2000
        });
        return false;
      }
    },
    //检测姓名
    checkXinname(){
        let xinname = this.xinname;
        let xinnameRegExp =/^[\u4E00-\u9FA5]{2,4}$/;
        if(xinnameRegExp.test(xinname)){
          this.xinnameState = 'success';
          return true;
        } else{
          this.xinnameState = 'error';
          this.$toast({
            message:"姓名请输入中文",
            position:"top",
            duration:2000
          });
          return false;
        }
    },
     //检测手机区号
    // checkQuhao(){
    //     let quhao = this.quhao;
    //     let quhaoRegExp =/^(\\+86|0086)$/;
    //     if(quhaoRegExp.test(quhao)){
    //       this.quhaoState = 'success';
    //       return true;
    //     } else{
    //       this.quhaoState = 'error';
    //       this.$toast({
    //         message:"请输入合法手机区号",
    //         position:"top",
    //         duration:2000
    //       });
    //       return false;
    //     }
    // },
     //检测手机号
    checkPhonenumber(){
        let phonenumber = this.phonenumber;
        let phonenumberRegExp =/^1[3456789]\d{9}$/;
        if(phonenumberRegExp.test(phonenumber)){
          this.phonenumberState = 'success';
          return true;
        } else{
          this.phonenumberState = 'error';
          this.$toast({
            message:"请输入合法手机号",
            position:"top",
            duration:2000
          });
          return false;
        }
    },

    handle(){     
      //仍然进行用户名、密码及确认密码的校验
      // if(this.checkUsername() && this.checkPasswd() && this.checkConPasswd() && this.checkXinname() && this.checkQuhao() && this.checkPhonenumber()){
        if(this.checkUsername() && this.checkPasswd() && this.checkConPasswd() && this.checkXinname() && this.checkPhonenumber()){
          //如果所有信息都为合法的信息,则进行提交;
          //this.axios.get(....).then(res=>{....}) 如果只是为了校验用户名可以只用get，但如果是真正的注册一般用post
          this.axios.post('/user/register','username='+this.username+'&passwd='+this.passwd).then(res=>{  //在post中'username=aaa&passwd=bbb'这部分为提交数据
            if(res.data.code == 0){
              //注册失败
              this.$messagebox("注册提示","对不起,用户已存在");
            }else{
              //注册成功
              this.$router.push('/mycenter');
            }
          });
      }
     
    }
  }
}
</script>

<style>
  .vanf{margin-top:80px !important;padding-left: 10px;padding-right: 30px;}
  .van-field__label{width:4.5rem !important;margin-right: 0 !important;}

</style>