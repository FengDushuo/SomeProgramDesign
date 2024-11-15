// pages/cash/index.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    money: 0.00,    //账户余额
    account: 1,    //提现金额限制
    show: false,
    waring: '',    //提示
    cash: '',
    notice: ''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.getUserInfo()
  },
  /**
   * 常见问题
   */
  problem: function () {
    wx.navigateTo({
      url: '../question_problem/index',
    })
  },
  /**
 * 余额
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
          account: res.data.account,
          ggw: res.data.ggw,
          notice: res.data.notice,
          user_id: user_id
        })
      }
    })
  },
  /**
   * 提现
   */
  formSubmit: function (e) {
    var _this = this
    var cash = parseFloat(e.detail.value.cash) || 0
    var account = parseFloat(_this.data.account)
    var money = parseFloat(_this.data.money)
    var user_id = _this.data.user_id
    if (cash > money) {
      _this.setData({
        show: true,
        waring: '提现金额超过账户余额'
      })
      setTimeout(function () {
        _this.setData({
          show: false
        })
      }, 3000)
      return
    }
    if (cash < account) {
      _this.setData({
        show: true,
        waring: '提现金额不能低于' + account + '元'
      })
      setTimeout(function () {
        _this.setData({
          show: false
        })
      }, 3000)
      return
    }
    app.util.request({
      url: "entry/wxapp/HbWithdraw",
      data: {
        cash: cash,
        user_id: user_id
      },
      success(res){
        if (res.data.error != -1) {
          wx.showToast({
            title: '申请成功',
          })
          setTimeout(function(){
            _this.getUserInfo()
          },1000)
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
   * 全部提现
   */
  allCash: function () {
    this.setData({
      cash: this.data.money
    })
  },
  /**
   * 判断输入金额
   */
  bindKeyInput: function (e) {
    var _this = this
    var balance = parseFloat(e.detail.value)
    var account = parseFloat(_this.data.account)
    var money = parseFloat(_this.data.money)
    if (balance > money) {
      _this.setData({
        show: true,
        waring: '提现金额超过账户余额'
      })
      setTimeout(function () {
        _this.setData({
          show: false
        })
      }, 3000)
      return
    }
    if (balance < account) {
      _this.setData({
        show: true,
        waring: '提现金额不能低于'+account+'元'
      })
      setTimeout(function(){
        _this.setData({
          show: false
        })
      },3000)
      return
    }
  },
  /**
   * 跳转众筹
   */
  wkzc: function () {
    wx.navigateToMiniProgram({
      appId: 'wx2c2d379a1806d40f'
    })
  },
})