<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="com.adc.nt.model.User,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <script type="text/javascript" src="../../../lib/html5shiv.js"></script>
    <script type="text/javascript" src="../../../lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="../../../static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../../../static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="../../../lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="../../../static/h-ui.admin/skin/red/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="../../../static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="../../../lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>美食列表</title>
    <link rel="stylesheet" href="../../../lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body class="pos-r">
<!-- <div class="pos-a" style="width:200px;left:0;top:0; bottom:0; height:100%; border-right:1px solid #e5e5e5; background-color:#f5f5f5; overflow:auto;">
	<ul id="treeDemo" class="ztree"></ul>
</div> -->
<div >
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商家管理 <span class="c-gray en">&gt;</span> 美食列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="page-container">
        <div class="text-c">
            <form id="searchForm" action="${pageContext.request.contextPath}/api/store/getStoreListById" method="post">
                <input type="text" name="s_id" id="s_id" placeholder=" 输入商家ID..." style="width:250px" class="input-text">
                <button type="submit" value="搜索"  class="btn btn-success"  >搜索</button>
            </form>
        </div>
        <div class="cl pd-5 bg-1 bk-gray mt-20">
		 <span class="l">
		  <a class="btn btn-primary radius" href="${pageContext.request.contextPath}/api/store/toAddStore" >
		  <i class="Hui-iconfont"></i> 添加商家</a></span>
        </div>
        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr class="text-c">
                <th width="40"><input name="" type="checkbox" value=""></th>
                <th width="80">ID</th>
                <th width="80">商家名称</th>
                <th width="150">商家类别</th>
                <th width="150">商家地址</th>
                <th width="150">商家图片</th>
                <th width="150">人均价格</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="list">
                <tr class="text-c">
                    <td><input name="" type="checkbox" value=""></td>
                    <td>${list.s_id}</td>
                    <td>${list.storeName}</td>
                    <td class="text-c">${list.storeTag}</td>
                    <td class="text-c">${list.s_location}</td>
                    <td><img src="http://localhost:8080/upload/${list.s_img}" alt="" style="width: 100px;height: 80px"></td>
                    <td class="text-c">${list.s_price}</td>
                    <td class="td-manage">
                        <a style="text-decoration:none" class="ml-5" onClick="store_edit(${list.s_id})" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
                        <a style="text-decoration:none" class="ml-5" onClick="store_del(this,${list.s_id})" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</div>
<script type="text/javascript" src="../../../lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../../../lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../../../static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="../../../static/h-ui.admin/js/H-ui.admin.js"></script>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../../../lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="../../../lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="../../../lib/datatables/1.10.15/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../../lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

    /*图片-编辑*/
    function store_edit(id){
        location.href="${pageContext.request.contextPath}/api/store/toAlterStore/"+id;
    }

    /*美食-删除*/
    function store_del(obj,f_id){//id为取到的行id
        var r=confirm("是否确认删除？");
        if(r==true){
            //确定执行删除
            var id = f_id;
            $.get("${pageContext.request.contextPath}/api/store/delStore/"+id,function(data){
                if(data=="ok"){
                    alert("已删除！");
                    //删除成功后，刷新页面信息
                    location.reload();
                }else{
                    alert("删除失败！");
                }
            });
            return true;
        }else{
            //反之取消删除
            return false;
        }
    }
</script>
</body>
</html>