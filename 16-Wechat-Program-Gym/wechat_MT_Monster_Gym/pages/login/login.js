//获取应用实例
const app = getApp()

Page({

  /**
   * 页面的初始数据
   */
  data: {
    login_image:""
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    // 查看是否授权
    //获取登录页面图片列表
    wx.request({
      url: 'http://127.0.0.1:8000/login_image',
      data: {
        key: 'wx_login'
      },
      success: function (res) {
        console.log(res);
        var login_img_url = res.data;
        that.setData({
          login_image: login_img_url
        });
      }
    });

    wx.getSetting({
      success: function (res) {
        if (res.authSetting['scope.userInfo']) {
          wx.getUserInfo({
            success: function (res) {
              //从数据库获取用户信息
              that.queryUserInfo();
              //用户已经授权过
              wx.switchTab({
                url: '../index/index'
              })
            }
          });
        }
      }
    })
  },

  queryUserInfo:function(e){
    var that = this;
      wx.getUserInfo({
          success: function (res) {
            var userNick = res.userInfo.nickName; //用户昵称 
            var avataUrl = res.userInfo.avatarUrl; //用户头像地址 
            var gender = res.userInfo.gender; //用户性别
            var city = res.userInfo.city;  //用户城市
            var province = res.userInfo.province;//用户省份
            console.log(res);
            wx.login({
              success: res => {
              // 获取到用户的 code 之后：res.code
                that.code = res.code 
                console.log(res);
                wx.request({
                  url: 'http://127.0.0.1:8000/wxlogin',
                  // method:"POST",
                  data: {
                    code:that.code,
                    nick: userNick,
                    avaurl: avataUrl,
                    sex: gender,
                    city: city,
                    province: province
                  }, //请求的参数"
                  // header: {
                  //   "Content-Type": "application/x-www-form-urlencoded"
                  // }, // 设置请求的 header
                  success: res => {
                    console.log(res.data);
                    wx.showToast({
                      title: '登录成功！',
                      icon: 'success',
                      duration: 2000
                    })
                    console.log("自动登录成功");
                  },
                  fail: () => {
                  },
                  complete: () => {}
              });
              }
              });                  
          }
    });
  },

  //登录
  doLogin: function(e){
    console.log(e.detail.errMsg)
    console.log(e.detail.userInfo)
    console.log(e.detail.rawData)

    wx.login({
      success: function(res) {
          var code = res.code; //发送给服务器的code 
          wx.getUserInfo({
              success: function(res) {
                  var userNick = res.userInfo.nickName; //用户昵称 
                  var avataUrl = res.userInfo.avatarUrl; //用户头像地址 
                  var gender = res.userInfo.gender; //用户性别
                  var city = res.userInfo.city;  //用户城市
                  var province = res.userInfo.province;//用户省份
                  if (code) {
                      wx.request({
                          url: 'http://127.0.0.1:8000/wxlogin',
                          //服务器的地址，现在微信小程序只支持https请求，所以调试的时候请勾选不校监安全域名
                          data: {
                              code: code,
                              nick: userNick,
                              avaurl: avataUrl,
                              sex: gender,
                              city: city,
                              province: province
                          },
                          success: function(res) {
                              console.log(res.data);
                              app.globalData.userInfo  = e.detail.userInfo;
                              wx.switchTab({
                                url: '../index/index'
                              })
                              // wx.setStorageSync('nick', res.data.nick); //将获取信息写入本地缓存 
                              // wx.setStorageSync('openid', res.data.openid);
                              // wx.setStorageSync('imgUrl', res.data.imgUrl);
                              // wx.setStorageSync('sex', res.data.sex);
                          }
                      })
                  } else {
                      console.log("获取用户登录态失败！");
                  }
              }
          })
      },
      fail: function(error) {
          console.log('login failed ' + error);
      }
  })

  }
 
})