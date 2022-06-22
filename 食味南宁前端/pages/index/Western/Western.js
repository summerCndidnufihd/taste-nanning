// pages/index/Western/Western.js
const app = getApp()

Page({
  data: {
    array:[]
  },
  // onLoad:function(){
  //   var array = this.iniData();
  //   this.setData({array:array});
  // },

  onLoad: function (options) {
    var that = this;
    wx.request({
      url: 'http://localhost:8081/api/store/storeTag/西餐',
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

  // iniData:function(){
  //   var array=[];
  //   var object1 = new Object();
  //   object1.img="/images/w1.jpg";
  //   object1.title="洛ROJO西班牙餐吧";
  //   object1.type="万象城";
  //   object1.juli="1.4km";
  //   object1.renjun = "¥131/人"

  //   var object2 = new Object();
  //   object2.img="/images/w2.jpg";
  //   object2.title="LIGHT&MORE";
  //   object2.type="民族大道";
  //   object2.juli="2.3km";
  //   object2.renjun = "¥161/人"

  //   var object3 = new Object();
  //   object3.img="/images/w3.jpg";
  //   object3.title="驿逅";
  //   object3.type="朝阳广场";
  //   object3.juli="4.1km";
  //   object3.renjun = "¥57/人"

  //   var object4 = new Object();
  //   object4.img="/images/w4.jpg";
  //   object4.title="MuLight霂光Club";
  //   object4.type="凯旋路绿地中心";
  //   object4.juli="6.3km";
  //   object4.renjun = "¥119/人"

  //   array[0] = object1;
  //   array[1] = object2;
  //   array[2] = object3;
  //   array[3] = object4;
  //   array[4] = object1;
  //   array[5] = object1;
  //   array[6] = object1;
  //   return array;
  // },

  seeDetail: function(e){
    console.log(e)
    wx.navigateTo({
      title:'西餐',
      url:'./activity/activity?s_id=' + e.currentTarget.dataset.s_id
    })
  }
 
})