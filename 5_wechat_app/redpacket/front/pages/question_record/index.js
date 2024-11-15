const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    show: 0,
    selectedIdx: 0,
    page: 1,
    hasMoreData: true,
    recordList: [],
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var users = wx.getStorageSync('users')
    this.setData({
      users: users
    })
    this.getRecord()
  },
  /**
   * 切换选项卡
   */
  selectLabel: function (e) {
    var idx = e.currentTarget.dataset.idx
    var selectedIdx = this.data.selectedIdx
    if (idx != selectedIdx) {
      this.setData({
        page: 1,
        recordList: [],
        selectedIdx: idx,
      })
      this.getRecord()
    }
  },
  /**
   * 详情
   */
  detail: function (e) {
    wx.navigateTo({
      url: '../question_detail/index?order_id=' + e.currentTarget.dataset.id,
    })
  },
  /**
  * 页面上拉触底事件的处理函数
  */
  onReachBottom: function () {
    if (this.data.hasMoreData) {
      this.getRecord()
    }
  },
  /**
   * 获取红包记录
   */
  getRecord: function () {
    wx.showLoading({
      title: 'loading...',
    })
    var _this = this
    var user_id = wx.getStorageSync("users").id;
    var type = _this.data.selectedIdx == 0 ? 0 : 1;       //0发出1答过
    var page = _this.data.page
    app.util.request({
      url: "entry/wxapp/GetRecord",
      data: {
        user_id: user_id,
        type: type,
        page: page
      },
      success: function (res) {
        if (res.data.error != -1) {
          var recordListTem = _this.data.recordList;
          if (_this.data.page == 1) {
            recordListTem = []
          }
          var recordList = res.data.list;
          if (_this.data.page >= res.data.pageCount) {
            _this.setData({
              recordList: recordListTem.concat(recordList),
              hasMoreData: false
            })
          } else {
            _this.setData({
              recordList: recordListTem.concat(recordList),
              hasMoreData: true,
              page: _this.data.page + 1
            })
          }
          _this.setData({
            show: res.data.show,
            count: res.data.count,
            total_amount: res.data.total_amount
          })
        } else {
          wx.showToast({
            title: res.data.message,
            icon: 'none'
          })
        }
        wx.hideLoading()
      }
    })
  }
})