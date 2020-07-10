<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path%>/static/css/login_main.css" rel="stylesheet">
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

  <div class="panel panel-default" id="login" style="width: 30%;margin-left: 30%;margin-top: 5%;margin-bottom:5%;text-align:center;
border:2px solid #a1a1a1;
padding:20px 40px;
width:40%;
border-radius:25px;">
    <div class="panel-heading" style="background-color: #fff">
        <em style="margin-left:-450px;font-size: 25px;font-family: 'Leelawadee UI Semilight';color: #8a6d3b;">Welcome to login</em>
    </div>
      <form class="form-signin" action="${pageContext.request.contextPath}/userLogin" method="post" id="myLoginForm">
           <label style="margin-left: -450px;margin-top:30px;font-size: 20px;color: blue;">Username</label>
          <input type="text" class="form-control" name="user_name" style="margin-left:13%;margin-right:20px;width: 500px;height: 40px;" placeholder="请输入用户名"/>
          <br>
          <label style="margin-left: -450px;font-size: 20px;color: orange;">Password</label>
          <input type="password" class="form-control" style="margin-left: 13%;margin-right:20px;width: 500px;height: 40px;"  name="user_password" placeholder="请输入密码"/>
          <%--隐藏域，获取用户的贴子ID--%>
          <input type="hidden" name="tipId" value=""/>
        <%--<div class="checkbox text-left"/>
            <label>
                <input type="checkbox" id="remember">记住密码</input>
            </label>
            <a style="margin-left: 30%" href="#">忘记密码?</a>--%>

        <p style="text-align: right;color: red;position: absolute" id="info">${msg}</p><br/>
        <input type="submit" class="btn btn-success btn-block" style="margin-left: 13%;margin-top:20px;width:500px;height: 40px;" value="登录"/>
        <a href="${pageContext.request.contextPath}/toRegis" class="btn btn-default btn-block" style="margin-left: 13%;margin-top: 30px;margin-bottom:60px;width:500px;height: 40px;">注册</a>
      </form>
  </div>

<script type="text/javascript" language="javascript">

</script>

</body>
</html>