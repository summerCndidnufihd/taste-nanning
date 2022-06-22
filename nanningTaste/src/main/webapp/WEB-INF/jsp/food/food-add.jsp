<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
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
<!--/meta 作为公共模版分离出去-->

<link href="../../../lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
	<form action="${pageContext.request.contextPath}/api/food/addFood" method="post" class="form form-horizontal" enctype="multipart/form-data" id="form-article-add">

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">美食ID：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="f_id" placeholder="" value="" class="input-text">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>美食名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder=""  name="foodName">
			</div>
		</div>
				<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">商家ID：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="s_id"  placeholder="" value="" class="input-text">
			</div>
		</div>
				<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="f_price"  placeholder="" value="" class="input-text">
			</div>
		</div>
				<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">美食类型标签：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="foodTag" placeholder="" value="" class="input-text">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">详细内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea   cols="8" rows="80" name="f_details" placeholder="" class="input-text"></textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">缩略图：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="uploader-thum-container">
					<div id="fileList" class="uploader-list"></div>
					<input type="file" name="upload" placeholder="" value="" class="input-text">
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">图片上传：</label>
			<div class="formControls col-xs-8 col-sm-9">
                <div id="uploader" class="wu-example">
                    <!--用来存放文件信息-->
                    <input type="file" name="pictureFile" multiple/>
                    <div id="thelist" name="fileName" class="uploader-list">
                    </div>
                </div>
			</div>
		</div>

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<input  class="btn btn-primary radius"   type="submit" />
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
                <%--<input  class="btn btn-primary radius" onclick="upload()" type="submit" />--%>
			</div>
		</div>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../../../lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../../../lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../../../static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="../../../static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../../../lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="../../../lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="../../../validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="../../../lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="../../../lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="../../../lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="../../../lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="../../../lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    function upload() {
        var f_id = document.getElementsByName("f_id")[0].value;
        var filesl = document.getElementsByName("pictureFile")[0].files;
        var files = document.getElementsByName("pictureFile")[0];


        var formData = new FormData();
        for(var i=0;i < filesl.length;i++){
            formData.append("pictureFile",files.files[i]);
        }
        formData.append("f_id", f_id);
        console.log(formData)
        $.ajax({
            url:"${pageContext.request.contextPath}/api/webUpload/upload",
            type:"post",
            data:formData,
            dataType:"json",
            mimeType: "multipart/form-data",
            cache:false,
            processData:false,
            contentType:false,
            async:false,
            success:function(data){
                console.log(data)
            }
        })
</script>
</body>
</html>