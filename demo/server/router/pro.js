const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//console.log(pool);
//创建路由器对象
const router=express.Router();


//
//获取所有产品分类信息
router.get('/productslist',(req,res)=>{
    //SQL查询语句
    let sql = 'SELECT * FROM duocaihua_fenlei'; 
    //执行SQL查询语句
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        //响应到客户端的信息
        //res.send({message:'查询成功',code:1,results:results});
        res.send(result);
    });
});

//获取特定分类下的产品数据
router.get('/proimglist',(req,res)=>{ 
    //获取客户端URL地址栏的参数
    let cid=req.query.cid; //后面的cid指用户传的，前面的cid是随意定义的一个变量
    console.log(cid);//这里的输出是显示在服务器端的widows 
    let sql='select * from duocaihua_flsycp where sanid=?';
    pool.query(sql,[cid],(err,result)=>{
        if(err) throw err;
        res.send({message:'查询成功',code:1,proimglist:result}); 
    });
       
});


//获取特定分类下的产品数据
router.get('/proleibie',(req,res)=>{ 
    //获取客户端URL地址栏的参数
    let pid=req.query.pid; //后面的pid指用户传的，前面的pid是随意定义的一个变量
    console.log(pid);//这里的输出是显示在服务器端的widows 
    // let page=req.query.page;
    //分页实质上利用了select语句的limit子句，其标准计算公式为（页码-1）*每页 显示记录数
    //所以现在必须通过上述公式计算出offset参数值
    // let offset=(page-1)*6;
    //当前分类下的总页数=Math.ceil(总记录数/每页显示的记录数)。Math.ceil()表示向上取整。
    let sql='select * from duocaihua_prosplb where xid=?';
    pool.query(sql,[pid],(err,result)=>{
        if(err) throw err;
        //console.log(result[0].count);//查看当前分类下的总页数
        res.send({message:'查询成功',code:1,proleibie:result});
        // res.send(result);
        // let rowCount=result[0].count; //总记录数
        //声明每页显示6条记录
        // let pagesize=6;
        //声明变量用于存储计算出来的总页数
        // let pagecount=Math.ceil(rowCount/pagesize); 
        // console.log(pagecount);
        //以获取到的参数为条件在产品数据表中进行查找操作。下面的SQL语句中limit后面必须要有空格，否则首次都不会出现6条数据的
        //let sql='select lid,simg,sname,sprice from duocaihua_flsycp where sanid=? limit ' +offset +',6';
        //[cid]是给上面的sql语句中的问号？进行传值的
        //pool.query(sql,[cid],(err,results)=>{
            //if(err) throw err;
            //console.log(results);
            //res.send({message:'查询成功',code:1,proimglist:results,pagecount:pagecount});
       // }); 
    });
       
});

//获取特定分类下的产品数据
router.get('/productsall',(req,res)=>{ 
    //获取客户端URL地址栏的参数
    let kw=req.query.kw; //后面的pid指用户传的，前面的pid是随意定义的一个变量
    console.log(kw);//这里的输出是显示在服务器端的widows 
    // let page=req.query.page;
    //分页实质上利用了select语句的limit子句，其标准计算公式为（页码-1）*每页 显示记录数
    //所以现在必须通过上述公式计算出offset参数值
    // let offset=(page-1)*6;
    //当前分类下的总页数=Math.ceil(总记录数/每页显示的记录数)。Math.ceil()表示向上取整。
    let sql="select * from duocaihua_prosplb where sname like '%" +kw+"%'";
    pool.query(sql,[kw],(err,result)=>{
        if(err) throw err;
        //console.log(result[0].count);//查看当前分类下的总页数
        if(result.length>0){
            res.send({message:'查询成功',code:1,productsall:result});
        }else{
            res.send("0")
        }
        // res.send(result);
        // let rowCount=result[0].count; //总记录数
        //声明每页显示6条记录
        // let pagesize=6;
        //声明变量用于存储计算出来的总页数
        // let pagecount=Math.ceil(rowCount/pagesize); 
        // console.log(pagecount);
        //以获取到的参数为条件在产品数据表中进行查找操作。下面的SQL语句中limit后面必须要有空格，否则首次都不会出现6条数据的
        //let sql='select lid,simg,sname,sprice from duocaihua_flsycp where sanid=? limit ' +offset +',6';
        //[cid]是给上面的sql语句中的问号？进行传值的
        //pool.query(sql,[cid],(err,results)=>{
            //if(err) throw err;
            //console.log(results);
            //res.send({message:'查询成功',code:1,proimglist:results,pagecount:pagecount});
       // }); 
    });
       
});

//获取指定产品详细信息的接口
router.get('/view',(req,res)=>{
    //获取地址栏中的id参数
    let id=req.query.id;
    console.log(id);
    //以lid为条件进行产品相关信息的查找操作
    let sql = 'SELECT * FROM duocaihua_prosplb where lid=?';
    pool.query(sql,[id],(err,results)=>{
        if(err) throw err;
        console.log(results);
        //results[0]：在数组中只查询出了这一个对象，即位置为0,，就没必要返回一个数组，之间返回一个对象即可。
        res.send({message:'查询成功',code:1,results:results});
    }); 
});

//路由器对象导出
module.exports=router;


