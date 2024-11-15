var app = getApp();
var loginInfo={};
Page({
  data: {
    canIUseGetUserProfile: false,
  },
  onLoad() {
    if (wx.getUserProfile) {
      this.setData({
        canIUseGetUserProfile: true
      })
    }
  },
  getUserProfile(e) {
    var that = this;
    var codes;
    wx.login({
      success: function (res) {
        console.log(res.code);
        // console.log(res.code);return false;
        if (res.code) {
          loginInfo.code = res.code;
          codes = res.code;
        }
      }
    })
    // 推荐使用wx.getUserProfile获取用户信息，开发者每次通过该接口获取用户个人信息均需用户确认
    // 开发者妥善保管用户快速填写的头像昵称，避免重复弹窗
    wx.getUserProfile({
      desc: '用于完善会员资料', // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
      success: (res) => {
        console.log('获取用户个人信息',res.userInfo)
        
        // 可以将 res 发送给后台解码出 unionId
        var infoUser = '';
        app.globalData.userInfo = infoUser = res.userInfo;
        // 所以此处加入 callback 以防止这种情况
        console.log(res.userInfo);
        if (that.userInfoReadyCallback) {
          that.userInfoReadyCallback(res)
        }
        //用户信息入库
        var url = app.setConfig.url + '/index.php/User/login/dologin';
        var data = {
          user_name: infoUser.nickName,
          nick_name: infoUser.nickName,
          head_img: infoUser.avatarUrl,
          sex: infoUser.gender,
          coutry: infoUser.country,
          city: infoUser.city,
          province: infoUser.province,
          code: codes,
        }
        if(that.postLogin(url, data)!=false){
          wx.switchTab({
            url: '../index/index',
          })
        };
      }
    })
  },

  //提交
  postLogin: function (url,data,callback=function(){}){
    var that = this;
    //发起网络请求
    wx.request({
      url: url,
      data: data, 
      method:'POST',
      header: { 'content-type': 'application/x-www-form-urlencoded' },
      success:function(res){
        if(res.data.code!=20000){
          wx.showToast({
            title: res.data.msg,
            icon: 'loading',
            mask: true,
            duration: 1500
          })
          if (res.data.code == 40500) { callback(res);}
          return false;
        }
        if (res.data.token){app.globalData.token = res.data.token;}
        //console.log(that.globalData)
        callback(res);
      }
    })
  }

})
