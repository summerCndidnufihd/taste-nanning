<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
  <script type="text/javascript" src="../lib/html5shiv.js"></script>
  <script type="text/javascript" src="../lib/respond.min.js"></script>
  <![endif]-->
  <link href="../nanningTaste_war/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
  <link href="../nanningTaste_war/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
  <link href="../nanningTaste_war/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
  <link href="../nanningTaste_war/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
  <!--[if IE 6]>
  <script type="text/javascript" src="../nanningTaste_war/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<![endif]-->
<title>食味南宁后台登录</title>
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
<div class="loginB">
  <div id="loginform" class="loginBox">
  <div id="loginname" class="loginname">食味南宁后台管理系统</div>
    <form class="form form-horizontal" action="${pageContext.request.contextPath}/api/user/login" method="post">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="userName" name="userName" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="userPwd" name="userPwd" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <label for="online">
            <input type="checkbox" name="online" id="online" value="">
            使我保持登录状态</label>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <button type="submit" class="btn btn-success radius size-L">&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;</button>
          <button type="reset" class="btn btn-default radius size-L">&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;</button>
        </div>
      </div>
    </form>
  </div>
</div>
</div>
<div class="footer">ADC Team</div>
<script type="text/javascript" src="../nanningTaste_war/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../nanningTaste_war/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript">
    <%--function login(){--%>
        <%--var username = $.trim($("#userName").val());--%>
        <%--var password = $.trim($("#userPwd").val());--%>
        <%--if(username == ""){--%>
            <%--alert("请输入用户名");--%>
            <%--return false;--%>
        <%--}else if(password == ""){--%>
            <%--alert("请输入密码");--%>
            <%--return false;--%>
        <%--}--%>
        <%--//ajax去服务器端校验--%>
        <%--var data= {userName:username,userPwd:password};--%>

        <%--$.ajax({--%>
            <%--type:"GET",--%>
            <%--url:'${pageContext.request.contextPath}/api/user/login',--%>
            <%--data:data,--%>
            <%--dataType:'json',--%>
            <%--success:function(data){--%>
                <%--//alert(msg);--%>
                <%--if(data==null){--%>
                    <%--alert("没有这个用户！");--%>
                <%--}--%>
                <%--else{--%>
                    <%--alert("登录成功");--%>
                    <%--window.location.href="${pageContext.request.contextPath}/api/other/toIndex";--%>
                <%--}--%>
            <%--}--%>
        <%--});--%>
    <%--}--%>
</script>
<!--/此乃百度统计代码，请自行删除
</body>
</html>