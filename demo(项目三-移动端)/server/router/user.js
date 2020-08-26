//引入express模块（框架）
const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//console.log(pool);
//创建路由器对象
const router=express.Router();
//引入body-parser模块
const bodyParser = require('body-parser');

//将bodyParser作为server中间件使用
router.use(bodyParser.urlencoded({
  extended:false
}));


//查找所有的用户
router.get('/bannerList',(req,res)=>{   
    //4.5执行SQL语句-->查询lantern_qxcp_product表的所有数据
    pool.query('SELECT * FROM duocaihua_carousel',(err,result)=>{
      if(err) throw err;
      //console.log(result);
      //把查询的数据直接响应给浏览器
      res.send(result);
    });
  });
 
router.get('/leibielist',(req,res)=>{
  pool.query('SELECT * FROM duocaihua_h_eight',(err,result)=>{
    if(err) throw err;
    res.send(result);
  });
});

router.get('/spleibie',(req,res)=>{
  pool.query('SELECT * FROM duocaihua_hsplb',(err,result)=>{
    if(err) throw err;
    res.send(result);
  });
});

//用户注册的接口
router.post('/register',(req,res)=>{
  //获取用户提交的用户名信息
  let username=req.body.username;
  //console.log(username);
  //以用户名为条件查找操作，如果用户存在，则产生合法的错误信息
  //如果用户不存在，则将用户相关信息写入数据表--lantern_login
  let sql='select count(id) as count from duocaihua_login where username=?';
  pool.query(sql,[username],(err,results)=>{
      if(err) throw err;
      //此时代表用户已存在
      if(results[0].count){
          //注册失败
          res.send({message:'注册失败',code:0});
      }else{
          //注册成功
          //获取im信息
          let passwd=req.body.passwd;
          //完成数据写入操作  MD5(?)是一个函数。
          let sql='insert into duocaihua_login(username,passwd) values(?,?)';
          pool.query(sql,[username,passwd],(err,results)=>{
              if(err) throw err;
              res.send({message:'注册成功',code:1});
              console.log(username,passwd);
          });
      }
  });
});

//用户登录的接口
router.post('/login',(req,res)=>{
  //获取用户名和密码
  let username=req.body.username;
  let passwd=req.body.passwd;
  //以用户名和密码为条件查找操作，如果用户存在，则登录成功；否则代表登录失败
  let sql='select * from duocaihua_login where username=? and passwd=?';
  pool.query(sql,[username,passwd],(err,results)=>{
      if(err) throw err;
      console.log(results);
      if(results.length == 1){
          //登录成功
          res.send({message:'登录成功',code:1,results:results[0]});
      }else{
          //登录失败
          res.send({message:'登录失败',code:0});
      }
      
  });

});

//路由器对象导出
module.exports=router;