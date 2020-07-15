<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 这是侧边栏 -->
<style>
    .bg{
        background-color: #EFEFEF;
    }
</style>
<script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
<script>
    $(document).on("mouseover","ul li",function () {
        $(this).addClass("bg");
    });
    $(document).on("mouseout","ul li",function () {
        $(this).removeClass("bg");
    });
</script>
<!-- 未登录 -->
<c:choose>
    <c:when test="${sessionScope.user.user_name==null}">
        <div class="panel panel-default" id="sidebar2" style="width: 20%;margin:1% 2% 1% 0%;float: right">
            <div class="panel-heading" style="background-color: white;text-align: center">
                <blockquote>
                    论坛
                    <small>中华万里腾飞，逍遥古今中外</small>
                </blockquote>
            </div>
            <ul class="list-group" style="width: 100%">
                <li class="list-group-item">
                    <a href="${pageContext.request.contextPath}/toLogin" class="btn btn-primary btn-block">登录</a>
                    <a href="${pageContext.request.contextPath}/toRegis" class="btn btn-default btn-block">注册</a>
                </li>
            </ul>
        </div>
    </c:when>
    <c:otherwise>
        <div class="panel panel-default" id="sidebar2" style="width: 20%;margin:1% 2% 1% 0%;float: right">
            <div class="panel-heading" style="background-color: white;text-align: center">欢迎您！
                    <%--展示用户昵称--%>
                <a href="">${sessionScope.user.user_nick}</a>
                    <%--展示用户权限需要判断--%>
                <c:choose>
                    <c:when test="${sessionScope.user.user_type==0}">
                        <span class="label label-success">超级管理员</span>
                    </c:when>
                    <c:when test="${sessionScope.user.user_type==1}">
                        <span class="label label-warning">管理员</span>
                    </c:when>
                    <c:when test="${sessionScope.user.user_type==2}">
                        <span class="label label-default">普通用户</span>
                    </c:when>
                </c:choose>
            </div>
            <c:choose>
                <c:when test="${sessionScope.user.user_type==0}">
                    <ul class="list-group" style="width: 100%">
                            <%--被锁定的用户不能发贴  不显示发帖--%>
                        <c:if test="${sessionScope.user.user_status!=2}">
                            <li class="list-group-item">
                                <a href="${pageContext.request.contextPath}/goAddTip">发表新贴</a>
                            </li>
                        </c:if>
                            <%--超管特有    判断是否是超管--%>
                        <li class="list-group-item">
                            <a href="${pageContext.request.contextPath}/toRegis">注册新的管理员</a>
                        </li>
                            <%--管理员功能 2020-07-4 22:33--%>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/userInfo">用户管理</a></li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/toTipAdministration">贴子管理</a></li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/toForumManage">版块管理</a></li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/toTab">分类管理</a></li>
                        <li class="list-group-item"><a href="#">...待添加...</a></li>
                    </ul>

                </c:when>
                <c:when test="${sessionScope.user.user_type==1}">
                    <ul class="list-group" style="width: 100%">
                            <%--被锁定的用户不能发贴  不显示发帖--%>
                        <c:if test="${sessionScope.user.user_status!=2}">
                            <li class="list-group-item">
                                <a href="#">发表新贴</a>
                            </li>
                        </c:if>
                            <%--管理员功能 2020-07-04 22:33--%>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/userInfo">用户管理</a></li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/toTipAdministration">贴子管理</a></li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/toForumManage">版块管理</a></li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/toTab">分类管理</a></li>
                        <li class="list-group-item"><a href="#">...待添加...</a></li>
                    </ul>

                </c:when>
                <c:when test="${sessionScope.user.user_type==2}">
                    <ul class="list-group" style="width: 100%">
                            <%--被锁定的用户不能发贴  不显示发帖--%>
                        <c:if test="${sessionScope.user.user_status!=2}">
                            <li class="list-group-item">
                                <a href="#">发表新贴</a>
                            </li>
                        </c:if>
                    </ul>
                </c:when>
            </c:choose>
        </div>
    </c:otherwise>
</c:choose>
<!-- 已登录 -->
</div>
