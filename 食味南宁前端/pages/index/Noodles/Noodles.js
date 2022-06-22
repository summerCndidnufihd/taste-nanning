// pages/index/Shops/Shops.js
//index.js
//获取应用实例
const app = getApp()

Page({
  data: {
    array:[]
  },


  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    wx.request({
      url: 'http://localhost:8081/api/store/storeTag/拉面',
      method:"GET",
      header:{
        "content-type":'application/json'
      },
      success:function(res){
        console.log(res);
        that.setData({
          array:res.data.data
        })
      },
      fail:function(res){
        console.log("失败！");
      }
    })

  },

  seeDetail: function(e){
    console.log(e)
    wx.navigateTo({
      title:'披萨',
      url:'./activity/activity?s_id=' + e.currentTarget.dataset.s_id
    })
  }
 
})
