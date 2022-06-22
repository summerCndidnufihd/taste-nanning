// pages/Search/Search.js

Page({

  /**
   * 页面的初始数据
   */

  data: {
      list: []
     },
     staticData: {
      inputValue: ""
   
 //   phone: '', //获取到的手机栏中的值
  //  Code: '',
 //   NewChanges: '',
 //   NewChangesAgain: '',
  },

    /**
   * 生命周期函数--搜索页面的跳转
   */
  clickTo:function(){
    // wx.request({
    //   url: 'http://api.tingtoutiao.com/', // 仅为示例，并非真实的接口地址
    //   data: {
        
    //   },
    //   header: {
    //     'content-type': 'application/json' // 默认值
    //   },
    //   success(res) {
    //     console.log(res.data)
    //   }
    // })

  },
   /**
   * 生命周期函数--监听页面加载
   */
  //搜索接口
  onLoad: function (options) {
    this.getSearchResult("");
    // var that = this;
    // wx.request({
    //   url: 'http://localhost:8080/api/food/getFoodByName',
    //   method:"GET",
    //   header:{
    //     "content-type":'application/json'
    //   },
    //   success:function(res){
    //     console.log(res);
    //     that.setData({
    //       result:res.data
    //     })
    //   },
    //   fail:function(res){
    //     console.log("失败！");
    //   }
    // })

  },
   getSearchResult(keyword) {
    wx.request({
     url: 'http://localhost:8080/api/food/getFoodByName',
     data: {
     keyword: this.staticData.inputValue
     },
     method: "GET",
     header: {
     'content-type': 'application/x-www-form-urlencoded' 
     },
     success: this.getSearchResultSucc.bind(this)
    })
   },
   getSearchResultSucc(res) {
    // console.log(res)
    if (res.data.ret) {
     const result = res.data.data;
     this.setData({
     list: result
     })
    } else {
     this.setData({
     list: []
     })
    }
   },
   handleInputChange(e) {
    this.staticData.inputValue = e.detail.value;
   },
   handleSearch (keyword) {
    this.getSearchResult(keyword)
   },
   handleItemTap(e) {
    wx.navigateTo({
     url: '/pages/detail/detail?id=' + e.currentTaret.id
    })
   }
})

