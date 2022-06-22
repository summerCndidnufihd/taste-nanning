// pages/index/Shops/activity/details/details.js
//获取应用实例
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var f_id = options.f_id

    var that = this;
    wx.request({
      url: 'http://localhost:8081/api/food/getFoodById/'+f_id,
      method:"GET",
      header:{
        "content-type":'application/json'
      },
      success:function(res){
        console.log(res);
        that.setData({
          f_details:res.data.data[0].f_details,
          foodName:res.data.data[0].foodName,
          f_price:res.data.data[0].f_price,
          f_img:res.data.data[0].f_img
        })
      },
      fail:function(res){
        console.log("失败！");
      }
    })

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})