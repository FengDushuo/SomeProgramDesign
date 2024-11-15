var app = getApp()
Page({

  data: {
    currentIndex: 0,
    indicatorDots: true,
    vertical: true,
    autoplay: true,
    interval: 2000,
    duration: 500,
    swiperH: '',   //swiper高度
    nowIdx: 0,     //当前swiper索引
    // banner: [],
    banner: [{"picUrl":'../../resource/image/index/index_swiper/1.jpg',"type":"banner"},{"picUrl":'../../resource/image/index/index_swiper/2.jpg',"type":"banner"},{"picUrl":'../../resource/image/index/index_swiper/3.jpg',"type":"banner"}],   //图片列表
    envpic: [{"picUrl":'../../resource/image/index/index_swiper/banner1.jpg',"type":"env"}],
    // envpic:[],
    categories: [],
    coachcategoryid: 0,
    articlecategoryid: 0,
    coaches: [{"id":1,'pic':'../../resource/image/index/index_swiper/coach.jpg',"title":"wang"}],
    articles: [],
    bg_img: '',
    
  },

  getHeight: function (e) {
    var winWid = wx.getSystemInfoSync().windowWidth - 2 * 10;//获取当前屏幕的宽度
    var imgh = e.detail.height;//图片高度
    var imgw = e.detail.width;
    var sH = winWid * imgh / imgw + "px"
    this.setData({
      swiperH: sH//设置高度
    })
  },
  //swiper滑动事件
  swiperChange: function (e) {
    this.setData({
      nowIdx: e.detail.current
    })
  },
  
  //展示地图
  showmap: function () {
    this.openLocationFun(31.2857400000, 120.7245410000, 15, "MT怪兽健身", "");
  },

  /**  
 * openLocationFun   使用微信内置地图查看位置
 * 1、latitude：     纬度，范围为-90~90，负数表示南纬 必填  
 * 2、longitude：    经度，范围为-180~180，负数表示西经 必填  
 * 3、scale：        缩放比例，范围1~28，默认为28 选填  
 * 4、name：         位置名 选填  
 * 5、address：      地址的详细说明 选填  
 * 6、cbSuccessFun： 接口调用成功的回调函数 选填  
 * 7、cbFailFun：    接口调用失败的回调函数 选填  
 * 8、cbCompleteFun：接口调用结束的回调函数（调用成功、失败都会执行） 选填  
 */
  openLocationFun: function (latitude, longitude, scale, name, address, cbSuccessFun, cbFailFun, cbCompleteFun) {
    var openObj = {};
    openObj.latitude = latitude;
    openObj.longitude = longitude;
    openObj.scale = 15;
    if (scale > 0 && scale < 29) {
      openObj.scale = scale;
    }
    if (name) {
      openObj.name = name;
    }
    if (address) {
      openObj.address = address;
    }
    openObj.success = function (res) {
      if (cbSuccessFun) {
        cbSuccessFun();
      }
    }
    openObj.fail = function (res) {
      if (cbFailFun) {
        cbFailFun();
      } else {
        console.log("openLocation fail:" + res.errMsg);
      }
    }
    openObj.complete = function (res) {
      if (cbCompleteFun) {
        cbCompleteFun();
      }
    }
    wx.openLocation(openObj);
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    console.log('onLoad');
    var that = this;

    //获取背景图片列表
    // wx.request({
    //   url: 'http://127.0.0.1:8000/index_bg',
    //   data: {
    //     key: 'wx_index'
    //   },
    //   success: function (res) {
    //     console.log(res);
    //     var bg_img_url = res.data;
    //     that.setData({
    //       bg_img: bg_img_url
    //     });
    //   }
    // });


    //获取环境图片列表
    // wx.request({
    //   url: 'http://127.0.0.1:8000/index_env' ,
    //   data: {
    //     key: 'wx_index'
    //   },
    //   success: function (res) {
    //     console.log(res);
    //     var envpics = [];
    //     for (var i = 0; i < res.data.data.length; i++) {
    //       if (res.data.data[i].type == "env") {
    //         console.log(res.data.data[i]);
    //         envpics.push(res.data.data[i]);
    //       }
    //     }
    //     that.setData({
    //       envpic: envpics
    //     });
    //   }
    // });

    //获取顶部轮播图片列表
    // wx.request({
    //   url: 'http://127.0.0.1:8000/index_banner',
    //   data: {
    //     key: 'wx_index'
    //   },
    //   success: function (res) {
    //     console.log(res);
    //     var banners = [];
    //     for (var i = 0; i < res.data.data.length; i++) {
    //       if (res.data.data[i].type == "banner") {
    //         console.log(res.data.data[i]);
    //         banners.push(res.data.data[i]);
    //       }
    //     }
    //     that.setData({
    //       banner: banners
    //     });
    //   }
    // });

    //获取教练信息
  //   wx.request({
  //     url: 'http://127.0.0.1:8000/index_coaches',
  //     success: function (res) {
  //       var coach = [];
  //       for (var i = 0; i < res.data.data.length; i++) {
  //         if (res.data.data[i].type == "coach") {
  //           coach.push(res.data.data[i]); 
  //         } 
  //       }
  //       that.setData({
  //         coaches:coach
  //       });
  //     }
  //   });
  },

  showvideo: function () {
    wx.navigateTo({
      url: '/pages/video/video',
    })
    wx.getNetworkType({
      success: function (res) {
    var networkType = res.networkType; // 返回网络类型2g，3g，4g，wifi
    if (networkType != "wifi"){
      wx.showModal({
        title: '提示',
        content: '当前不是wifi环境，确认要播放视频吗？',
        success: function (res) {
          if (res.confirm) {
            console.log('用户点击确定')
          }
        }
      })
    }
    console.log(networkType);
      }
    });
  },

  //导航到全部教练
  toAllCoachesTap: function () {
    wx.navigateTo({
      url: "/pages/coaches/coaches"
    })
  },



  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
    return {
      title: "MT怪兽健身"
    }
  },


})