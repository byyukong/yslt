<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户管理 - 论坛</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
    <style>
        li {list-style-type:none;}
        html, body {
            height: 100%;
            font-size: 14px;
            color: #525252;
            font-family: NotoSansHans-Regular,AvenirNext-Regular,arial,Hiragino Sans GB,"Microsoft Yahei","Hiragino Sans GB","WenQuanYi Micro Hei",sans-serif;
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
            border: 1px ;
            clear:both
        }

        .container {
            margin-right: 5%;
            margin-left: 5%;
            padding-left: 15px;
            padding-right: 15px;
            width: 40%;
            float: left;
        }
        a{
            color: #8A8A8A;
            cursor: pointer;
        }

        th {
            text-align:center; /*设置水平居中*/
            /* vertical-align:middle; */ /*设置垂直居中*/
        }
        td {
            text-align:center; /*设置水平居中*/
            /* vertical-align:middle; */ /*设置垂直居中*/
            /* border: 1px solid gray; */
        }
    </style>
</head>
<body>

<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

<div class="panel panel-default"
     style="width: 90%;margin-left: 5%; margin-right: 5%; margin-bottom: 5%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">用户管理</h3>
    </div>
    <div class="panel-body">
        <!-- 这里显示所有用户信息 -->
        <table class="table">
            <thead>
            <tr>
                <th>用户ID</th>
                <th>用户名</th>
                <th>用户昵称</th>
                <%--不显示用户密码 2020-03-04 11:02--%>
                <%--<th>用户密码</th>--%>
                <th>用户权限</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <!-- 这里是表格内容，需要遍历数组 -->
            <tr>
                <td>1</td>
                <td>yukong</td>
                <td>yusheng</td>
                <%--不显示用户密码 2020-03-04 11:02--%>
                <%--<td>${user.user_password}</td>--%>
                <td>
                    <span class="label label-success">超级管理员</span>
                    <span class="label label-warning">管理员</span>
                    <span class="label label-primary">普通用户</span>
                <td>
                    <span class="label label-danger">禁用</span>
                    <span class="label label-warning">锁定</span>
                </td>
                <td><!-- 这里放操作按钮 -->
                    <%--处理其它正常的用户：管理员不能处理自己的状态--%>
                    <%--管理员不能处理其它管理员--%>
                    <%--管理员可处理普通用户--%>
                    <input type="button" class="btn btn-primary" value="修改"/>
                    <input type="button" class="btn btn-warning" value="锁定"/>
                    <input type="button" class="btn btn-danger" value="禁用"/>
                    <input type="button" class="btn btn-success" value="解锁"/>
                    <input type="button" class="btn btn-success" value="启用"/>
                    <!-- 如果对方是超级管理员 无操作 -->
                </td>
            </tr>
            </tbody>
        </table>
        <input type="button" class="btn btn-default" value="返回"/>
    </div>
</div>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>

</body>
</html>