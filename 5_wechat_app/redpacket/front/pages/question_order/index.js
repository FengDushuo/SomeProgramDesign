// pages/order/index.js
const app = getApp()

Page({

  /**
   * 页面的初始数据
   */
  data: {
    countIndex: 3,    //答对数量默认4题
    consumeIndex: 1,   //答方支付比例默认10%
    show: 0, //是否显示金额相关信息
    noticeShow: false,    //提示
    consume: [],      //支付比例
    showModal: false,     //支付方式
    btntype: "btn_ok1",   //余额支付
    zffs: 1,            //1微信支付2余额支付
    zfz: !1,            //支付中状态
    money: 0.00,     //余额
    redAmount: 0.00,    //红包总额
    redNum: 0,     //红包总数
    totalPrice: 0.00,   //支付总金额
    serviceTotal: 0.00    //服务费
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var mySubject = wx.getStorageSync('mySubject') || [];
    var mySubjectLen = mySubject.length
    if (mySubjectLen < 5) {
      wx.showToast({
        title: '参数错误,请重试',
      })
      setTimeout(function(){
        wx.redirectTo({
          url: '../question_index1/index',
        })
      },1000)
    } else {
      this.setData({
        order_id: options.order_id,
        mySubject: mySubject,
        mySubjectLen: mySubjectLen
      })
      this.getUserInfo()
    }
    this.correctNum()
  },
  /**
   * 监听红包总金额
   */
  bindRedAmount: function (e) {
    var redAmount = parseFloat(e.detail.value)
    if (redAmount < 1) {
      this.waring('红包总金额不能低于1元')
    }
    if (redAmount > 2000) {
      this.waring('红包总金额不能超过2000元')
    }
    var serviceTotal = 0.00;
    if (redAmount) {
      serviceTotal = redAmount * this.data.servicePrice   //计算服务费
      serviceTotal = serviceTotal.toFixed(2)
    }
    this.setData({
      redAmount: redAmount,
      serviceTotal: serviceTotal
    })
  },
  /**
   * 监听红包数量
   */
  bindRedNum: function (e) {
    var redAmount = parseFloat(this.data.redAmount)
    var redNum = parseFloat(e.detail.value)
    var show = this.data.show
    if (redNum < 1) {
      this.waring('红包总数最少1个')
    }
    if (redNum > 200) {
      this.waring('红包总数最多200个')
    }
    if (show == 1) {
      if (redAmount / redNum < 1) {
        this.waring('每人获得的红包不能低于1元')
      }
    }
    this.setData({
      redNum: redNum
    })
  },
  /**
   * 答对题目数量
   */
  correctNum: function () {
    var len = this.data.mySubjectLen;
    var count = [];
    for (var i=0; i<len-1; i++) {
      count[i] = i+1
    }
    this.setData({
      count: count
    })
  },
  /**
   * 选择答题数量
   */
  countChange: function (e) {
    this.setData({
      countIndex: e.detail.value
    })
  },
  /**
   * 选择答方支付比例
   */
  consumeChange: function (e) {
    this.setData({
      consumeIndex: e.detail.value
    })
  },
  /**
   * 提醒
   */
  waring: function (v) {
    var _this = this
    _this.setData({
      noticeShow: true,
      waring: v
    })
    setTimeout(function(){
      _this.setData({
        noticeShow: false
      })
    },3000)
  },
  /**
   * 选择支付方式
   */
  radioChange1: function (t) {
    "wxzf" == t.detail.value && this.setData({
      zffs: 1,
      zfwz: "微信支付",
      btntype: "btn_ok1"
    }), "yezf" == t.detail.value && this.setData({
      zffs: 2,
      zfwz: "余额支付",
      btntype: "btn_ok2"
    })
  },
  /**
   * 隐藏支付方式
   */
  yczz: function () {
    this.setData({
      showModal: false
    });
  },
  /**
   * 获取用户信息
   */
  getUserInfo: function () {
    var user_id = wx.getStorageSync("users").id;
    var _this = this
    // app.util.request({
    //   url: "entry/wxapp/UserInfo",
    //   data: {
    //     user_id: user_id,
    //   },
    //   success: function (res) {
        _this.setData({
          user_id: user_id,
          money: 11,   //余额   
          show: 0,    //是否显示支付相关
          servicePrice: 2,     //服务费率
          consume: 2         //答方支付比例
        })
    //   }
    // })
  },
  /**
   * 生成答题红包
   */
  generate: function () {
    var _this = this
    var show = _this.data.show
    var order_id = _this.data.order_id
    var redAmount = parseFloat(_this.data.redAmount)   //红包总金额
    var redNum = parseFloat(_this.data.redNum)       //红包数量
    var redCount = _this.data.count[_this.data.countIndex]    //答对数量
    var redConsume = _this.data.consume[_this.data.consumeIndex]    //答方支付比例
    var serviceTotal = parseFloat(_this.data.serviceTotal)   //服务费
    var mySubject = _this.data.mySubject     //已选题目
    if (show == 1) {
      if (redAmount < 1) {
        this.waring('红包总金额不能低于1元')
        return
      }
      if (redAmount > 2000) {
        this.waring('红包总金额不能超过2000元')
        return
      }
      if (redNum < 1) {
        this.waring('红包总数最少1个')
        return
      }
      if (redNum > 200) {
        this.waring('红包总数最多200个')
        return
      }
      if (parseFloat(redAmount / redNum) < 1) {
        this.waring('每人获得的红包不能低于1元')
        return
      }
      var totalPrice = redAmount + serviceTotal   //总金额加服务费
      this.setData({
        totalPrice: totalPrice.toFixed(2),
        showModal: true
      })
    } else {
      //过审核直接生成订单免跳转
      if (redNum < 1) {
        this.waring('红包总数最少1个')
        return
      }
      if (redNum > 200) {
        this.waring('红包总数最多200个')
        return
      }
      var data = {
        order_id: order_id,
        redNum: redNum,
        redCount: redCount
      }
      // app.util.request({
      //   url: 'entry/wxapp/HbOrderNoShow',
      //   data: data,
      //   success(res){
      //     if (res.data.error != -1) {
            wx.showToast({
              title: '出题成功',
              mask: true
            })
            setTimeout(function () {
              wx.redirectTo({
                url: '../question_detail/index?order_id=' + order_id,
              })
            }, 1000)
          // } else {
          //   wx.showToast({
          //     title: res.data.message,
          //     icon: 'none'
          //   })
          // }
          
      //   }
      // })
      //分享页面
      wx.redirectTo({
        url: '../question_detail/index',
      })
    }
  },
  /**
   * 生成订单(支付)
   */
  formSubmit: function (e) {
    var _this = this
    _this.setData({
      zfz: !0
    })
    var show = _this.data.show
    var redAmount = parseFloat(_this.data.redAmount)   //红包总金额
    var redNum = parseFloat(_this.data.redNum)       //红包数量
    var redCount = _this.data.count[_this.data.countIndex]    //答对数量
    var redConsume = _this.data.consume[_this.data.consumeIndex]    //答方支付比例
    var serviceTotal = parseFloat(_this.data.serviceTotal)   //服务费
    var totalPrice = parseFloat(_this.data.totalPrice)    //支付总金额
    var payType = e.detail.value.radiogroup
    var order_id = _this.data.order_id
    var data = {
      order_id: order_id,
      redAmount: redAmount,
      redNum: redNum,
      redCount: redCount,
      redConsume: redConsume,
      serviceTotal: serviceTotal,
      totalPrice: totalPrice,
      payType: payType
    }
    app.util.request({
      url: 'entry/wxapp/HbOrderPay',
      data: data,
      success(res){
        if (res.data.error != -1) {
          if (payType == 'wxzf') {
            wx.requestPayment({
              timeStamp: res.data.timeStamp,
              nonceStr: res.data.nonceStr,
              package: res.data.package,
              signType: res.data.signType,
              paySign: res.data.paySign,
              success: function(t) {
                wx.showToast({
                  title: '支付成功',
                  mask: true
                })
                setTimeout(function(){
                  wx.redirectTo({
                    url: '../question_detail/index?order_id=' + order_id,
                  })
                },1000)
              },
              fail: function() {
                wx.showToast({
                  title: '取消支付',
                  icon: 'none'
                })
              }
            })
          } else {
            if (res.data == 0) {
              wx.showToast({
                title: '支付成功',
                mask: true
              })
              setTimeout(function () {
                wx.redirectTo({
                  url: '../question_detail/index?order_id=' + order_id,
                })
              }, 1000)
            }
          }
        } else {
          wx.showToast({
            title: res.data.message,
            icon: 'none'
          })
        }
        _this.setData({
          zfz: !1
        })
      }
    })
  }
})