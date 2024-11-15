// pages/already/index.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    selectedIdx: -1
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onShow: function (options) {
    var mySubject = wx.getStorageSync('mySubject')
    this.setData({
      mySubject: mySubject
    })
  },
  /**
   * 选择答案
   */
  selected: function (e) {
    var idx = e.currentTarget.dataset.index
    var id = e.currentTarget.dataset.id
    var mySubject = this.data.mySubject
    for (var i=0;i<mySubject.length;i++) {
      if (mySubject[i].subject.id == id) {
        mySubject[i].idx = idx
      }
    }
    this.setData({
      mySubject: mySubject
    })
  },
  /**
   * 删除问题
   */
  delete: function (e) {
    var _this = this
    var index = e.currentTarget.dataset.index
    wx.showModal({
      title: '提示',
      content: '确定删除该问题?',
      success(res){
        if (res.confirm) {
          var mySubject = _this.data.mySubject;
          mySubject.splice(index,1)
          _this.setData({
            mySubject: mySubject
          })
        }
      }
    })
  },
  /**
   * 保存修改
   */
  confirm: function () {
    var mySubject = this.data.mySubject;
    wx.setStorageSync('mySubject', mySubject)
    wx.navigateBack({
      'delta': 1
    })
  }
})