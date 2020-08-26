# scaffolding

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
##压缩版的静态文件
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

### mock.js数据模拟
### vue-awesome-swiper 是一个关于轮播图的插件，需要引入两个。官网：swiper.com.cn 使用的时候需要装两个：（1）npm i swiper -S  （2）npm i vue-awesome-swiper -S
### 1.图片要放到服务器下的public>自己新建的img文件夹下；2.放图片的文件夹必须托管；3.调图片的地址前面必须写明完整地址，例如http://localhost:3000/

### Src下：Assets 静态小图标，前端替换，后台无法替换，前端做主决定，放前端可变更的静态图片
### Comonents：公用组件Router：路由，前端路由，界面交互/调转，和后台路由不一样
### Store下：Utils自定义文件夹：设置配置文件，自己封装的函数放在这里面；放自定义的插件，函数
### View：视图层：给前端展示的页面，可以放component和这里都可以
### index.js对应前端组件，前端的页面
### app.vue打包之前的根文件
### main.js引入插件和路由所用
### utils自定义文件夹，自己封装的文件在这里
