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
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
    <title>论坛 ›修改用户信息</title>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

<div style="width: 70%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <a href="<%=basePath%>">论坛</a> › 修改用户信息 ›用户名
        </div>

        <div class="panel-body">

            <form  action="updateUserInfo.do" id="myUpdateForm" method="POST" class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-sm-2 control-label">ID</label>
                    <div class="col-sm-5">
                        <p class="form-control-static">1</p>
                    </div>
                    <%--隐藏用户ID的修改--%>
                    <div class="col-sm-5">
                        <input type="text"  name="user_id" value="1" readonly hidden/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-5">
                        <p class="form-control-static">yukong</p>
                    </div>
                    <div class="col-sm-5">
                        <input type="text"  name="user_name" value="yukong" readonly />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-5">
                        <p class="form-control-static"></p>
                    </div>
                    <div class="col-sm-5">
                        如需修改请输入新密码：<br><input type="password"  name="user_password" value="123456" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">昵称</label>
                    <div class="col-sm-5">
                        <p class="form-control-static">admin</p>
                    </div>
                    <div class="col-sm-5">
                        新昵称：<br><input type="text"  name="user_nick" value="admin" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">用户状态</label>
                    <div class="col-sm-5">
                        <p class="form-control-static">
                            <%--判断用户状态--%>
                            禁用
                            锁定
                            正常
                        </p>
                    </div>
                    <%--隐藏用户状态的修改--%>
                    <div>
                        <input type="text"  name="user_status" value="1" required hidden/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">用户权限</label>
                    <div class="col-sm-5">
                        <p class="form-control-static">
                            <%--判断显示用户权限--%>
                            超级管
                            理员管理员
                            普通用户
                        </p>
                    </div>
                    <%--隐藏用户权限的修改--%>
                    <%--【DEBUG】如果DAO中对user_type也赋值修改，这里也要设置隐藏输入框，否则默认设置为0--%>
                    <div>
                        <input type="text"  name="user_type" value="0" required hidden/>
                    </div>
                </div>

                <input class="btn btn-warning" type="button" value="修改" onclick="update_confirm()">
                <input class="btn btn-default" type="reset" value="重填">
                <input type="button" class="btn btn-default" value="返回"
                       style="margin-left: 10%"/>
            </form>
        </div>
    </div>
</div>

<!-- 引入侧边栏文件 -->
<%@ include file="side.jsp"%>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>

<script>

</script>

</body>
</html>