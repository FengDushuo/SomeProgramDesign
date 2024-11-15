// pages/detail/index.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    page: 1,
    hasMoreData: true,
    answerList: [],
    selectedIdx: 0,
    show: 0
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var users = wx.getStorageSync('users')
    this.setData({
      users: users,
      order_id: options.order_id,
      open: options.open || 0
    })
    this.getOrderDetai()
    this.getOrderAnserList()
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
        answerList: [],
        selectedIdx: idx
      })
      this.getOrderAnserList()
    }
  },
  /**
  * 页面上拉触底事件的处理函数
  */
  onReachBottom: function () {
    if (this.data.hasMoreData) {
      this.getOrderAnserList()
    }
  },
  /**
   * 查看答案(回答)
   */
  answer: function () {
    wx.navigateTo({
      url: '../question_answer/index?order_id=' + this.data.order_id,
    })
  },
  /**
   * 发答题红包
   */
  send: function () {
    wx.navigateTo({
      url: '../question_index1/index'
    })
  },
  /**
   * 题目详情
   */
  getOrderDetai: function () {
    wx.showLoading({
      title: 'loading....',
    })
    var _this = this
    var order_id = _this.data.order_id
    var user_id = _this.data.users.id
    // app.util.request({
    //   url: "entry/wxapp/GetOrderDetail",
    //   data: {
    //     order_id: order_id,
    //     user_id: user_id
    //   },
    //   success(res) {
      var orderdata = {
        img:"/images/avatar_frame.png",
        name:"fanfan",
        user_id:11,
        success_num:1,
        fail_num:3,
        success_amount:1,
        red_amount:4,
        answer:{
          success_num:2,
          answer_status:1,
          success_amount:1,
        },
        over:0,
        red_count:4,
        red_num:3,
      }
        _this.setData({
          orderInfo: orderdata,
          show: 1
          // orderInfo: res.data,
          // show: res.data.show
        })
        wx.hideLoading()
    //   }
    // })
  },
  /**
   * 答题列表
   */
  getOrderAnserList: function () {
    wx.showLoading({
      title: 'loading...',
    })
    var _this = this
    var order_id = _this.data.order_id
    var type = _this.data.selectedIdx == 0 ? 0 : 1;       //0成功1失败
    var page = _this.data.page
    // app.util.request({
    //   url: "entry/wxapp/GetOrderAnswerList",
    //   data: {
    //     order_id: order_id,
    //     type: type,
    //     page: page
    //   },
    //   success(res) {
        var answerListTem = _this.data.answerList;
        if (_this.data.page == 1) {
          answerListTem = []
        }
        var answerList = [
          {
            img: "/images/me.png",
            name: "冯读硕",
            gender: 1,
            success_amount: 0.55,
            know: 60,
            complete_time: 15.55,
          },
          {
            img: "/images/me-on.png",
            name: "黄舒琦",
            gender: 2,
            success_amount: 0.55,
            know: 60,
            complete_time: 15.55,
          }
        ];
        // var answerList = res.data.list;
        // if (_this.data.page >= res.data.pageCount) {
          if (_this.data.page >= 1) {
          _this.setData({
            answerList: answerListTem.concat(answerList),
            hasMoreData: false
          })
        } else {
          _this.setData({
            answerList: answerListTem.concat(answerList),
            hasMoreData: true,
            page: _this.data.page + 1
          })
        }
        wx.hideLoading()
    //   }
    // })
  },
  /**
   * 生成分享图
   */
  share: function () {
    wx.navigateTo({
      url: '../question_share/index?order_id='+this.data.order_id,
    })
  },
  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
    return {
      title : '恭喜发财,大吉大利',
      path : '/pages/question_demolition/index?order_id='+ this.data.order_id
    }
  },
  /**
   * 清除弹框
   */
  cancelpay: function () {
    this.setData({
      open: 0
    })
  },
  /**
 * 遮罩防止页面滚动
 */
  preventTouchMove() { }
})