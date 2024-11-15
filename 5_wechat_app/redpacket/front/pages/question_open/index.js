// pages/already/index.js
const app = getApp()

Page({
  /**
   * 页面的初始数据
   */
  data: {
    selectedIdx: -1,
    over: 0,
    show: 0,
    zf: 0
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var users = wx.getStorageSync('users');
    this.setData({
      users:users,
      user_id: users.id,
      order_id: options.order_id
    })
    this.getAnswer()
  },
  /**
   * 选择答案
   */
  selected: function (e) {
    var idx = e.currentTarget.dataset.index
    var id = e.currentTarget.dataset.id
    var subject = this.data.subject
    for (var i = 0; i < subject.length; i++) {
      if (subject[i].subject.id == id) {
        subject[i].idx = idx
      }
    }
    this.setData({
      subject: subject
    })
  },
  /**
   * 保存修改
   */
  confirm: function () {
    var subject = this.data.subject
    for (var i = 0, j = 1; i < subject.length; i++ , j++) {
      if (subject[i].idx == -1) {
        wx.showToast({
          title: '请选择第' + j + '题答案',
          icon: 'none',
          mask: true
        })
        return
      }
    }
    this.setData({
      zf: 1
    })
    /*
    wx.showLoading({
      title: 'loading...',
      mask: true
    })
    app.util.request({
      url: 'entry/wxapp/HbVerifyAnswer',
      data: {
        order_id: order_id,
        user_id: user_id,
        subject: JSON.stringify(subject)
      },
      success(res){
        var answer = res.data
        console.log(answer)
        _this.setData({
          answer: answer,
          over: 1
        })
        wx.hideLoading()
      }
    })
    */
  },
  /**
   * 获取问题
   */
  getAnswer: function () {
    var _this = this
    var order_id = _this.data.order_id
    app.util.request({
      url: 'entry/wxapp/getHbAnswer',
      data: {
        order_id: order_id
      },
      success(res){
        _this.setData({
          subject: res.data.subject,
          show: res.data.show,
          order: res.data.order
        })
      }
    })
  },
  /**
  * 拆开红包
  */
  answerOrder: function () {
    wx.showToast({
      title: 'loading...',
      icon: 'none',
      mask: true
    })
    var _this = this
    var order_id = _this.data.order_id
    var user_id = _this.data.user_id
    var subject = _this.data.subject
    var amount = _this.data.order.amount    //押金
    app.util.request({
      url: "entry/wxapp/AnswerOrder2",
      data: {
        order_id: order_id,
        user_id: user_id,
        amount: amount,
        subject: JSON.stringify(subject)
      },
      success(res) {
        if (res.data.error != -1) {
          wx.requestPayment({
            timeStamp: res.data.timeStamp,
            nonceStr: res.data.nonceStr,
            package: res.data.package,
            signType: res.data.signType,
            paySign: res.data.paySign,
            success: function (t) {
              wx.showToast({
                title: '支付成功',
                mask: true
              })
              setTimeout(function () {
                wx.redirectTo({
                  url: '../question_detail/index?order_id=' + order_id + '&open=1',
                })
              }, 1000)
            },
            fail: function () {
              wx.showToast({
                title: '取消支付',
                icon: 'none'
              })
            }
          })
        } else {
          wx.showToast({
            title: res.data.message,
            icon: 'none'
          })
        }
      }
    })
  },
  /**
    * 去发红包
  */
  sendRed: function () {
    wx.switchTab({
      url: '../question_index1/index',
    })
  },
  cancelpay: function () {
    this.setData({
      zf: 0
    })
  },
  /**
   * 遮罩防止页面滚动
   */
  preventTouchMove() { }
})