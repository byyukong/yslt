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
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
    <title>论坛 › 发表新贴 </title>
</head>
<body>

<!-- 发贴后弹出结果 -->

<!-- 引入header文件 -->
<%@ include file="header.jsp" %>

<div style="width: 70%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <a href="<%=basePath%>">论坛</a> › <a href="">发表新贴</a>
        </div>

        <div class="panel-body">
            <form action="${pageContext.request.contextPath}/addTip" method="POST" id="myNewTipForm">
                <div class="form-group">
                    <label for="tip_title">标题</label>
                    <input type="text" class="form-control" id="tip_title" name="tip_title" placeholder="请输入标题"
                           required/>
                </div>

                <div class="form-group">
                    <label for="tip_content">正文</label>
                    <textarea class="form-control" rows="10" id="tip_content" name="tip_content" required></textarea>
                </div>

                <div class="form-group">
                    <div class="col-sm-6" style="width: 20%">
                        所属版块：
                    <select class="form-control" id="selectForum" name="forum_id">
                        <c:forEach items="${forum}" var="i">
                            <option value="${i.forum_id}">${i.forum_name}</option>
                        </c:forEach>
                    </select>
                    </div>
                    <div class="col-sm-6" style="width: 20%">
                        分类：
                    <select class="form-control" id="selectTab" name="tab_id">
                        <c:forEach items="${tab}" var="i">
                            <option value="${i.tab_id}">${i.tab_name}</option>
                        </c:forEach>
                    </select>
                    </div>
                </div>

                <br><br><br><br>

                <input type="submit" value="发布" class="btn btn-success btn-sm"/>
                <a href="${pageContext.request.contextPath}/main" class="btn btn-default">返回</a>

            </form>
        </div>
    </div>
</div>

<%@ include file="side.jsp" %>
<%--<div class="panel panel-default" id="sidebar2" style="width: 20%;margin:1% 2% 1% 0%;float: right">
    <div class="panel-heading" style="background-color: white;text-align: center">
        tips1
    </div>
    <ul class="list-group" style="width: 100%">
        <li class="list-group-item">
            <h5>标题</h5>
            <p>
                （待补充）
            </p>
        </li>

        <li class="list-group-item">
            <h5>正文</h5>
            <p>
                （待补充）
            </p>
        </li>
    </ul>
</div>--%>


<%--<div class="panel panel-default" id="sidebar1" style="width: 20%;margin:1% 2% 1% 0%;float: right">
    <div class="panel-heading" style="background-color: white;text-align: center">
        tips2
    </div>
    <ul class="list-group" style="width: 100%">
        <li class="list-group-item">
            <h5>待补充</h5>
            <p>
                （待补充）
            </p>
        </li>

        <li class="list-group-item">
            <h5>待补充</h5>
            <p>
                （待补充）
            </p>
        </li>
    </ul>
</div>--%>


<!-- 引入footer文件 -->
<%@ include file="footer.jsp" %>

<script>

</script>

</body>
</html>