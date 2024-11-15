// pages/generate/index.js
Page({

  /**
   * 页面的初始数据
   */
  data: {

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      order_id: options.order_id
    })
  },
  /**
   * 红包详情
   */
  detail: function () {
    wx.navigateTo({
      url: '../question_detail/index?order_id='+this.data.order_id,
    })
  },
  /**
   * 拆包
   */
  demolition: function () {
    wx.navigateTo({
      url: '../question_demolition/index',
    })
  }
})