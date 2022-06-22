// pages/index/Shops/activity/activity.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    array:[],
    s_location:'',
    storeName:''
  },

  /**
   * 生命周期函数--芝加哥披萨页面的跳转
   */
  //  bindtap="ccc",bindtap是点击事件
  ccc: function(e){
    console.log(e)
    wx.navigateTo({
      title:'芝加哥披萨',
      url:'./details/details?f_id='+ e.currentTarget.dataset.f_id
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  console.log(options)
  var s_id = options.s_id

  var that = this;
  wx.request({
    url: 'http://localhost:8081/api/food/getFoodBys_id/'+s_id,
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
  }),

  wx.request({
    url: 'http://localhost:8081/api/store/getId/'+s_id,
    method:"GET",
    header:{
      "content-type":'application/json'
    },
    success:function(res){
      console.log(res);

      that.setData({
        s_location:res.data.data[0].s_location,
        storeName:res.data.data[0].storeName,
        s_img:res.data.data[0].s_img
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