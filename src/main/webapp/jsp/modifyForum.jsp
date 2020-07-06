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
    <title>论坛 › 修改版块信息</title>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

<div style="width: 50%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <a href="<%=basePath%>">论坛</a> › 修改版块信息 › 默认
        </div>

        <div class="panel-body">
            <form  action="modifyForumInfo.do" id="myForumUpdateForm" method="POST" class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-sm-2 control-label">版块ID</label>
                    <div class="col-sm-5">
                        <p class="form-control-static">版块ID</p>
                    </div>
                    <div class="col-sm-5">
                        <input type="text"  name="forum_id" value="版块ID" readonly />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">版块名</label>
                    <div class="col-sm-5">
                        <p class="form-control-static">默认</p>
                    </div>
                    <div class="col-sm-5">
                        修改版块名：<br>
                        <input type="text"  name="forum_name" value="默认" required />
                    </div>
                </div>
                <input class="btn btn-warning" type="button" value="修改"/>
                <input class="btn btn-default" type="reset" value="重填"/>
                <input type="button" class="btn btn-default" value="返回"/>
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