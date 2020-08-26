const express=require('express');
//引入路由器
const userRouter=require('./router/user.js');
const proRouter=require('./router/pro.js');
const app=express();
//自定义服务器端口
app.listen(3303);
//跨域
const cors=require('cors');
//挂载corse
app.use(cors({
    origin:[`http://localhost:8080`,`http://127.0.0.1:8080`]
  })
)
//托管静态资源到public目录
app.use( express.static('public') );

//挂载路由器，并添加前缀/user
//  /user/reg
app.use('/user',userRouter);
app.use('/pro',proRouter);


 