// pages/share/index.js
const app = getApp()
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
    this.getCodeImg()
  },
  /**
   * 获取分享图片
   */
  getCodeImg: function () {
    wx.showLoading({
      title: 'loading...',
    })
    var _this = this
    var order_id = _this.data.order_id
    app.util.request({
      url: "entry/wxapp/MyCode",
      data: {
        order_id: order_id
      },
      success(res){
        _this.setData({
          img: res.data
        })
        wx.hideLoading()
      }
    })
  },
  /**
   * 预览图片
   */
  save: function () {
    wx.previewImage({
      urls: [this.data.img]
    })
  },
  /**
   * 刷新图片
   */
  reload: function () {
    this.getCodeImg()
  },
  /**
   * 返回
   */
  back: function () {
    wx.navigateBack({
      delta: 1
    })
  }
})