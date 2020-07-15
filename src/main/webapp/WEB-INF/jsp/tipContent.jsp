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
                    <a href="<%=basePath%>">XX论坛</a> › <a href="#">${tip.tip_title}</a>
                </div>
                <%--贴子标题--%>
                <h3>
                    ${tip.tip_title}
                    <div style="float: right">
                        <%--判断是否是发帖人--%>
                        <%--仅发贴人可以结贴、修改--%>
                            <c:if test="${tip.user.user_id eq sessionScope.user.user_id && tip.tip_isKnot==0}">
                        <input type="button" class="btn btn-primary jietie" value="结贴"/>
                        <%--发贴人修改贴子有不同的Controller--%>
                                <a href="${pageContext.request.contextPath}/modify/${tip.tip_id}" class="btn btn-warning xiugai">修改</a>
                            </c:if>
                    </div>
                </h3>

                <%--是否结贴：${tip.tip_isKnot}...贴子发表人：${tip.user_id}...当前登录用户：${USER.user_id}...--%>
                <%--贴子发表人 == 当前登录用户：${tip.user_id == USER.user_id}--%>
                <span class="label label-info" title="回复数">${tip.tip_replies}条回复</span>
                &nbsp;
                <span class="label label-warning" title="点击量">${tip.tip_click}次点击</span>
                <div>
                    <%--显示发贴人昵称--%>
                    <a href="">
                        <span>
                        <strong>
                            ${tip.user.user_nick}
                        </strong>
                        <%--展示用户权限  判断--%>
                        <c:choose>
                            <c:when test="${tip.user.user_type==0}">
                                <span class="label label-success">超级管理员</span>
                            </c:when>
                            <c:when test="${tip.user.user_type==1}">
                                <span class="label label-warning">管理员</span>
                            </c:when>
                            <c:when test="${tip.user.user_type==2}">
                                <span class="label label-default">普通用户</span>
                            </c:when>
                        </c:choose>
                        </span>
                    </a>
                </div>
                <div>
                    <span>
                    <small class="text-muted">发表于：<fmt:formatDate value="${tip.tip_publishTime}" type="both"/></small>
                    <br>
                    <small class="text-muted">更新于：<fmt:formatDate value="${tip.tip_modifyTime}" type="both"/></small>
                </span>
                </div>
            </div>
        </div>
        <%--这里显示贴子正文--%>
        <ul class="list-group" style="width: 100%">
            <li class="list-group-item">
              ${tip.tip_content}
            </li>
        </ul>
    </div>

    <%--这里显示贴子的回复--%>
    <ul class="list-group" style="width: 100%">
        <%--遍历并显示回复--%>
        <c:forEach items="${replyList}" var="i">
            <li class="list-group-item">
                <div style="height: auto; ">
                    <div>
                        <a href="">
                            <strong>
                                <%--显示发表回复的用户昵称--%>
                                ${i.user.user_nick}
                            </strong>
                            <%--展示用户权限--%>
                            <c:choose>
                                <c:when test="${i.user.user_type==0}">
                                    <span class="label label-success">超级管理员</span>
                                </c:when>

                                <c:when test="${i.user.user_type==1}">
                                    <span class="label label-warning">管理员</span>
                                </c:when>
                                <c:when test="${i.user.user_type==2}">
                                    <span class="label label-default">普通用户</span>
                                </c:when>
                            </c:choose>
                        </a>
                        <%--发表回复的用户如果是楼主则显示楼主标签 2020-03-14 23:36--%>
                        <c:if test="${tip.user.user_id eq i.user.user_id}">

                            <span class="label label-info">楼主</span>
                        </c:if>

                        &nbsp;
                        <small class="text-muted">发表于：
                            <%--显示回复发表的时间--%>
                            <fmt:formatDate value="${i.reply_publishTime}" type="both"/>&nbsp;
                        </small>
                    </div>
                    <div style="height: 80px; overflow:auto; word-wrap:break-word;">
                        <%--这里显示回复的正文--%>
                       <xmp>${i.reply_content}</xmp>
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>

    <div class="panel panel-default" style="">
        <div class="panel-heading" style="background-color: white">回复本贴</div>
        <div class="panel-body">
            <div class="form-group">
                <%--非删除或结贴的贴子才能回复--%>
                <c:if test="${tip.tip_isKnot==1 && not empty sessionScope.user}">
                    <p style="color: red">已结贴！不允许回复。</p>
                 </c:if>
                    <%--被锁定的用户不能回贴--%>
                    <c:if test="${sessionScope.user.user_status==2}">
                    <p style="color: red">您的账号已被锁定，不能回贴，请联系管理员解锁。</p>
                    </c:if>
                    <%--这里是发表回复的表单--%>
                    <c:if test="${tip.tip_isKnot==1 && not empty sessionScope.user || sessionScope.user.user_status==2 && not empty sessionScope.user}">
                        <form action="" method="post" id="myReplyForm">
                            <%--隐藏域获取贴子ID--%>
                            <input type="hidden" name="tip_id" value="" >
                            <%--这里显示输入回复内容的文本框--%>
                            <textarea class="form-control" rows="3" name="reply_content" id="reply_content" required disabled="disabled"></textarea>
                            <br/>
                            <input type="button" class="btn btn-success btn-sm" disabled="disabled" value="发表"/>
                        </form>
                    </c:if>
                    <c:if test="${tip.tip_isKnot!=1 &&  sessionScope.user.user_status!=2 && not empty sessionScope.user}">
                    <form action="" method="post" id="myReplyForm">
                        <%--隐藏域获取贴子ID--%>
                        <input type="hidden" name="tip_id" value="" >
                        <%--这里显示输入回复内容的文本框--%>
                        <textarea class="form-control" rows="3" name="reply_content" id="reply_content" required ></textarea>
                        <br/>
                        <input type="button" class="btn btn-success btn-sm" id="fabu" value="发表"/>
                    </form>
                    </c:if>
                    <%--如果用户没有登录则取消文本框--%>
                    <c:if test="${ empty sessionScope.user }">
                    <input type="button" id="denglu" class="btn btn-warning btn-sm" value="请先登录"/>
                    </c:if>
            </div>
        </div>
    </div>
    <!--显示分页信息-->
    <div class="row">
        <!--分页文字信息-->
        <div class="col-md-6" id="page_info_area">

        </div>
        <!--分页条信息  组件 分页-->
        <div class="col-md-6" id="page_nav_area">



        </div>
    </div>
</div>
<!-- 引入侧边栏文件 -->
<%@ include file="side.jsp" %>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp" %>

<script>
    $(".jietie").click(function () {
       if(confirm("确认结贴?,结贴后无法回复。")){
           $.ajax({
               url:"${pageContext.request.contextPath}/jietie",
               type:"get",
               data:{"tip_id":"${tip.tip_id}","tip_isKnot":"1"},
               success:function (result) {
                        if(result>0){
                            alert("结贴成功")
                            location.href="${pageContext.request.contextPath}/click/"+${tip.tip_id};
                        }else {
                            alert("结贴失败")
                        }
               }
           })
       }
    })
    //$(document).on("click","#fabu",function () {
    $("#fabu").click(function () {
       var bodys=$('#reply_content').val();
        $.ajax({
            url:"${pageContext.request.contextPath}/pinglun",
            type:"GET",
            data:{"user_id":"${sessionScope.user.user_id}","tip_id":"${tip.tip_id}","reply_content":bodys},
            success:function (result) {
                    location.href="${pageContext.request.contextPath}/click/"+${tip.tip_id};
            },
            error:function () {
               alert("发送错误")
            }
        });
    });
    $(document).on("click","#denglu",function () {
        // $(location).attr('href', 'login.jsp');
        window.location = "/toLogin.jsp";
    })
    //构建分页信息
    function build_page_info(result) {

        //在每次点击页码发送请求之前需要清空分页信息,不然数据会一直追加
        $("#page_info_area").empty();

        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
            result.extend.pageInfo.pages+"页,总"+
            result.extend.pageInfo.total+"条记录");
        totalRecord=result.extend.pageInfo.total;
        currentPage=result.extend.pageInfo.pageNum;
    }
</script>

</body>
</html>