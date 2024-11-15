//logs.js
const app = getApp()

Page({
  data: {
    money: 0.00,
    show: 0
  },
  onShow: function () {
    var users = wx.getStorageSync('users')
    if (users.name && users.img) {
      this.setData({
        name: users.name,
        img: users.img
      })
    }
    this.getUserInfo()
  },
  onLoad: function () {
    this.changeData()
  },
  /**
   * 钱包
   */
  cash: function () {
    wx.navigateTo({
      url: '../question_cash/index',
    })
  },
  /**
   * 我的记录
   */
  record: function () {
    wx.navigateTo({
      url: '../question_record/index',
    })
  },
  /**
   * 常见问题
   */
  problem: function () {
    wx.navigateTo({
      url: '../question_problem/index',
    })
  },
  bindGetUserInfo: function (t) {
    "getUserInfo:ok" == t.detail.errMsg && (this.setData({
      hydl: !1
    }), this.changeData());
  },
  /**
   * 授权
   */
  changeData: function () {
    var _this = this;
    wx.getSetting({
      success: function (t) {
        t.authSetting["scope.userInfo"] ? wx.getUserInfo({
          success: function (t) {
            var openid = wx.getStorageSync('openid')
            if (openid != '' && openid != undefined && openid != 'undefined') {
              app.util.request({
                url: "entry/wxapp/login",
                cachetime: "0",
                data: {
                  openid: openid,
                  img: t.userInfo.avatarUrl,
                  name: t.userInfo.nickName,
                  gender: t.userInfo.gender
                },
                header: {
                  "content-type": "application/json"
                },
                dataType: "json",
                success: function (t) {
                  wx.setStorageSync("users", t.data)
                }
              });
            }
            _this.setData({
              img: t.userInfo.avatarUrl,
              name: t.userInfo.nickName
            });
          }
        }) : (_this.setData({
          hydl: !0
        }));
      }
    });
  },
  /**
   * 账户余额
   */
  getUserInfo: function () {
    var user_id = wx.getStorageSync("users").id;
    var _this = this
    app.util.request({
      url: "entry/wxapp/UserInfo",
      data: {
        user_id: user_id,
      },
      success: function (res) {
        _this.setData({
          money: res.data.wallet,
          show: res.data.show
        })
      }
    })
  }
})
