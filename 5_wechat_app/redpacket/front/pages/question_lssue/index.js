// pages/lssue/index.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // bg: 'https://hongbang.dingyuedianshang.com/xcximg/lssuebg.jpg',
    num: 5,     //题目总数
    selectedIdx: -1,    //已选题目索引
    selectedNum: 1    //已选题目数量
  },
  /**
   * 监听页面显示
   */
  onShow: function () {
    var mySubject = wx.getStorageSync('mySubject') || [];
    var num = this.data.num
    this.setData({
      selectedNum: mySubject.length + 1 >= num ? num : mySubject.length + 1
    })
    if (this.data.selectedNum > 1) {
      this.qa_switch();
    }
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      num: options.num
    })
    this.getQAList()
  },
  /**
   * 选择答案
   */
  selected: function (e) {
    var _this = this
    var id = e.currentTarget.dataset.id
    var idx = e.currentTarget.dataset.index
    var num = _this.data.num
    var subject = _this.data.subject
    var subjectList = _this.data.subjectList
    var mySubject = wx.getStorageSync('mySubject') || [];
    mySubject.push(
      {
        idx: idx,
        subject: subject
      }
    )
    wx.setStorageSync('mySubject', mySubject)
    _this.setData({
      selectedIdx: idx
    })
    setTimeout(function () {
      _this.qa_switch()
    }, 500)

  },
  /**
   * 已出题目
   */
  already: function () {
    if (this.data.selectedNum <= 1) {
      wx.showToast({
        title: '您还没有出题哦',
        icon: 'none'
      })
      return
    }
    wx.navigateTo({
      url: '../question_already/index',
    })
  },
  /**
   * 更多题库
   */
  library: function () {
    wx.navigateTo({
      url: '../question_library/index?num=' + this.data.num
    })
  },
  /**
   * 结束出题
   */
  order: function () {
    var mySubject = wx.getStorageSync('mySubject');
    var len = mySubject.length
    if (len < 5) {
      wx.showModal({
        title: '提示',
        content: '题目不得少于五题',
        showCancel: false
      })
      return
    } else if (len >= 5 || len >= this.data.num) {
      wx.showModal({
        title: '出题完成',
        content: '出题已完成。点击确定后进入红包设置页面,题目不能再更改',
        cancelText: '检查一下',
        success(res) {
          if (res.confirm) {
            var user_id = wx.getStorageSync("users").id;
            wx.redirectTo({              //fds
              url: '../question_order/index?order_id=111',
            });
            // app.util.request({
            //   url: 'entry/wxapp/HbAddOrder',
            //   data: {
            //     user_id: user_id,
            //     subject: JSON.stringify(mySubject),
            //     subject_num: len
            //   },
            //   success(o) {
            //     if (o.data != -1) {
            //       wx.redirectTo({
            //         url: '../order/index?order_id='+o.data,
            //       })
            //     } else {
            //       wx.showToast({
            //         title: '网络错误,请重试',
            //         icon: 'none'
            //       })
            //     }
            //   }
            // })
          } else {
            wx.navigateTo({
              url: '../question_already/index',
            })
          }
        }
      })
    }
  },
  /**
   * 题目列表
   */
  getQAList: function () {
    wx.showLoading({
      title: 'loading...',
    })
    var _this = this;
    // app.util.request({
    //   url: "entry/wxapp/getQAList",
    //   success: function (res) {
        // var subjectLen = res.data.length;
        
        var subjectLen = 10;
        var subjectIndex = _this.randomNumBoth(0, subjectLen-1);
        var qalist=[
          {
            question: "我是谁? ",
            id: 1,
            options: ["冯读硕", "黄舒琦", "朱吟思", "薛育飞"]
          },
          {
            question: "你是谁? ",
            id: 2,
            options: ["冯读硕", "黄舒琦", "朱吟思", "薛育飞"]
          },
          {
            question: "我喜欢什么水果? ",
            id: 3,
            options: ["西瓜", "香蕉", "菠萝", "苹果"]
          },
          {
            question: "我喜欢的明星? ",
            id: 4,
            options: ["蔡徐坤", "易烊千玺", "胡歌", "唐国强"]
          },
          {
            question: "我家乡是哪里? ",
            id: 5,
            options: ["江苏", "浙江", "湖南", "黑龙江"]
          },
          {
            question: "我多大? ",
            id: 6,
            options: ["21", "22", "23", "24"]
          },
          {
            question: "我的星座? ",
            id: 7,
            options: ["射手", "白羊", "天秤", "狮子"]
          },
          {
            question: "我喜欢什么季节? ",
            id: 8,
            options: ["春天", "夏天", "秋天", "冬天"]
          },
          {
            question: "我喜欢的颜色? ",
            id: 9,
            options: ["白色", "蓝色", "黄色", "绿色"]
          },
          {
            question: "我希望的职业? ",
            id: 10,
            options: ["医生", "律师", "老师", "躺尸"]
          }
        ];
        _this.setData({
          subjectLen: subjectLen,
          // subjectList: res.data,
          // subject: res.data[subjectIndex],
          subjectList: qalist,
          subject: qalist[subjectIndex],
          subjectIndex: subjectIndex
        })
        wx.hideLoading()
      // }
    // })
  },
  /**
   * 随机换题
   */
  qa_switch: function () {
    var mySubject = wx.getStorageSync('mySubject');
    var num = this.data.num
    console.log("num",num)
    console.log("mysubject",mySubject.length)
    if (mySubject.length >= num) {
      this.order()
    } else {
      console.log("data.subjectLen",this.data.subjectLen)
      var subjectIndex = this.randomNumBoth(0, this.data.subjectLen - 1)
      //随机生成的题目和当前题一样时重新生成
      if (subjectIndex == this.data.subjectIndex) {
        this.qa_switch();
        return
      }
      var subject = this.data.subjectList[subjectIndex]
      //随机生成的题如果已选时重新生成
      console.log("mySubject.length",mySubject.length)
      for (var i=0;i<mySubject.length;i++) {          
        if (mySubject[i].subject.id == subject.id) {
          this.qa_switch();
          return
        }
      }
      this.setData({
        selectedIdx: -1,
        subject: subject,
        subjectIndex: subjectIndex,
        selectedNum: mySubject.length + 1 >= num ? num : mySubject.length + 1
      })
    }
  },
  /**
   * 生成指定范围的随机数
   */
  randomNumBoth: function(Min, Max){
    var Range = Max - Min;
    var Rand = Math.random();
    var num = Min + Math.round(Rand * Range);
    return num;
  }
})