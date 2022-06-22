
const app = getApp()

Page({
  data: {
    tabbar: ["披萨", "西餐", "火锅", "烧烤", "拉面", "街头食品", "甜品"],
    winHeight: "", //窗口高度
    currentTab: 0, //预设当前项的值
    scrollLeft: 0 //tab标题的滚动条位置
  },

  onLoad: function () {
    let that = this;
    //  高度自适应
    wx.getSystemInfo({
      success: function (res) {
        let calc = res.windowHeight; //顶部脱离文档流了(- res.windowWidth / 750 * 100);
        // console.log('==顶部高度==',calc)
        that.setData({
          winHeight: calc
        });
      }
    });
    wx.request({
      url: 'http://localhost:8081/api/dynamic/getDynamicByTag/'+this.data.tabbar[this.data.currentTab],
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
  // 滚动切换标签样式
  switchTab: function (e) {
    let that = this;
    console.log("滚动切换标签",e)
    that.setData({
      currentTab: e.detail.current
    });
    that.checkCor();
  },
  // 点击标题切换当前页时改变样式
  swichNav: function (e) {
    var that = this
    let cur = e.currentTarget.dataset.current;
    if (this.data.currentTab == cur) {
      return false;
    } else {
      this.setData({
        currentTab: cur
      }),
      wx.request({
        url: 'http://localhost:8081/api/dynamic/getDynamicByTag/'+this.data.tabbar[this.data.currentTab],
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
    }
  },
  //判断当前滚动超过一屏时，设置tab标题滚动条。
  checkCor: function () {
    let that = this;
    if (that.data.currentTab > 3) {
      that.setData({
        scrollLeft: 300
      })
    } else {
      that.setData({
        scrollLeft: 0
      })
    }
  },
  //发布信息函数
  fabu: function () {
    wx.navigateTo({
      url:'fabu/fabu',
      // setTimeout(()=>{
      //   wx.reLaunch({url:'fabu/fabu'}) 
      // },200),
      success: function (res) { },
      fail: function (res) { },
      complete: function (res) { },
    })
  },
})
