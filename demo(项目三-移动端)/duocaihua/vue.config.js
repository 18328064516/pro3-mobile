//禁止其他组件内容异步延迟加载:
module.exports={
    chainWebpack:config=>{
      //删除编译后的独立js文件上的预获取操作
      config.plugins.delete("prefetch")
    }
}
