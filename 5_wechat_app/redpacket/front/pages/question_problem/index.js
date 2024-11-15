// pages/problem/index.js
const app = getApp()
Page({
  /**
   * 页面的初始数据
   */
  data: {
    list:[],
    selectindex: -1
  },
  onLoad: function () {
    this.getProblem()
  },
  /**
   * 选择问题
   */
  selected: function (e) {
    var index = e.currentTarget.dataset.index
    var selectindex = this.data.selectindex
    if (selectindex == index) {
      this.setData({
        selectindex: -1
      })
    } else {
      this.setData({
        selectindex: index
      })
    }
  },
  /**
   * 问题列表
   */
  getProblem: function () {
    var _this = this
    app.util.request({
      url: 'entry/wxapp/problem',
      header: {
        "content-type": "application/json"
      },
      dataType: "json",
      success(res){
        _this.setData({
          list: res.data
        })
      }
    })
  }
})