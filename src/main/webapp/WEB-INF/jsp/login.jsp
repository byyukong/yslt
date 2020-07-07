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
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

  <div class="panel panel-default" id="login" style="width: 20%;margin-left: 40%;margin-top: 5%;margin-bottom: 5%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">欢迎登录</h3>
    </div>
      <form class="form-signin" action="/userLogin" method="post" id="myLoginForm">
          <label>用户名</label>
          <input type="text" class="form-control" name="user_name" placeholder="请输入用户名"/>
          <br>
          <label>密码</label>
          <input type="password" class="form-control" name="user_password" placeholder="请输入密码"/>
          <%--隐藏域，获取用户的贴子ID--%>
          <input type="hidden" name="tipId" value=""/>
        <%--<div class="checkbox text-left"/>
            <label>
                <input type="checkbox" id="remember">记住密码</input>
            </label>
            <a style="margin-left: 30%" href="#">忘记密码?</a>--%>

        <p style="text-align: right;color: red;position: absolute" id="info">${msg}</p><br/>
        <input type="submit" class="btn btn-success btn-block" value="登录"/>
        <a href="#" class="btn btn-default btn-block">注册</a>
      </form>
  </div>

<script type="text/javascript" language="javascript">

</script>

</body>
</html>