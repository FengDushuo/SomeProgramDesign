// pages/answer/index.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    list: []
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      order_id: options.order_id
    })
    this.getProblem()
  },
  /**
   * 返回
   */
  back: function () {
    wx.navigateBack({
      delta:1
    })
  },
  /**
   * 获取问题
   */
  getProblem: function () {
    wx.showLoading({
      title: 'loading...',
    })
    var _this = this
    var order_id = _this.data.order_id
    app.util.request({
      url: 'entry/wxapp/GetProblem',
      data: {
        order_id: order_id
      },
      success(res){
        _this.setData({
          list: res.data
        })
        wx.hideLoading()
      }
    })
  }
})