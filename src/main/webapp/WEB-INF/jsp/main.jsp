<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="Content-Type"  tip_content="text/html;charset=utf-8">
    <meta name="keywords" tip_content="论坛">
    <title>论坛问答系统</title>
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
        .info {
            margin-right: 5%;
            width: 10%;
            float: left;
        }
        a{
            color: #8A8A8A;
            cursor: pointer;
        }
    </style>
</head>
<body>

<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

<div class="panel panel-default" id="main" style="width: 70%;margin:1% 2% 5% 5%;float: left;">
    <form role="form" method="post" action="${pageContext.request.contextPath}/sousuo" method="post">
        <div class="input-group col-md-3" style="margin-top:2px; float: left; text-align: center;">
            <%--首页的贴子搜索框--%>
            <input type="text" class="form-control" id="keyword" name="keyword" placeholder="请输入要搜索的关键词" />
            <span class="input-group-btn">
            <button  type="submit" class="btn btn-info btn-search">搜索</button>
        </span>
        </div>
    </form>

    <div class="panel-heading" style="background-color: white">
        <a style="margin-left: 2%">活跃</a>
        <a style="margin-left: 2%">精华</a>
        <a style="margin-left: 2%">最近</a>
    </div>


    <ul class="list-group" style="width: 100%">
        <c:forEach items="${list}" var="i">
            <c:if test="${i.forum.forum_isDeleted==0 && i.tab.tab_isDeleted==0 && i.tip_isDeleted==0}">
                <li class="list-group-item">
                    <div style="height: 50px">
                        <div style="width: 89%;float: left">
                                <%--这里显示贴子标题，点击贴子跳转到贴子详情，需要传参贴子id--%>
                            <a href="${pageContext.request.contextPath}/click/${i.tip_id}">${i.tip_title}</a>&nbsp;
                                <%--显示贴子的状态     结贴&置顶--%>
                            <c:if test="${i.tip_isKnot==1}">
                                <span class="label label-success" >结贴</span>
                            </c:if>
                            <c:if test="${i.tip_isTop==1}">
                                <span class="label label-danger" >置顶</span>
                            </c:if>
                            <br>
                            <div>
                                    <%--显示贴子对应的版块--%>

                                <a><span class="label label-primary">${i.forum.forum_name}</span></a>

                                    <%--显示贴子对应的分类--%>
                                <a><span class="label label-warning" >${i.tab.tab_name}</span></a>
                                &nbsp;&nbsp;&nbsp;
                                    <%--点击用户跳转到用户信息页面，需要传参用户id--%>
                                <a href="#">
                            <span>
                                <strong>
                                        ${i.user.user_nick}
                                </strong>
                            </span>
                                </a>
                                &nbsp;&nbsp;&nbsp;
                                    <%--显示贴子发表时间--%>
                                <small class="text-muted" >
                                    发表时间：<fmt:formatDate value="${i.tip_publishTime}" type="both"/>&nbsp;
                                    &nbsp;更新时间：<fmt:formatDate value="${i.tip_modifyTime}" type="both"/>
                                    <span class="label label-warning" title="点击量">${i.tip_click}次点击</span>
                                </small>
                            </div>
                        </div>
                        <div style="width: 5%;float: right;text-align: center">
                    <span class="label label-info" title="回复数">
                        <%--这里显示贴子回复量--%>
                        ${i.tip_replies}条回复
                    </span>
                        </div>
                    </div>
                </li>
            </c:if>
        </c:forEach>

    </ul>
</div>

<!-- 引入侧边栏文件 -->
<%@ include file="side.jsp"%>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>
</body>
<script src="/static/js/jquery-3.2.1.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script>

</script>
</html>