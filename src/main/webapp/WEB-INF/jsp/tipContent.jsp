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
    <style >
        .blue{
            color: deeppink;
        }
        .showtext {
            width: 100%;
            height: 100%;
            resize: none;
        }
        .replyto{
            display: none;
        }
    </style>
    <title>贴子详细信息 - 论坛 </title>
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
                    <a href="<%=basePath%>">论坛</a> › <a href="#">${tip.tip_title}</a>
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
                <span class="label label-info" title="回复数">${tiphf}条回复</span>
                &nbsp;
                <span class="label label-warning" title="点击量">${tip.tip_click}次点击</span>
                <div>
                    <%--显示发贴人昵称--%>
                    <a href="${pageContext.request.contextPath}/toUpdate_userInfo/${sessionScope.user.user_id}">
                        <span>
                        <strong>
                            ${tip.user.user_nick}
                        </strong>
                        <%--展示用户权限  判断--%>
                        </span>
                    </a>
                        <%--<c:if test="${tip.user.is_Vip==1}">
                            <span class="label label-danger" >VIP</span>
                        </c:if>--%>
                        <c:choose>
                            <c:when test="${tip.user.user_type==0}">
                                <span class="label label-success">超级管理员</span>
                            </c:when>
                            <c:when test="${tip.user.user_type==1}">
                                <span class="label label-warning">管理员</span>
                            </c:when>
                            <c:when test="${tip.user.user_type==2 && tip.user.is_Vip==1}">
                                <span class="label label-danger" >VIP</span>
                            </c:when>
                            <c:when test="${tip.user.user_type==2}">
                                <span class="label label-default">普通用户</span>
                            </c:when>
                        </c:choose>
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
    <c:set var="hf" value="false"/>
    <%--这里显示贴子的回复--%>
    <ul class="list-group" style="width: 100%">
        <%--遍历并显示回复--%>
        <c:forEach items="${page.list}" var="i">
            <li class="list-group-item">
                <c:set var="hf" value="true"/>
                <div style="height: auto; ">
                    <div>
                        <c:choose>
                            <c:when test="${fn:contains(i.user.head_portrait,'http')}">
                                <img src="${i.user.head_portrait}" class="round_icon" />&nbsp;
                            </c:when>
                            <c:otherwise>
                                <img src="<%=path%>/static/img/${i.user.head_portrait}" class="round_icon" />&nbsp;
                            </c:otherwise>
                        </c:choose>
                        <%--<img src="<%=path%>/static/img/${i.user.head_portrait}" class="round_icon" />--%>&nbsp;
                        <%--<a href="">
                            <strong>
                                &lt;%&ndash;显示发表回复的用户昵称&ndash;%&gt;
                                ${i.user.user_nick}
                            </strong>
                            &lt;%&ndash;展示用户权限&ndash;%&gt;
                        </a>--%>
                        <c:choose>
                            <c:when test="${i.user.user_id==sessionScope.user.user_id}">
                                <a href="${pageContext.request.contextPath}/toUpdate_userInfo/${i.user.user_id}"><span><strong>${i.user.user_nick}</strong></span></a>
                            </c:when>
                            <c:otherwise>
                                <a href="#"><span><strong>${i.user.user_nick}</strong></span></a>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <%--<c:when test="${i.user.user_type==0}">
                                <span class="label label-success">超级管理员</span>
                            </c:when>

                            <c:when test="${i.user.user_type==1}">
                                <span class="label label-warning">管理员</span>
                            </c:when>--%>

                            <%--<c:when test="${i.user.user_type==0 && i.user.is_Vip==1}">
                                <span class="label label-danger" >超级VIP</span>
                            </c:when>--%>
                            <c:when test="${i.user.user_type==0}">
                                <%--展示用户权限--%>
                                <span class="label label-success">超级管理员</span>
                            </c:when>


                            <%--<c:when test="${i.user.user_type==1 && i.user.is_Vip==1}">
                                <span class="label label-danger" >VIP</span>
                            </c:when>--%>
                            <c:when test="${i.user.user_type==1}">
                                <span class="label label-warning">管理员</span>
                            </c:when>


                            <%--<c:when test="${i.user.user_type==2}">
                                <span class="label label-default">普通用户</span>
                            </c:when>--%>
                            <c:when test="${i.user.user_type==2 && i.user.is_Vip==1}">
                                <span class="label label-danger" >VIP</span>
                            </c:when>
                            <c:when test="${i.user.user_type==2}">
                                <span class="label label-default">普通用户</span>
                            </c:when>
                        </c:choose>
                        <%--<c:if test="${i.user.is_Vip==1}">
                            <span class="label label-danger" >VIP</span>
                        </c:if>--%>
                        <%--发表回复的用户如果是楼主则显示楼主标签 2020-03-14 23:36--%>
                        <c:if test="${tip.user.user_id eq i.user.user_id}">
                            <span class="label label-info">楼主</span>
                        </c:if>

                        &nbsp;
                        <small class="text-muted">发表于：
                            <%--显示回复发表的时间--%>
                            <fmt:formatDate value="${i.reply_publishTime}" type="both"/>&nbsp;
                        </small>
                        &nbsp;&nbsp;&nbsp;
                        <c:if test="${i.user.user_id==sessionScope.user.user_id || tip.user.user_id eq sessionScope.user.user_id}">
                            <%--<a href="#" class="delReply" >删除</a>--%>
                            <%--<div style="float: right"><input onclick="replytoClick(this)" type="button" alt="${i.reply_id}" class="btn btn-success btn-sm replytoShow" alt="${i.reply_id}" value="回复"/></div>
                            <div style="float: right;margin-top: 35px;margin-right: -46px;" id="deletes"><input type="button" alt="${i.reply_id}" class="btn btn-danger btn-sm delReply" value="删除"/></div>--%>
                            <div style="float: right;" id="deletes"><input type="button" alt="${i.reply_id}" class="btn btn-danger btn-sm delReply" value="删除"/></div>
                        </c:if>
                        <%--<c:if test="${tip.user.user_id eq sessionScope.user.user_id}">
                            <div style="float: right" id="deletes"><input type="button" id="${i.reply_id}"  class="btn btn-danger btn-sm delete" value="删除"/></div>
                        </c:if>--%>
                    </div>
                    <div style="height: 80px; overflow:auto; word-wrap:break-word;">
                        <%--这里显示回复的正文--%>
                       <xmp>${i.reply_content}</xmp>
                            <%--<ul style="width:1000px;background-color:#FEFCF4;border:1px solid #FFDAB9;margin-left: 30px">
                                <li>
                                    <span>@bbb</span><br>
                                    <span><c:choose>
                                        <c:when test="${fn:contains(i.user.head_portrait,'http')}">
                                            <img src="${i.user.head_portrait}" class="round_icon" />&nbsp;
                                        </c:when>
                                        <c:otherwise>
                                            <img src="<%=path%>/static/img/${i.user.head_portrait}" class="round_icon" />&nbsp;
                                        </c:otherwise>
                                    </c:choose></span>
                                    <span>aaa   &nbsp;&nbsp;&nbsp;&nbsp;<a>删除</a></span>
                                </li>
                                <li style="line-height:50px;">bbb</li>
                                <li style="line-height:50px;">ccc</li>
                            </ul>--%>
                    </div>
                </div>

                <%--<div class="replyto">
                    <form action="" method="post" id="">
                            &lt;%&ndash;隐藏域获取贴子ID&ndash;%&gt;
                        <input type="hidden" name="tip_id" value="" >
                            &lt;%&ndash;这里显示输入回复内容的文本框&ndash;%&gt;
                        <textarea class="form-control" rows="3" name="reply_content" id="reply_content" required ></textarea>
                        <br/>
                        <input type="button" class="btn btn-success btn-sm" value="回复"/>
                    </form>
                </div>--%>

            </li>
        </c:forEach>
            <c:if test="${hf==true}">
                <!-- 显示分页信息 -->
                <div style="width: 100%;text-align: right; " class="panel panel-default">
                    <ul class="pagination" style="width: 40%">
                        <li><a href="${pageContext.request.contextPath}/click/${tip.tip_id}?currentPage=1">首页</a></li>
                        <c:if test="${page.hasPreviousPage}">
                            <li><a href="${pageContext.request.contextPath}/click/${tip.tip_id}?currentPage=${page.pageNum-1}"> <span>&laquo;</span></a></li>
                        </c:if>
                        <c:forEach items="${page.navigatepageNums}" var="page_Num">
                            <c:if test="${page_Num == page.pageNum}">
                                <li class="active"><a href="#">${page_Num}</a></li>
                            </c:if>
                            <c:if test="${page_Num != page.pageNum }">
                                <li><a href="${pageContext.request.contextPath}/click/${tip.tip_id}?currentPage=${page_Num}">${page_Num}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${page.hasNextPage }">
                            <li><a href="${pageContext.request.contextPath}/click/${tip.tip_id}?currentPage=${page.pageNum+1 }"> <span>&raquo;</span></a></li>
                        </c:if>
                        <li><a href="${pageContext.request.contextPath}/click/${tip.tip_id}?currentPage=${page.pages}">末页</a></li>
                    </ul>
                    共<strong class="blue">${page.total}</strong>条记录，当前显示第&nbsp;<strong class="blue">${page.pageNum}&nbsp;</strong>页 总 <strong class="blue">${page.pages }</strong> 页
                </div>
            </c:if>
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
                            <textarea style="overflow-y:scroll" class="showtext form-control" rows="3" name="reply_content" id="reply_content" required disabled="disabled"></textarea>
                            <br/>
                            <input type="button" class="btn btn-success btn-sm" disabled="disabled" value="发表"/>
                        </form>
                    </c:if>
                    <c:if test="${tip.tip_isKnot!=1 &&  sessionScope.user.user_status!=2 && not empty sessionScope.user}">
                    <form action="" method="post" id="myReplyForm">
                        <%--隐藏域获取贴子ID--%>
                        <input type="hidden" name="tip_id" value="" >
                        <%--这里显示输入回复内容的文本框--%>
                        <textarea style="overflow-y:scroll" class="showtext form-control" rows="3" name="reply_content" id="reply_content" required ></textarea>
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
</div>
<!-- 引入侧边栏文件 -->
<%@ include file="side.jsp" %>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp" %>

<script>
    /*$(document).on("click",".replytoShow",function () {
           $(".replyto").toggle();
       })*/
    /*function replytoClick(this_click){
        $(this_click).parent("div").parent("div").parent("div").next().toggle();
        $($(this_click).parent("div").parent("div").parent("div").next().find(":last")).click(function () {
            $(".replyto").hide()
        })
    }*/
    $(document).on("click",".delReply",function () {
        var delReply=$(this).attr("alt");
        if (confirm("确认要删除这条评论吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}/delReply/"+delReply,
                type:"get",
                success:function () {
                    location.href="${pageContext.request.contextPath}/click/${tip.tip_id}?currentPage=${page.pageNum}";
                },
                error:function () {
                    alert("服务器错误，删除失败！");
                }
            })
        }
    })
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
    $("#fabu").click(function () {
        //判断是否输入内容为空或者全为空格
        var bodys=$('#reply_content').val();
        if(bodys.match(/^[ ]*$/)){
            alert("输入内容不能为空或为空格.")
        }else {
            $.ajax({
                url:"${pageContext.request.contextPath}/pinglun",
                type:"GET",
                data:{"user_id":"${sessionScope.user.user_id}","tip_id":"${tip.tip_id}","reply_content":bodys},
                success:function () {
                    location.href="${pageContext.request.contextPath}/click/"+${tip.tip_id};
                },
                error:function () {
                    alert("发送错误")
                }
            });
        }
    });
    $(document).on("click","#denglu",function () {
        // $(location).attr('href', 'login.jsp');
        window.location = "/toLogin.jsp";
    })

</script>

</body>
</html>