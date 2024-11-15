// video.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    showvideo:""
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    wx.request({
      url: 'http://127.0.0.1:8000/index_video',
      success: function (res) {
        console.log(res.data);
        var videourl = res.data;
        that.setData({
          showvideo: videourl
        });
      }
    });
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    wx.setNavigationBarTitle({
      title: '实景视频',
    });
    wx.getNetworkType({
      success: function (res) {
        var networkType = res.networkType; // 返回网络类型2g，3g，4g，wifi
        if (networkType != "wifi") {
          console.log(networkType);
          wx.showModal({
            title: '提示',
            content: '您的手机当前不是wifi环境，流量播放，请注意。',
            showCancel:false,
            confirmText:'我知道了',
          })
        }
      }
    });
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
  
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
  
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
  
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  },
  videoErrorCallback: function (e) {
    console.log('视频错误信息:');
    console.log(e.detail.errMsg);
  },
  playvideo: function(){
  }
})