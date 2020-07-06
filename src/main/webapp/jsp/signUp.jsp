<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户注册</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
    <style>
        li {
            list-style-type: none;
        }

        html, body {
            height: 100%;
            font-size: 14px;
            color: #525252;
            font-family: NotoSansHans-Regular, AvenirNext-Regular, arial, Hiragino Sans GB, "Microsoft Yahei", "Hiragino Sans GB", "WenQuanYi Micro Hei", sans-serif;
            background: #f0f2f5;
        }

        .footer {
            background-color: #fff;
            margin-top: 22px;
            margin-bottom: 22px;
            width: 100%;
            padding-top: 22px;
            color: #8A8A8A;
            display: block;
            height: 200px;
            border: 1px;
            clear: both
        }

        .container {
            margin-right: 5%;
            margin-left: 5%;
            padding-left: 15px;
            padding-right: 15px;
            width: 40%;
            float: left;
        }

        .info {
            margin-right: 5%;
            width: 10%;
            float: left;
        }

        a {
            color: #8A8A8A;
            cursor: pointer;
        }
    </style>
</head>
<body>



<%--引入header导航栏--%>
<%@ include file="header.jsp" %>

<div class="panel panel-default" id="login" style="width: 80%;margin-left: 10%;margin-top: 5%;margin-bottom: 5%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">注册</h3>
    </div>
    <div class="panel-body">
        <form action="" method="POST" id="mySignUpForm" class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-6" style="width: 40%;">
                    <span style="color:red">*必填，用于登录，注册后不可修改。</span>
                    <input type="text" class="form-control" id="user_name" name="user_name"
                           required/>
                    <span id="userNameErr" style="color:red"></span>
                </div>
                <div class="col-sm-4">
                    <p class="form-control-static">用户名：</p>
                    <p class="form-control-static">（1）不超过13位字符（含）</p>
                    <p class="form-control-static">（2）第一位必须为字母，其余可以是字母、数字、下划线</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">昵称</label>
                <div class="col-sm-6" style="width: 40%;">
                    <input type="text" class="form-control" id="user_nick" name="user_nick"/>
                    <span id="userNickErr" style="color:red"></span>
                </div>
                <div class="col-sm-4">
                    <p class="form-control-static">昵称可不填，注册后可修改。</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">密码</label>
                <div class="col-sm-6" style="width: 40%;">
                    <span style="color:red">*必填，用于登录</span>
                    <input type="password" class="form-control" id="user_password" name="user_password"
                           required/>
                    <span id="userPwdErr" style="color:red"></span>
                </div>
                <div class="col-sm-4">
                    <p class="form-control-static">密码至少6位字符，可以是字母、数字、下划线</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">注册用户类型：</label>
                <div class="col-sm-10" style="width: 20%">
                    <select class="form-control" id="user_type" name="user_type">
                        <!-- 超级管理员可以注册管理员 -->
                        <option value="1" selected>管理员</option>
                        <!-- 超级管理员没有登录 -->
                        <option value="2">普通用户</option>
                        <option value="2" selected>普通用户</option>
                    </select>
                </div>
            </div>

            <input type="button" class="btn btn-default" value="返回"
                   style="margin-left: 5%"/>
            <input type="button" class="btn btn-success" value="登录"
                   style="margin-left: 25%"/>
            <input type="submit" class="btn btn-primary" value="注册"
                   style="margin-left: 5%"/>

        </form>

    </div>
</div>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp" %>

<script>

</script>
</body>
</html>