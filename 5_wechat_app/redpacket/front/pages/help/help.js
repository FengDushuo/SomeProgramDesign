//help.js
const app = getApp()

Page({
  data: {
    lists: [{
      tit:"红包怎么玩？",
      txt:"您可以设置一个带奖励的问题列表，好友答对问题才能领取到奖励。"
    }, {
      tit: "我支付了但没有发出去？",
      txt: "请在主页的【我的记录】中找到相应的记录，点击进入详情后点击【去转发】可转发给好友或群。"
    }, {
      tit: "好友可以转发我的红包吗？",
      txt: "可以的，您分享给好友或者转发到微信群的红包，其他好友均可再次转发。"
    }, {
      tit: "会收取服务费吗？",
      txt: "会收取1%的服务费。"
    }, {
      tit: "未领取的金额会怎样处理？",
      txt: "未领取的金额将于24小时后退至小程序余额。"
    }, {
      tit: "如何提现到微信钱包？",
      txt: "在主页的【余额提现】或详情页的【去提现】均可跳转至余额提现页面进行提现，提现金额每次至少1元。"
    }, {
      tit: "提现会收取服务费吗？多久到账？",
      txt: "提现不收取服务费；申请提现后会在1-5个工作日内转账到您的微信钱包。"
    },],
    control:-1,
    version:'1.0.0',
    platformID: 1, //平台广告id
    platformAdvImg: "/images/adv.png", //平台广告图片
    gotoPlatformAdvdetial: "/pages/record/record/ptadvID=", //平台广告链接
  },
  onshow: function(e){
    if (this.data.control === e.target.dataset.id){
      this.setData({
        control: -1
      })
    }else{
      this.setData({
        control: e.target.dataset.id
      })
    }
  },
  //拨打电话
  tel: function () {
    wx.makePhoneCall({
      phoneNumber: '13242857521'
    })
  },
  one: function(){},
  onLoad: function () {
    var res = wx.getSystemInfoSync();
  },

  // 广告链接
  gotoPlatformAdv:function(){
    wx.navigateTo({
      url: '/pages/report/report'
    })
  }
})
