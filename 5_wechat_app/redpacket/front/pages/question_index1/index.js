//index.js
const app = getApp()

Page({
  data: {
    num: 5,
    notice: ''
  },
  onShow: function () {
    // var users = wx.getStorageSync('users')
    var users = app.globalData.userInfo
    if (users.nickName && users.avatarUrl) {
      this.setData({
        name: users.nickName,
        img: users.avatarUrl
      })
    }
  },
  onLoad: function () {
    // this.getNotice()
    // this.changeData()
  },
  /**
   * 选择答题数量
   */
  sliderChange: function (e) {
    this.setData({
      num: e.detail.value
    })
  },
  bindGetUserInfo: function (t) {
    "getUserInfo:ok" == t.detail.errMsg && (this.setData({
      hydl: !1
    })
    // , this.changeData()
    );
  },
  // changeData: function () {
  //   var _this = this;
  //   wx.getSetting({
  //     success: function (t) {
  //       t.authSetting["scope.userInfo"] ? wx.getUserInfo({
  //         success: function (t) {
  //           var openid = wx.getStorageSync('openid') || ''
  //           if (openid != '' && openid != undefined && openid != 'undefined') {
  //             app.util.request({
  //               url: "entry/wxapp/login",
  //               cachetime: "0",
  //               data: {
  //                 openid: openid,
  //                 img: t.userInfo.avatarUrl,
  //                 name: t.userInfo.nickName,
  //                 gender: t.userInfo.gender
  //               },
  //               header: {
  //                 "content-type": "application/json"
  //               },
  //               dataType: "json",
  //               success: function (t) {
  //                 wx.setStorageSync("users", t.data)
  //               }
  //             });
  //           }
  //           _this.setData({
  //             img: t.userInfo.avatarUrl,
  //             name: t.userInfo.nickName
  //           });            
  //         }
  //       }) : (_this.setData({
  //         hydl: !0
  //       }));
  //     }
  //   });
  // },
  /**
   * 系统通知
   */
  // getNotice: function (){
  //   var _this = this
  //   app.util.request({
  //     url: "entry/wxapp/notice",
  //     success: function (res) {
  //       _this.setData({
  //         notice: res.data
  //       })
  //     }
  //   })
  // },
  /**
   * 出题
   */
  lssue: function () {
    wx.removeStorageSync('mySubject')   //清空已选题目缓存
    wx.navigateTo({
      url: '../question_lssue/index?num='+this.data.num,
    })
  },
  /**
 * 用户点击右上角分享
 */
  onShareAppMessage: function () {

  }
})
