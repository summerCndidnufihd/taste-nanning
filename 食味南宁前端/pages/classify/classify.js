const utils = require('../../utils/util.js')
const data = require('../../JSON/classList.js')
const app = getApp()
Page({

    /**
     * 页面的初始数据
     */
    data: {
        height:0,
        iphonex:false,
        classlits:[],
        nvabarData: {
            showCapsule: 0,
            title: '菜谱分类',
        },
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        this.loadList()
        this.setData({
            height: app.globalData.height,
        });
        
    },
    loadList(){
        let that = this;
        that.setData({
            classlits: data.json.content
        })
    },
    gocateList(e){
        let that = this;
        let q = e.currentTarget.dataset.q;
        wx.navigateTo({
            url: '/pages/cateList/cateList?q=' + q,
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