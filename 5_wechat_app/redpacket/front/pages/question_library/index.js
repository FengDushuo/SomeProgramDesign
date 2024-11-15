// pages/library/index.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    id: 0,
    len: 0,      //已出题目
    num: 5,     //题目总数
    cateIdx: 0   //选中的分类(默认第一个)
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var mySubject = wx.getStorageSync('mySubject') || [];
    this.setData({
      mySubject: mySubject,
      num: options.num,
      len: mySubject.length
    })
    this.getList();
  },
  /**
   * 选择栏目
   */
  selectCate: function (e) {
    var idx = e.currentTarget.dataset.idx
    var subject = this.data.cateList[idx].subject
    var mySubject = this.data.mySubject
    for (var i = 0; i < subject.length; i++) {
      if (mySubject.length > 0) {     //默认选中
        for (var j = 0; j < mySubject.length; j++) {
          if (subject[i].id == mySubject[j].subject.id) {
            subject[i].selected = true
            subject[i].idx = mySubject[j].idx
          }
        }
      } else {
        subject[i].selected = false
        subject[i].idx = -1
      }
    }
    this.setData({
      cateIdx: idx,
      subject: subject
    })
  },
  /**
   * 已出题目
   */
  already: function () {
    if (this.data.mySubject.length <= 0) {
      wx.showToast({
        title: '您还没有出题哦',
        icon: 'none'
      })
      return
    }
    wx.redirectTo({
      url: '../question_already/index',
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
            app.util.request({
              url: 'entry/wxapp/HbAddOrder',
              data: {
                user_id: user_id,
                subject: JSON.stringify(mySubject),
                subject_num: len
              },
              success(o) {
                if (o.data != -1) {
                  wx.redirectTo({
                    url: '../question_order/index?order_id=' + o.data,
                  })
                } else {
                  wx.showToast({
                    title: '网络错误,请重试',
                    icon: 'none'
                  })
                }
              }
            })
          } else {
            wx.redirectTo({
              url: '../question_already/index',
            })
          }
        }
      })
    }
  },
  /**
   *  选择题目 
   */
  radioChange: function (e) {
    var id_idx = e.detail.value
    var id = id_idx.substring(0, id_idx.indexOf('_'))
    var idx = id_idx.substring(id_idx.indexOf('_')+1,id_idx.length)
    var subject = this.data.subject
    var mySubject = this.data.mySubject
    var num = this.data.num
    var s = {}
    for (var i = 0; i < subject.length; i++) {
      if (subject[i].id == id) {
        subject[i].selected = true
        subject[i].idx = idx
        var s = subject[i]
      }
    }
    //存在修改不存在添加
    var flag = false
    if (mySubject.length > 0) {
      for (var i = 0; i < mySubject.length; i++) {
        if (mySubject[i].subject.id == id) {
          mySubject[i].idx = idx
          flag = true
        }
        if (i == mySubject.length-1 && flag == false) {
          mySubject.push({ idx: idx, subject: s })
        }
      }
    } else {
      mySubject.push({ idx: idx, subject: s })
    }
    this.setData({
      subject: subject,
      mySubject: mySubject,
      len: mySubject.length >= num ? num : mySubject.length
    })
    wx.setStorageSync('mySubject', mySubject)
    if (mySubject.length >= this.data.num) {
      this.order()
    }
  },
  /**
   * 删除题目
   */
  bindDelete: function (e) {
    var id = e.currentTarget.dataset.id
    var subject = this.data.subject
    var mySubject = this.data.mySubject
    for (var i=0;i<subject.length;i++) {
      if (subject[i].id == id) {
        subject[i].selected = false
        subject[i].idx = -1
      }
    }
    for (var i = 0; i < mySubject.length; i++) {
      if (mySubject[i].subject.id == id) {
        mySubject.splice(i, 1)
      }
    }
    this.setData({
      subject: subject,
      mySubject: mySubject,
      len: mySubject.length
    })
    wx.setStorageSync('mySubject', mySubject)
  },
  /**
   * 获取栏目列表
   */
  getList: function () {
    wx.showLoading({
      title: 'loading...',
    })
    var _this = this
    var mySubject = _this.data.mySubject
    app.util.request({
      url: 'entry/wxapp/GetCateList',
      success(res){
        var cateList = res.data
        var subject = cateList[_this.data.cateIdx].subject
        if (mySubject.length > 0) {     //默认选中
          for (var i = 0; i < subject.length;i++) {
            for (var j = 0; j < mySubject.length;j++) {
              if (subject[i].id == mySubject[j].subject.id) {
                subject[i].selected = true
                subject[i].idx = mySubject[j].idx
              }
            }
          }
        }
        _this.setData({
          cateList: cateList,
          subject: subject
        })
        wx.hideLoading()
      }
    })
  }
})