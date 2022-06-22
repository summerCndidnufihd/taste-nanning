<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="com.adc.nt.model.User,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
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
</head>
<body>
<form class="form form-horizontal" action="${pageContext.request.contextPath}/api/food/editFood" method="post">
    <c:forEach items="${list}" var="list">
        <div class="row cl">
            <div class="formControls col-xs-8 col-sm-9">
                <input type="hidden" class="input-text" value="${list.f_id}" placeholder="" name="f_id">
            </div>
        </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>美食名称：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" value="${list.foodName}" placeholder="" name="foodName">
        </div>
    </div>
        <%--<td><img src="http://localhost:8080/upload/${list.f_img}" alt="" style="width: 100px;height: 80px"></td>--%>
       <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">美食图片：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" value="${list.f_img}" placeholder="" name="f_img">
        </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">内容详情：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${list.f_details}" placeholder="" name="f_details">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">美食标签：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${list.foodTag}" placeholder="" name="foodTag">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">美食价格：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${list.f_price}" placeholder="" name="f_price">
            </div>
        </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">所属商家：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" value="${list.s_id}" placeholder="" name="s_id">
        </div>
    </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <input type="submit" class="btn btn-primary radius" />
            </div>
        </div>
    </c:forEach>
</form>
</body>