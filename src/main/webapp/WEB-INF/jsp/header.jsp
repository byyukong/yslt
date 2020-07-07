<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--这个是头部导航栏--%>
<header>
    <nav class="navbar navbar-default" role="navigation" style="background-color: white">
        <div class="container-fluid" style="margin-left: 10%">
            <div class="navbar-header">
                <a class="navbar-brand" href="<%=basePath%>">论坛</a>
            </div>
            <div>

                <%--向左对齐--%>
                <ul class="nav navbar-nav navbar-left">
                    <li class="active">
                        <a href="#">技术</a>
                    </li>
                </ul>

                    <%--判断为未登录--%>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <p class="navbar-text"><a href="toLoginPage.do">登录</a></p>
                        </li>
                        <li>
                            <p class="navbar-text"><a href="toSignUpPage.do">注册</a></p>
                        </li>
                    </ul>

                    <%--判断为 已登录--%>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <p class="navbar-text"><a href="<%=basePath%>">首页</a></p>
                        </li>
                        <%--判断是否为被锁定的用户 被锁定的用户不能发贴--%>
                        <li><p class="navbar-text"><a href="toPublishTipPage.do">发表新贴</a></p></li>
                        <li>
                            <p class="navbar-text">
                                <%--显示用户昵称 点击进入修改页面--%>
                                <a href="">
                                    <%--展示用户权限--%>
                                    <span class="label label-success">超级管理员</span>
                                    <span class="label label-warning">管理员</span>
                                    <span class="label label-default">普通用户</span>
                                </a>
                            </p>
                        </li>

                        <%--判断是否是管理员 显示管理员功能下拉栏--%>
                        <li class="dropdown" open>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                               role="button" aria-haspopup="true" aria-expanded="true">
                                管理员功能<span class="caret"/>
                            </a>
                            <ul class="dropdown-menu">
                                <%--超级管理员可以注册新管理员--%>
                                <li><a href="toSignUpPage.do">注册新的管理员</a></li>
                                <li role="separator" class="divider"></li>

                                <%--普通管理员--%>
                                <li><a href="toUserManagePage.do">用户管理</a></li>
                                <%--分割线separator--%>
                                <li role="separator" class="divider"></li>
                                <li><a href="toTipManagePage.do">贴子管理</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="toForumManagePage.do">版块管理</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="toTabManagePage.do">分类管理</a></li>
                                <li role="separator" class="divider"></li>
                            </ul>
                        </li>

                        <li>
                            <p class="navbar-text"><a href="#">退出登录</a></p>
                        </li>
                    </ul>
            </div>
        </div>
    </nav>

</header>
<script>

</script>