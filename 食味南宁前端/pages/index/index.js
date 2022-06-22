//index.js
//获取应用实例
const app = getApp()


/**声明了dataSet卡片信息数组和brick_option晓瀑布流插件配置**/
Page({

  /**
   * 页面的初始数据
   */
  data:{

  },
  
  /**
   * 生命周期函数--披萨页面的跳转
   */
  ddd: function(){
    wx.navigateTo({
      title:'披萨',
      url:'./Shops/Shops'
    })
  },
  /**
   * 生命周期函数--火锅页面的跳转
   */
  ddd1: function(){
    wx.navigateTo({
      title:'火锅',
      url:'./Hot/Hot'
    })
  },
  /**
   * 生命周期函数--拉面页面的跳转
   */
  ddd2: function(){
    wx.navigateTo({
      title:'拉面',
      url:'./Noodles/Noodles'
    })
  },
  /**
   * 生命周期函数--奶茶页面的跳转
   */
  ddd3: function(){
    wx.navigateTo({
      title:'奶茶',
      url:'./MilkTea/MilkTea'
    })
  },
  /**
   * 生命周期函数--西餐页面的跳转
   */
  ddd4: function(){
    wx.navigateTo({
      title:'西餐',
      url:'./Western/Western'
    })
  },
  /**
   * 生命周期函数--烧烤页面的跳转
   */
  ddd5: function(){
    wx.navigateTo({
      title:'烧烤',
      url:'./BBQ/BBQ'
    })
  },
  /**
   * 生命周期函数--街头食品页面的跳转
   */
  ddd6: function(){
    wx.navigateTo({
      title:'街头食品',
      url:'./Food/Food'
    })
  },
  /**
   * 生命周期函数--甜品页面的跳转
   */
  ddd7: function(){
    wx.navigateTo({
      title:'甜品',
      url:'./Sweet/Sweet'
    })
  },
  /**
   * 生命周期函数--搜索：今天想吃点什么页面的跳转
   */
  eating:function(){
    wx.navigateTo({
      title:'今天想吃点什么',
    //  url:'/pages/classify/classify',
      url:'/pages/Search/Search',
    })
  }
})







