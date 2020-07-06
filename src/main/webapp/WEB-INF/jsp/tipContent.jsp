<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
    <title>贴子标题 - 论坛 </title>
</head>
<body>
<%--这是进入贴子查看内容的页面--%>

<%--弹出结果--%>

<!-- 引入header文件 -->
<%@ include file="header.jsp" %>

<div style="width: 70%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <div>
                <div class="panel-heading" style="background-color: white">
                    <a href="<%=basePath%>">XX论坛</a> › <a href="#">贴子标题</a>
                </div>
                <%--贴子标题--%>
                <h3>
                    测试发帖
                    <div style="float: right">
                        <%--判断是否是发帖人--%>
                        <%--仅发贴人可以结贴、修改--%>
                        <input type="button" class="btn btn-primary" value="结贴"/>
                        <%--发贴人修改贴子有不同的Controller--%>
                        <input type="button" class="btn btn-warning" value="修改"/>
                    </div>
                </h3>

                <%--是否结贴：${tip.tip_isKnot}...贴子发表人：${tip.user_id}...当前登录用户：${USER.user_id}...--%>
                <%--贴子发表人 == 当前登录用户：${tip.user_id == USER.user_id}--%>
                <span class="label label-info" title="回复数">1条回复</span>
                &nbsp;
                <span class="label label-warning" title="点击量">2次点击</span>
                <div>
                    <%--显示发贴人昵称--%>
                    <a href="">
                        <span>
                        <strong>
                            yukong
                        </strong>
                        <%--展示用户权限  判断--%>
                        <span class="label label-success">超级管理员</span>
                        <span class="label label-warning">管理员</span>
                        <span class="label label-default">普通用户</span>
                        </span>
                    </a>
                </div>
                <div>
                    <span>
                    <small class="text-muted">发表于：2020-07-03</small>
                    <br>
                    <small class="text-muted">更新于：2020-07-03</small>
                </span>
                </div>
            </div>
        </div>
        <%--这里显示贴子正文--%>
        <ul class="list-group" style="width: 100%">
            <li class="list-group-item">
               测试
            </li>
        </ul>
    </div>

    <%--这里显示贴子的回复--%>
    <ul class="list-group" style="width: 100%">
        <%--遍历并显示回复--%>
            <li class="list-group-item">
                <div style="height: auto; ">
                    <div>
                        <a href="">
                            <strong>
                                <%--显示发表回复的用户昵称--%>
                                yukong
                            </strong>
                            <%--展示用户权限--%>
                            <span class="label label-success">超级管理员</span>
                            <span class="label label-warning">管理员</span>
                            <span class="label label-default">普通用户</span>
                        </a>
                        <%--发表回复的用户如果是楼主则显示楼主标签 2020-03-14 23:36--%>
                        <span class="label label-info">楼主</span>
                        &nbsp;
                        <small class="text-muted">发表于：
                            <%--显示回复发表的时间--%>
                            2020-07-03 12:06
                        </small>
                    </div>
                    <div style="height: 80px; overflow:auto; word-wrap:break-word;">
                        <%--这里显示回复的正文--%>
                        hello
                    </div>
                </div>
            </li>
    </ul>

    <div class="panel panel-default" style="">
        <div class="panel-heading" style="background-color: white">回复本贴</div>
        <div class="panel-body">
            <div class="form-group">
                <%--非删除或结贴的贴子才能回复--%>
                    <p style="color: red">已结贴！不允许回复。</p>
                    <%--被锁定的用户不能回贴--%>
                    <p style="color: red">您的账号已被锁定，不能回贴，请联系管理员解锁。</p>
                    <%--这里是发表回复的表单--%>
                    <form action="" method="post" id="myReplyForm">
                        <%--隐藏域获取贴子ID--%>
                        <input type="hidden" name="tip_id" value="">
                        <%--这里显示输入回复内容的文本框--%>
                        <textarea class="form-control" rows="3" name="reply_content" id="reply_content" required></textarea>
                        <br/>
                        <input type="button" class="btn btn-success btn-sm" value="发表"/>
                    </form>
                    <%--如果用户没有登录则取消文本框--%>
                    <input type="button" class="btn btn-warning btn-sm" value="请先登录"/>
            </div>
        </div>
    </div>
</div>
<!-- 引入侧边栏文件 -->
<%@ include file="side.jsp" %>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp" %>

<script>

</script>

</body>
</html>