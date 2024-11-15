// coaches.js
var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    coaches:[]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    console.log('onLoad');
    var that = this;
    wx.setNavigationBarTitle({
      title: '教练团队',
    });
    wx.request({
      url: 'http://127.0.0.1:8000/index_coaches',
      data: {
      },
      success: function (res) {
        var coaches = [];
        for (var i = 0; i < res.data.data.length; i++) {
          coaches.push(res.data.data[i]);
        }
        that.setData({
          coaches: coaches
        });
      }
    });
    that.showZanTopTips("长按可联系对应教练哦~");
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
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
      return{
        title:"我们的教练",
        path: '/pages/coaches/coaches'
      }
  },

  //toptips
  showZanTopTips:function(content, options = {}) {
    let zanTopTips = this.data.zanTopTips || {};
    // 如果已经有一个计时器在了，就清理掉先
    if (zanTopTips.timer) {
      clearTimeout(zanTopTips.timer);
      zanTopTips.timer = undefined;
    }

    if (typeof options === 'number') {
      options = {
        duration: options
      };
    }

    // options参数默认参数扩展
    options = Object.assign({
      duration: 3000
    }, options);

    // 设置定时器，定时关闭topTips
    let timer = setTimeout(() => {
      this.setData({
        'zanTopTips.show': false,
        'zanTopTips.timer': undefined
      });
    }, options.duration);

    // 展示出topTips
    this.setData({
      zanTopTips: {
        show: true,
        content,
        options,
        timer
      }
    });
  },

  ContactCoachLongTap:function(e){
    var telnumber = e.currentTarget.dataset.telnumber;
    console.log(telnumber);
    wx.makePhoneCall({
      phoneNumber: telnumber,
    })
  }
})