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
    <center>
        <div class="panel panel-default" id="main" style="border:2px solid #a1a1a1;padding:20px 40px;width:60%;border-radius:25px;">
            <div class="panel-heading" style="background-color: white">
                <a href="<%=basePath%>">论坛</a> › 修改用户信息 ›${user.user_nick}
            </div>

            <div class="panel-body">

                <form <%--action="${pageContext.request.contextPath}/update_userInfo/${user.user_id}"--%> id="myUpdateForm" method="POST" class="form-horizontal" role="form">
                    <div class="form-group">
                        <%--<label class="col-sm-2 control-label">ID</label>
                        <div class="col-sm-5">
                            <p class="form-control-static">${user.user_id}</p>
                        </div>--%>
                        <%--隐藏用户ID的修改--%>
                        <div class="col-sm-5">
                            <input id="user_id" type="text" name="user_id" value="${user.user_id}" readonly hidden/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-5">
                            <p class="form-control-static">${user.user_name}</p>
                        </div>
                        <div class="col-sm-5">
                            <p class="form-control-static">${user.user_name}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-5">
                            <p class="form-control-static"></p>
                        </div>
                        <div class="col-sm-5">
                            如需修改请输入新密码：<br><input id="password" type="password" required name="user_password" value="${user.user_password}" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">昵称</label>
                        <div class="col-sm-5">
                            <p class="form-control-static">${user.user_nick}</p>
                        </div>
                        <div class="col-sm-5">
                            新昵称：<br><input id="user_nick" type="text" required name="user_nick" value="${user.user_nick}" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户状态</label>
                        <div class="col-sm-5">
                            <p class="form-control-static">
                                <%--判断用户状态--%>
                                <c:choose>
                                    <c:when test="${user.user_status==0}">
                                        正常
                                    </c:when>
                                    <c:when test="${user.user_status==1}">
                                        禁用
                                    </c:when>
                                    <c:when test="${user.user_status==2}">
                                        锁定
                                    </c:when>
                                </c:choose>
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
                                <c:choose>
                                    <c:when test="${user.user_type==0}">
                                        超级管理员
                                    </c:when>
                                    <c:when test="${user.user_type==1}">
                                        管理员
                                    </c:when>
                                    <c:when test="${user.user_type==2}">
                                        普通用户
                                    </c:when>
                                </c:choose>
                            </p>
                        </div>
                        <%--隐藏用户权限的修改--%>
                        <%--【DEBUG】如果DAO中对user_type也赋值修改，这里也要设置隐藏输入框，否则默认设置为0--%>
                        <div>
                            <input type="text"  name="user_type" value="0" required hidden/>
                        </div>
                    </div>

                    <input id="btnSub" class="btn btn-warning" type="button" value="修改">
                    <input class="btn btn-default" type="reset" value="重填">
                    <a href="${pageContext.request.contextPath}/" class="btn btn-default"
                       style="margin-left: 10%">返回</a>
                </form>
            </div>
        </div>
    </center>
</div>

<!-- 引入侧边栏文件 -->
<%@ include file="side.jsp"%>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>

<script>
    $("#btnSub").click(function () {
        var user_nick=$("#user_nick").val();
        var password=$("#password").val();
        if (user_nick!="" && password!=""){
            var id=$("#user_id").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/update_userInfo/"+id,
                type:"post",
                data:$("form").serialize(),
                success:function (result) {
                    if (result=="0") {
                        alert("修改成功！")
                        location.href="${pageContext.request.contextPath}/toUpdate_userInfo/"+id;
                    }else{
                        alert("修改失败！")
                    }
                },
                error:function () {
                    alert("服务器错误！")
                }
            })
        }else{
            alert("密码或昵称不能为空！")
        }

    })
</script>

</body>
</html>