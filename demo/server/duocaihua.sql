SET NAMES UTF8;
DROP DATABASE IF EXISTS duocaihua;
CREATE DATABASE duocaihua CHARSET=UTF8;
USE duocaihua;


/****轮播广告商品****/
CREATE TABLE duocaihua_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64)
);
/****轮播广告商品****/
INSERT INTO duocaihua_carousel VALUES
(NULL, 'http://localhost:3303/img/banner/b1.jpg','轮播广告商品1'),
(NULL, 'http://localhost:3303/img/banner/b2.jpg','轮播广告商品2'),
(NULL, 'http://localhost:3303/img/banner/b3.jpg','轮播广告商品3');


/****首页8大类****/
CREATE TABLE duocaihua_h_eight(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  leibie VARCHAR(64)
);
/****首页8大类****/
INSERT INTO duocaihua_h_eight VALUES
(NULL, 'http://localhost:3303/img/home/z1.jpg','恋情鲜花'),
(NULL, 'http://localhost:3303/img/home/z2.jpg','蛋糕'),
(NULL, 'http://localhost:3303/img/home/z3.jpg','开业花篮'),
(NULL, 'http://localhost:3303/img/home/z4.jpg','问候长辈'),
(NULL, 'http://localhost:3303/img/home/z5.jpg','永生花'),
(NULL, 'http://localhost:3303/img/home/z6.jpg','绿植'),
(NULL, 'http://localhost:3303/img/home/z7.jpg','巧克力'),
(NULL, 'http://localhost:3303/img/home/z8.jpg','礼盒鲜花');


/****首页送恋人下面的商品列表****/
CREATE TABLE duocaihua_hsplb(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  simg VARCHAR(128),
  sname VARCHAR(64),
  xiaolaing INT,
  price VARCHAR(64)
);
/****首页送恋人下面的商品列表****/
INSERT INTO duocaihua_hsplb VALUES
(NULL, 'http://localhost:3303/img/home/h1.jpg','纯美时光',10186,178),
(NULL, 'http://localhost:3303/img/home/h2.jpg','幸福主角',8596,158),
(NULL, 'http://localhost:3303/img/home/h3.jpg','简单甜美',8414,188),
(NULL, 'http://localhost:3303/img/home/h4.jpg','因为有你',5280,268),
(NULL, 'http://localhost:3303/img/home/h5.jpg','一生有你',8564,318),
(NULL, 'http://localhost:3303/img/home/h6.jpg','嫁给了爱情',9365,245),

(NULL, 'http://localhost:3303/img/home/h7.jpg','您辛苦了',6474,149),
(NULL, 'http://localhost:3303/img/home/h8.jpg','真诚祝福',5872,228),
(NULL, 'http://localhost:3303/img/home/h9.jpg','花开满溢',5870,208),
(NULL, 'http://localhost:3303/img/home/h10.jpg','幸福女主角',6589,259),
(NULL, 'http://localhost:3303/img/home/h11.jpg','芬芳',5870,318),
(NULL, 'http://localhost:3303/img/home/h12.jpg','最美祝福',5873,205),
(NULL, 'http://localhost:3303/img/home/h13.jpg','让爱相随',5870,318),
(NULL, 'http://localhost:3303/img/home/h14.jpg','温情回忆',6524,245),

(NULL, 'http://localhost:3303/img/home/h15.jpg','组合/生日快乐',5753,369),
(NULL, 'http://localhost:3303/img/home/h16.jpg','星语星愿',4590,369),
(NULL, 'http://localhost:3303/img/home/h17.jpg','淡蓝的祝福',55230,350),
(NULL, 'http://localhost:3303/img/home/h18.jpg','醇香',5869,455);

CREATE TABLE duocaihua_login(
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(30),     #用户名
  passwd VARCHAR(32)      #用户密码  
);
INSERT INTO duocaihua_login VALUES
(1,'Richard','abc123abc'),
(2,'Johnny','abc123abc'),
(3,'Martin','abc123abc'),
(4,'Christina','abc123abc'),
(5,'Margaret','abc123abc'),
(6,'Barbara','abc123abc'),
(7,'Diana','abc123abc'),
(8,'Melody','abc123abc'),
(9,'Debbie','abc123abc'),
(10,'Scott','abc123abc'),
(11,'Shelly','abc123abc'),
(12,'Bob','abc123abc'),
(13,'Amanda','abc123abc'),
(14,'George','abc123abc'),
(15,'Benjamin','abc123abc');


-- 大分类
CREATE TABLE duocaihua_fenlei(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  fam_id INT,               #类别编号
  sname VARCHAR(64)         #类别名称 
);
-- 大分类
INSERT INTO duocaihua_fenlei VALUES
(NULL, 1,'按价格选花'),
(NULL, 2,'按对象选花'),
(NULL, 3,'按用途选花'),
(NULL, 4,'按花材选花'),
(NULL, 5,'蛋糕'),
(NULL, 6,'按支数选花'),
(NULL, 7,'按节日选花');


-- 大分类下所有的商品列表
CREATE TABLE duocaihua_flsycp(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  sanid INT,                #大分类编号
  xsanid INT,               #小分类编号
  simg  VARCHAR(128),       #商品图片 
  sname VARCHAR(128)        #商品名称
);
-- 大分类下所有的商品列表--------小分类
INSERT INTO duocaihua_flsycp VALUES
(NULL,1,11,'http://localhost:3303/img/fenlei/jiage1/11.gif','150元以下'),
(NULL,1,12,'http://localhost:3303/img/fenlei/jiage1/11.gif','150-250元'),
(NULL,1,13,'http://localhost:3303/img/fenlei/jiage1/11.gif','250-350元'),
(NULL,1,14,'http://localhost:3303/img/fenlei/jiage1/12.gif','350-550元'),
(NULL,1,15,'http://localhost:3303/img/fenlei/jiage1/12.gif','550-800元'),
(NULL,1,16,'http://localhost:3303/img/fenlei/jiage1/12.gif','800元以上'),

(NULL,2,17,'http://localhost:3303/img/fenlei/jiage1/11.gif','送恋人'),
(NULL,2,18,'http://localhost:3303/img/fenlei/jiage1/11.gif','送父母'),
(NULL,2,19,'http://localhost:3303/img/fenlei/jiage1/11.gif','送恩师'),
(NULL,2,20,'http://localhost:3303/img/fenlei/jiage1/11.gif','送闺蜜'),
(NULL,2,21,'http://localhost:3303/img/fenlei/jiage1/11.gif','送同事'),
(NULL,2,22,'http://localhost:3303/img/fenlei/jiage1/11.gif','送领导'),

(NULL,3,23,'http://localhost:3303/img/fenlei/jiage1/11.gif','爱情鲜花'),
(NULL,3,24,'http://localhost:3303/img/fenlei/jiage1/11.gif','友情鲜花'),
(NULL,3,25,'http://localhost:3303/img/fenlei/jiage1/11.gif','生日鲜花'),
(NULL,3,26,'http://localhost:3303/img/fenlei/jiage1/11.gif','感谢恩师'),
(NULL,3,27,'http://localhost:3303/img/fenlei/jiage1/11.gif','探病鲜花'),
(NULL,3,28,'http://localhost:3303/img/fenlei/jiage1/11.gif','祝福鲜花'),

(NULL,4,29,'http://localhost:3303/img/fenlei/jiage1/11.gif','红玫瑰'),
(NULL,4,30,'http://localhost:3303/img/fenlei/jiage1/11.gif','粉玫瑰'),
(NULL,4,31,'http://localhost:3303/img/fenlei/jiage1/11.gif','白玫瑰'),
(NULL,4,32,'http://localhost:3303/img/fenlei/jiage1/11.gif','香槟玫瑰'),
(NULL,4,33,'http://localhost:3303/img/fenlei/jiage1/11.gif','蓝妖姬'),
(NULL,4,34,'http://localhost:3303/img/fenlei/jiage1/11.gif','康乃馨'),

(NULL,5,35,'http://localhost:3303/img/fenlei/jiage1/11.gif','水果蛋糕'),
(NULL,5,36,'http://localhost:3303/img/fenlei/jiage1/11.gif','巧克力味'),
(NULL,5,37,'http://localhost:3303/img/fenlei/jiage1/11.gif','芝士'),
(NULL,5,38,'http://localhost:3303/img/fenlei/jiage1/11.gif','抹茶'),
(NULL,5,39,'http://localhost:3303/img/fenlei/jiage1/11.gif','慕斯'),
(NULL,5,40,'http://localhost:3303/img/fenlei/jiage1/11.gif','鲜奶'),

(NULL,6,41,'http://localhost:3303/img/fenlei/jiage1/11.gif','11支'),
(NULL,6,42,'http://localhost:3303/img/fenlei/jiage1/11.gif','19支'),
(NULL,6,43,'http://localhost:3303/img/fenlei/jiage1/11.gif','21支'),
(NULL,6,44,'http://localhost:3303/img/fenlei/jiage1/11.gif','29支'),
(NULL,6,45,'http://localhost:3303/img/fenlei/jiage1/11.gif','33支'),
(NULL,6,46,'http://localhost:3303/img/fenlei/jiage1/11.gif','52支'),

(NULL,7,47,'http://localhost:3303/img/fenlei/jiage1/11.gif','情人节'),
(NULL,7,48,'http://localhost:3303/img/fenlei/jiage1/11.gif','七夕情人节'),
(NULL,7,49,'http://localhost:3303/img/fenlei/jiage1/11.gif','母亲节'),
(NULL,7,50,'http://localhost:3303/img/fenlei/jiage1/11.gif','父亲节'),
(NULL,7,51,'http://localhost:3303/img/fenlei/jiage1/11.gif','圣诞节'),
(NULL,7,52,'http://localhost:3303/img/fenlei/jiage1/11.gif','520');


-- 小分类下的商品列表
CREATE TABLE duocaihua_prosplb(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  xid INT,                    #小分类对应的编号
  simg VARCHAR(128),          #商品图片
  bimg VARCHAR(128),          #商品图片 
  sname VARCHAR(64),          #商品名称
  xiaolaing INT,              #商品销量
  price VARCHAR(64),          #商品价格
  cailiao VARCHAR(64),        #产品参数-材料
  baozhaung VARCHAR(64),      #产品参数-包装
  pinglunwzone VARCHAR(128),  #产品评论内容1
  pinglunwztwo VARCHAR(128)      #产品评论内容2
);
-- 小分类下的商品列表
INSERT INTO duocaihua_prosplb VALUES
(NULL,11,'http://localhost:3303/img/xiaofenlei/11/1111.jpg','http://localhost:3303/img/xiaofenlei/11/big/b1111.jpg','温馨言语',12361,225,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,11,'http://localhost:3303/img/xiaofenlei/11/1121.jpg','http://localhost:3303/img/xiaofenlei/11/big/b1121.jpg','粉色温馨',9126,258,'优质红玫瑰11支，勿忘我点缀','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,11,'http://localhost:3303/img/xiaofenlei/11/191.jpg','http://localhost:3303/img/xiaofenlei/11/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,11,'http://localhost:3303/img/xiaofenlei/11/114.jpg','http://localhost:3303/img/xiaofenlei/11/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,11,'http://localhost:3303/img/xiaofenlei/11/115.png','http://localhost:3303/img/xiaofenlei/11/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,11,'http://localhost:3303/img/xiaofenlei/11/116.jpg','http://localhost:3303/img/xiaofenlei/11/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,11,'http://localhost:3303/img/xiaofenlei/11/117.jpg','http://localhost:3303/img/xiaofenlei/11/big/b117.jpg','健康美丽',8057,308,'16支粉色康乃馨，6朵白色百合，配草点缀！','粉色平面纸外包装，丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,11,'http://localhost:3303/img/xiaofenlei/11/118.jpg','http://localhost:3303/img/xiaofenlei/11/big/b118.jpg','健康常在',8759,278,'优选10支粉色康乃馨，6支粉玫瑰！','精美牛皮纸包装，丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,11,'http://localhost:3303/img/xiaofenlei/11/119.jpg','http://localhost:3303/img/xiaofenlei/11/big/b119.jpg','知心爱人',6967,239,'11支精品红玫瑰，尤加利点缀。','精美暗红色米白色搭配，丝带束扎。','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,11,'http://localhost:3303/img/xiaofenlei/11/120.png','http://localhost:3303/img/xiaofenlei/11/big/b120.png','小幸运',14328,179,'6支粉色康乃馨，红豆满天星绿叶搭配','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,12, 'http://localhost:3303/img/xiaofenlei/12/121.jpg','http://localhost:3303/img/xiaofenlei/12/big/b121.jpg','永恒的心',16288,159,'向日葵1支，百合1支，粉玫瑰1支','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,12, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,12, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,12, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,12, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,12, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,12, 'http://localhost:3303/img/xiaofenlei/12/117.jpg','http://localhost:3303/img/xiaofenlei/12/big/b117.jpg','健康美丽',8057,308,'16支粉色康乃馨，6朵白色百合，配草点缀！','粉色平面纸外包装，丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,12, 'http://localhost:3303/img/xiaofenlei/12/1811.jpg','http://localhost:3303/img/xiaofenlei/12/big/b1811.jpg','少女星/粉',9037,289,'6支戴安娜玫瑰，粉色满天星足量搭配','粉色包装纸精美包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,13,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,13, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,13, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,13, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,13, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,13, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,13, 'http://localhost:3303/img/xiaofenlei/12/117.jpg','http://localhost:3303/img/xiaofenlei/12/big/b117.jpg','健康美丽',8057,308,'16支粉色康乃馨，6朵白色百合，配草点缀！','粉色平面纸外包装，丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,13, 'http://localhost:3303/img/xiaofenlei/12/1811.jpg','http://localhost:3303/img/xiaofenlei/12/big/b1811.jpg','少女星/粉',9037,289,'6支戴安娜玫瑰，粉色满天星足量搭配','粉色包装纸精美包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,14,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,14, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,14, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,14, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,14, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,14, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,14, 'http://localhost:3303/img/xiaofenlei/12/117.jpg','http://localhost:3303/img/xiaofenlei/12/big/b117.jpg','健康美丽',8057,308,'16支粉色康乃馨，6朵白色百合，配草点缀！','粉色平面纸外包装，丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,14, 'http://localhost:3303/img/xiaofenlei/12/1811.jpg','http://localhost:3303/img/xiaofenlei/12/big/b1811.jpg','少女星/粉',9037,289,'6支戴安娜玫瑰，粉色满天星足量搭配','粉色包装纸精美包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,15,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,15, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,15, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,15, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,15, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,15, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,15, 'http://localhost:3303/img/xiaofenlei/12/117.jpg','http://localhost:3303/img/xiaofenlei/12/big/b117.jpg','健康美丽',8057,308,'16支粉色康乃馨，6朵白色百合，配草点缀！','粉色平面纸外包装，丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,15, 'http://localhost:3303/img/xiaofenlei/12/1811.jpg','http://localhost:3303/img/xiaofenlei/12/big/b1811.jpg','少女星/粉',9037,289,'6支戴安娜玫瑰，粉色满天星足量搭配','粉色包装纸精美包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,16,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,16, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,16, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,16, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,16, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,16, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,16, 'http://localhost:3303/img/xiaofenlei/12/117.jpg','http://localhost:3303/img/xiaofenlei/12/big/b117.jpg','健康美丽',8057,308,'16支粉色康乃馨，6朵白色百合，配草点缀！','粉色平面纸外包装，丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,16, 'http://localhost:3303/img/xiaofenlei/12/1811.jpg','http://localhost:3303/img/xiaofenlei/12/big/b1811.jpg','少女星/粉',9037,289,'6支戴安娜玫瑰，粉色满天星足量搭配','粉色包装纸精美包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,17,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,17, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,17, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,17, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,17, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,17, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,17, 'http://localhost:3303/img/xiaofenlei/12/117.jpg','http://localhost:3303/img/xiaofenlei/12/big/b117.jpg','健康美丽',8057,308,'16支粉色康乃馨，6朵白色百合，配草点缀！','粉色平面纸外包装，丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,17, 'http://localhost:3303/img/xiaofenlei/12/1811.jpg','http://localhost:3303/img/xiaofenlei/12/big/b1811.jpg','少女星/粉',9037,289,'6支戴安娜玫瑰，粉色满天星足量搭配','粉色包装纸精美包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,18,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,18, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,18, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,18, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,18, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,18, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,18, 'http://localhost:3303/img/xiaofenlei/12/117.jpg','http://localhost:3303/img/xiaofenlei/12/big/b117.jpg','健康美丽',8057,308,'16支粉色康乃馨，6朵白色百合，配草点缀！','粉色平面纸外包装，丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,18, 'http://localhost:3303/img/xiaofenlei/12/1811.jpg','http://localhost:3303/img/xiaofenlei/12/big/b1811.jpg','少女星/粉',9037,289,'6支戴安娜玫瑰，粉色满天星足量搭配','粉色包装纸精美包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,19,'http://localhost:3303/img/xiaofenlei/19/191.jpg','http://localhost:3303/img/xiaofenlei/11/big/b111.jpg','因为有你',5280,268,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,19, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,19, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,19, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,19, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,19, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,19, 'http://localhost:3303/img/xiaofenlei/12/117.jpg','http://localhost:3303/img/xiaofenlei/12/big/b117.jpg','健康美丽',8057,308,'16支粉色康乃馨，6朵白色百合，配草点缀！','粉色平面纸外包装，丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,19, 'http://localhost:3303/img/xiaofenlei/12/1811.jpg','http://localhost:3303/img/xiaofenlei/12/big/b1811.jpg','少女星/粉',9037,289,'6支戴安娜玫瑰，粉色满天星足量搭配','粉色包装纸精美包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,20,'http://localhost:3303/img/xiaofenlei/20/201.jpg','http://localhost:3303/img/xiaofenlei/11/big/b111.jpg','一生有你',8564,318,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,20, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,20, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,20, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,20, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,20, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,20, 'http://localhost:3303/img/xiaofenlei/12/117.jpg','http://localhost:3303/img/xiaofenlei/12/big/b117.jpg','健康美丽',8057,308,'16支粉色康乃馨，6朵白色百合，配草点缀！','粉色平面纸外包装，丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,20, 'http://localhost:3303/img/xiaofenlei/12/1811.jpg','http://localhost:3303/img/xiaofenlei/12/big/b1811.jpg','少女星/粉',9037,289,'6支戴安娜玫瑰，粉色满天星足量搭配','粉色包装纸精美包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,21,'http://localhost:3303/img/xiaofenlei/21/211.jpg','http://localhost:3303/img/xiaofenlei/11/big/b111.jpg','嫁给了爱情',9365,245,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,21, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,21, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,21, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,21, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,21, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,22,'http://localhost:3303/img/xiaofenlei/22/221.jpg','http://localhost:3303/img/xiaofenlei/11/big/b111.jpg','纯美时光',10186,178,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,22, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,22, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,22, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,22, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,22, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,23,'http://localhost:3303/img/xiaofenlei/23/231.jpg','http://localhost:3303/img/xiaofenlei/11/big/b111.jpg','幸福主角',8596,158,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,23, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,23, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,23, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,23, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,23, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,24,'http://localhost:3303/img/xiaofenlei/24/241.jpg','http://localhost:3303/img/xiaofenlei/11/big/b111.jpg','简单甜美',8414,188,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,24, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,24, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,24, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,24, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,24, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,25,'http://localhost:3303/img/xiaofenlei/25/251.jpg','http://localhost:3303/img/xiaofenlei/11/big/b111.jpg','因为有你',5280,268,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,25, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,25, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,25, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,25, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,25, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,26,'http://localhost:3303/img/xiaofenlei/26/261.jpg','http://localhost:3303/img/xiaofenlei/11/big/b111.jpg','一生有你',8564,318,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,26, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,26, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,26, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,26, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,26, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,27,'http://localhost:3303/img/xiaofenlei/27/271.jpg','http://localhost:3303/img/xiaofenlei/11/big/b111.jpg','嫁给了爱情',9365,245,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,27, 'http://localhost:3303/img/xiaofenlei/12/122.jpg','http://localhost:3303/img/xiaofenlei/12/big/b122.jpg','爱的絮语',4545,228,'11支香槟玫瑰 栀子叶 黄英','白色瓦楞纸圆形高档包装','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),
(NULL,27, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,27, 'http://localhost:3303/img/xiaofenlei/12/114.jpg','http://localhost:3303/img/xiaofenlei/12/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),
(NULL,27, 'http://localhost:3303/img/xiaofenlei/12/115.png','http://localhost:3303/img/xiaofenlei/12/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),
(NULL,27, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,28, 'http://localhost:3303/img/xiaofenlei/12/191.jpg','http://localhost:3303/img/xiaofenlei/12/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,29, 'http://localhost:3303/img/xiaofenlei/12/116.jpg','http://localhost:3303/img/xiaofenlei/12/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,30, 'http://localhost:3303/img/xiaofenlei/12/1811.jpg','http://localhost:3303/img/xiaofenlei/12/big/b1811.jpg','少女星/粉',9037,289,'6支戴安娜玫瑰，粉色满天星足量搭配','粉色包装纸精美包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,31,'http://localhost:3303/img/xiaofenlei/11/1121.jpg','http://localhost:3303/img/xiaofenlei/11/big/b1121.jpg','粉色温馨',9126,258,'优质红玫瑰11支，勿忘我点缀','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,32,'http://localhost:3303/img/xiaofenlei/11/191.jpg','http://localhost:3303/img/xiaofenlei/11/big/b113.jpg','浪漫致真',5966,366,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),

(NULL,33,'http://localhost:3303/img/xiaofenlei/11/114.jpg','http://localhost:3303/img/xiaofenlei/11/big/b114.jpg','您辛苦了',6474,239,'11支红色康乃馨，配草点缀','淡雅平面纸精美包装 如图 丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,34,'http://localhost:3303/img/xiaofenlei/11/115.png','http://localhost:3303/img/xiaofenlei/11/big/b115.png','一生有你',13870,179,'小束粉色满天星','同款白色包装，粉色丝带','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,35,'http://localhost:3303/img/xiaofenlei/11/116.jpg','http://localhost:3303/img/xiaofenlei/11/big/b116.jpg','嫁给了爱情',17896,169,'3支香槟玫瑰，1支向日葵','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/3.jpg,旅***F,2018-05-21,店家服务非常好，信赖。','http://localhost:3303/img/xiaofenlei/11/pinglun/6.jpg,陈***喳,2018-05-20,很好，看准备用来布置小惊喜。'),

(NULL,36,'http://localhost:3303/img/xiaofenlei/11/117.jpg','http://localhost:3303/img/xiaofenlei/11/big/b117.jpg','健康美丽',8057,308,'16支粉色康乃馨，6朵白色百合，配草点缀！','粉色平面纸外包装，丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,37,'http://localhost:3303/img/xiaofenlei/11/118.jpg','http://localhost:3303/img/xiaofenlei/11/big/b118.jpg','健康常在',8759,278,'优选10支粉色康乃馨，6支粉玫瑰！','精美牛皮纸包装，丝带束扎！','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,38,'http://localhost:3303/img/xiaofenlei/11/119.jpg','http://localhost:3303/img/xiaofenlei/11/big/b119.jpg','知心爱人',6967,239,'11支精品红玫瑰，尤加利点缀。','精美暗红色米白色搭配，丝带束扎。','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,39,'http://localhost:3303/img/xiaofenlei/11/120.png','http://localhost:3303/img/xiaofenlei/11/big/b120.png','小幸运',14328,179,'6支粉色康乃馨，红豆满天星绿叶搭配','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,40, 'http://localhost:3303/img/xiaofenlei/12/121.jpg','http://localhost:3303/img/xiaofenlei/12/big/b121.jpg','永恒的心',16288,159,'向日葵1支，百合1支，粉玫瑰1支','同款包装，丝带束扎','http://localhost:3303/img/xiaofenlei/11/pinglun/5.jpg,人***客,2018-05-21,花很好看','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好'),

(NULL,41,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,42,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,43,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,44,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,45,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,46,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,47,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,48,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,49,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,50,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,51,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物'),

(NULL,52,'http://localhost:3303/img/xiaofenlei/13/1111.jpg','http://localhost:3303/img/xiaofenlei/13/big/b1111.jpg','初相见',9032,288,'优质红玫瑰11支，满天星搭配','深灰色包装，红色丝搭配','http://localhost:3303/img/xiaofenlei/11/pinglun/2.jpg,果***果,2018-07-25,鲜花特别的好','http://localhost:3303/img/xiaofenlei/11/pinglun/4.jpg,贵***郎,2018-06-21,包装仔细、严实， 物流公司服务 态度很好，运送速度很快，很满意的 一次购物');


