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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body class="pos-r">
<!-- <div class="pos-a" style="width:200px;left:0;top:0; bottom:0; height:100%; border-right:1px solid #e5e5e5; background-color:#f5f5f5; overflow:auto;">
	<ul id="treeDemo" class="ztree"></ul>
</div> -->
<div >
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商家管理 <span class="c-gray en">&gt;</span> 美食列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="page-container">
        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr class="text-c">
                <th width="40"><input name="" type="checkbox" value=""></th>
                <th width="80">ID</th>
                <th width="80">用户ID</th>
                <th width="150">发布内容</th>
                <th width="150">美食标签</th>
                <th width="150">美食图片</th>
                <th width="150">发布日期</th>
                <th width="150">状态</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="list">
                <tr class="text-c">
                    <td><input name="" type="checkbox" value=""></td>
                    <td>${list.d_id}</td>
                    <td>${list.u_id}</td>
                    <td class="text-c">${list.d_details}</td>
                    <td class="text-c">${list.d_tag}</td>
                    <td><img src="http://localhost:8080/upload/${list.d_img}" alt="" style="width: 100px;height: 80px"></td>
                    <td class="text-c">${list.d_date}</td>
                    <td class="td-status"><span class="label label-success radius">${list.d_status}</span></td>
                    <td class="td-manage">
                        <a style="text-decoration:none" onClick="dynamic_check_no(this,${list.d_id},'${list.d_status}')" href="javascript:;" title="审核"><i class="Hui-iconfont">&#xe631;</i></a>
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
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: false,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable:true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function(treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree");
                if (treeNode.isParent) {
                    zTree.expandNode(treeNode);
                    return false;
                } else {
                    //demoIframe.attr("src",treeNode.file + ".html");
                    return true;
                }
            }
        }
    };

    var zNodes =[
        { id:1, pId:0, name:"一级分类", open:true},
        { id:11, pId:1, name:"二级分类"},
        { id:111, pId:11, name:"三级分类"},
        { id:112, pId:11, name:"三级分类"},
        { id:113, pId:11, name:"三级分类"},
        { id:114, pId:11, name:"三级分类"},
        { id:115, pId:11, name:"三级分类"},
        { id:12, pId:1, name:"二级分类 1-2"},
        { id:121, pId:12, name:"三级分类 1-2-1"},
        { id:122, pId:12, name:"三级分类 1-2-2"},
    ];



    $(document).ready(function(){
        var t = $("#treeDemo");
        t = $.fn.zTree.init(t, setting, zNodes);
        //demoIframe = $("#testIframe");
        //demoIframe.on("load", loadReady);
        var zTree = $.fn.zTree.getZTreeObj("tree");
        //zTree.selectNode(zTree.getNodeByParam("id",'11'));
    });

    $('.table-sort').dataTable({
        "aaSorting": [[ 1, "desc" ]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            {"orderable":false,"aTargets":[0,7]}// 制定列不参与排序
        ]
    });
    /*产品-添加*/
    function product_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*产品-查看*/
    function product_show(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*产品-审核*/
    /*管理员-禁用*/
    function dynamic_check_no(obj,id,power){
        if(power=="未审核"){
            layer.confirm('审核是否通过？',function(index){
                //此处请求后台程序，下方是成功后的前台处理……
                $.ajax(
                    {
                        url:'${pageContext.request.contextPath}/api/dynamic/checkDynamic',
                        async : false,
                        cache : false,
                        traditional: true,
                        type : 'POST',
                        data:{
                            id : id,
                            'power':'已通过'
                        },
                        success:function(result){
                            layer.closeAll();
                            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="dynamic_check_yes(this,id)" href="javascript:;" title="已通过" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
                            $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已通过</span>');
                            $(obj).remove();
                            layer.msg('已修改!',{icon: 5,time:1000});
                            // window.location.reload();//刷新父级页面
                            // var index = layer.getFrameIndex(window.name); //获取当前页面索引
                            // layer.close(index); //关闭当前页面
                        },
                        error:function(result){
                            layer.closeAll();
                            //layer.msg(result.msg);
                        }
                    });
            });
        }else{
            dynamic_check_yes(obj,id,power);
        }
    }

    /*动态-启用*/
    function dynamic_check_yes(obj,id,power){
        layer.confirm('确认要修改为不通过吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax(
                {
                    url:'${pageContext.request.contextPath}/api/dynamic/checkDynamic',
                    async : false,
                    cache : false,
                    traditional: true,
                    type : 'POST',
                    data:{
                        id : id,
                        'power':'未通过'
                    },
                    success:function(result){
                        layer.closeAll();
                        $(obj).parents("tr").find(".td-manage").prepend('<a onClick="dynamic_check_no(this,id)" href="javascript:;" title="未通过" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">未通过</span>');
                        $(obj).remove();
                        layer.msg('已修改!', {icon: 6,time:1000});
                        //     window.location.reload();//刷新父级页面
                        //     var index = layer.getFrameIndex(window.name); //获取当前页面索引
                        //     layer.close(index); //关闭当前页面
                        // },
                        error:function(result){
                            layer.closeAll();
                            //layer.msg(result.msg);
                        }
                    });
        });
    }
    /*图片-编辑*/
    function food_edit(id){
        location.href="${pageContext.request.contextPath}/api/dynamic/toEditFood/"+id;
    }

    /*美食-删除*/
    function food_del(obj,f_id){//id为取到的行id
        var r=confirm("是否确认删除？");
        if(r==true){
            //确定执行删除
            var id = f_id;
            $.get("${pageContext.request.contextPath}/api/dynamic/delDynamic/"+id,function(data){
                if(data=="ok"){
                    alert("删除成功!");
                    //删除成功后，刷新页面信息
                    location.reload();
                }else{
                    alert("删除失败！!");
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