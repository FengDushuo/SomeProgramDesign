// pages/demolition/index.js
//获取应用实例
const app = getApp()

Page({
  data: {
    show: 0
  },
  onLoad: function (options) {
    var order_id = options.order_id || decodeURIComponent(options.scene)
    this.setData({
      order_id: options.order_id
    })
    this.getOrderInfo()
    this.changeData()
  },
  bindGetUserInfo: function (t) {
    "getUserInfo:ok" == t.detail.errMsg && (this.setData({
      hydl: !1
    }), this.changeData(), this.seeRed());
  },
  changeData: function () {
    var _this = this;
    wx.getSetting({
      success: function (t) {
        t.authSetting["scope.userInfo"] ? wx.getUserInfo({
          success: function (t) {
            var openid = wx.getStorageSync('openid') || ''
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
          }
        }) : (_this.setData({
          hydl: !0
        }));
      }
    });
  },
  /**
   *查看红包 
   */
  seeRed: function () {
    var _this = this
    var user_id = wx.getStorageSync('users').id;
    var red_user_id = _this.data.order.user_id;
    //如果拆包者和发包者为一人,或红包已经全部领取则跳转到红包详情
    if (user_id == red_user_id || _this.data.answer_success_num == _this.data.order.red_num) {
      wx.redirectTo({
        url: '../question_detail/index?order_id=' + _this.data.order_id,
      })
      return
    }
    app.util.request({
      url: "entry/wxapp/HbDemolition",
      data: {
        order_id: _this.data.order_id,
        user_id: user_id
      },
      success(res){
        if (res.data.isAnswer > 0) {
          //如果该用户已答过则跳转到题目详情
          wx.redirectTo({
            url: '../question_detail/index?order_id=' + _this.data.order_id,
          })
        } else {
          wx.redirectTo({
            url: '../question_open/index?order_id=' + _this.data.order_id,
          })
        }
      }
    })
  },
  /**
   * 题目信息
   */
  getOrderInfo: function (e) {
    wx.showLoading({
      title: 'loading...',
    })
    var _this = this
    var order_id = _this.data.order_id
    app.util.request({
      url: "entry/wxapp/HbGetRedInfo",
      data: {
        order_id: order_id
      },
      success(res){
        _this.setData({
          show: res.data.show,
          user: res.data.user,
          order: res.data.order,
          answer_success_num: res.data.answer_success_num
        })
        wx.hideLoading()
      }
    })
  }
})