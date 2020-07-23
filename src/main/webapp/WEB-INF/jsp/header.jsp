<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--这个是头部导航栏--%>
<style>
    .round_icon{
        width: 36px;
        height: 36px;
        display: flex;
        border-radius: 50%;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        float: left;
    }
    #empAddModel{
        border: black solid 1px;
        position: absolute;
        left: 25%;
        top: 20%;
        width: 40%;
        height: 45%;
        background: white;
        text-align: left;
    }
    .round_icons{
        position: absolute;
        left: 65%;
        top: 60px;
        width: 200px;
        height: 200px;
        display: flex;
        border-radius: 50%;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        vertical-align:middle;
    }
    .file label {
        display: inline-block;
    }
    #file{
        position: absolute;
        left: auto;
        width: 84px;
    }
    .imgs{
        position: absolute;
        left: 5%;
        top: 60px;
        width: 200px;
        height: 200px;
        display: flex;
        border-radius: 50%;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        vertical-align:middle;
    }
    .file .button {
        display: inline-block;
        vertical-align: middle;
        width: 80px;
        text-align: center;
        height: 40px;
        line-height: 40px;
        font-size: 14px;
        background-color: #5bc0de;
        border: none;
        color: #fff;
        cursor: pointer;
    }
    .file input[type="file"] {
        position: absolute;
        top: 0;
        left: 60px;
        z-index: 3;
        opacity: 0;
        width: 300px;
        height: 40px;
        line-height: 40px;
        cursor: pointer;
    }
    .activityForm{
        position: relative;
        top: 270px;
        left: 35%;
        width: 200px;
    }
</style>

<header>
    <nav class="navbar navbar-default" role="navigation" style="background-color: white">
        <div class="container-fluid" style="margin-left: 10%">
            <div class="navbar-header">
                <a class="navbar-brand" href="<%=basePath%>">论坛</a>
            </div>
            <div>
                <%--向左对齐--%>
                <%--<ul class="nav navbar-nav navbar-left">
                    <li class="active">
                        <a href="#">技术</a>
                    </li>
                </ul>--%>
                <c:choose>
                    <c:when test="${sessionScope.user.user_name==null}">
                        <%--判断为未登录--%>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <p class="navbar-text"><a href="${pageContext.request.contextPath}/toLogin">登录</a></p>
                            </li>
                            <li>
                                <p class="navbar-text"><a href="${pageContext.request.contextPath}/toRegis">注册</a></p>
                            </li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <%--判断为 已登录--%>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <p class="navbar-text"><a href="<%=basePath%>">首页</a></p>
                            </li>
                                <%--判断是否为被锁定的用户 被锁定的用户不能发贴--%>
                            <c:if test="${sessionScope.user.user_status!=2}">
                                <li><p class="navbar-text"><a href="${pageContext.request.contextPath}/goAddTip">发表新贴</a></p></li>
                            </c:if>

                            <li>
                                <p class="navbar-text">
                                    <img style="margin-top: -7px" src="<%=path%>/static/img/${sessionScope.user.head_portrait}" class="round_icon" />&nbsp;

                                <%--显示用户昵称 点击进入修改页面--%>
                                    <a href="${pageContext.request.contextPath}/toUpdate_userInfo/${sessionScope.user.user_id}">${sessionScope.user.user_nick}</a>
                                    <c:choose>
                                        <c:when test="${sessionScope.user.user_type==0}">
                                            <%--展示用户权限--%>
                                            <span class="label label-success">超级管理员</span>
                                        </c:when>
                                        <c:when test="${sessionScope.user.user_type==1}">
                                            <span class="label label-warning">管理员</span>
                                        </c:when>
                                        <c:when test="${sessionScope.user.user_type==2}">
                                            <span class="label label-default">普通用户</span>
                                        </c:when>
                                    </c:choose>
                                    <c:if test="${sessionScope.user.is_Vip==1}">
                                         <span class="label label-danger" >VIP</span>
                                    </c:if>
                                </p>
                            </li>
                            <c:choose>
                                <c:when test="${sessionScope.user.user_type==0}">
                                    <%--判断是否是管理员 显示管理员功能下拉栏--%>
                                    <li class="dropdown" open>
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                           role="button" aria-haspopup="true" aria-expanded="true">
                                            管理员功能<span class="caret"/>
                                        </a>
                                        <ul class="dropdown-menu">
                                                <%--超级管理员可以注册新管理员--%>
                                            <li><a href="${pageContext.request.contextPath}/toRegis">注册新的管理员</a></li>
                                            <li role="separator" class="divider"></li>

                                                <%--普通管理员--%>
                                            <li><a href="${pageContext.request.contextPath}/userInfo">用户管理</a></li>
                                                <%--分割线separator--%>
                                            <li role="separator" class="divider"></li>
                                            <li><a href="${pageContext.request.contextPath}/toTipAdministration">贴子管理</a></li>
                                            <li role="separator" class="divider"></li>
                                            <li><a href="${pageContext.request.contextPath}/toForumManage">版块管理</a></li>
                                            <li role="separator" class="divider"></li>
                                            <li><a href="${pageContext.request.contextPath}/toTab">分类管理</a></li>
                                            <li role="separator" class="divider"></li>
                                        </ul>
                                    </li>
                                </c:when>
                                <c:when test="${sessionScope.user.user_type==1}">
                                    <%--判断是否是管理员 显示管理员功能下拉栏--%>
                                    <li class="dropdown" open>
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                           role="button" aria-haspopup="true" aria-expanded="true">
                                            管理员功能<span class="caret"/>
                                        </a>
                                        <ul class="dropdown-menu">
                                                <%--普通管理员--%>
                                            <li><a href="#">用户管理</a></li>
                                                <%--分割线separator--%>
                                            <li role="separator" class="divider"></li>
                                            <li><a href="${pageContext.request.contextPath}/toTipAdministration">贴子管理</a></li>
                                            <li role="separator" class="divider"></li>
                                            <li><a href="${pageContext.request.contextPath}/toForumManage">版块管理</a></li>
                                            <li role="separator" class="divider"></li>
                                            <li><a href="${pageContext.request.contextPath}/toTab">分类管理</a></li>
                                            <li role="separator" class="divider"></li>
                                        </ul>
                                    </li>
                                </c:when>
                            </c:choose>
                            <li>
                                <p class="navbar-text"><a href="${pageContext.request.contextPath}/logOut">退出登录</a></p>
                            </li>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>

</header>
<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <h3>论坛>修改头像</h3>
        <div id="d"><label for="file"><img src="../../static/img/default.jpg" class="imgs"/></label></div>
        <form action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data" class="activityForm">
            <div class="file">
                <input type="hidden" name="user_id" value="${sessionScope.user.user_id}"/>
                <label for="file">点击选择图片</label>
                <input type="file" name="file" onchange="xll(this)" id="file"/>
                <input class="button" type="submit" value="修改">
            </div>
        </form>
        <div style="float:left;margin-top: 30px;width: 1px;height: 150px; background: darkgray; position: relative;top: -10px;left: 52%;"></div>
        <div>
            <img src="../../static/img/${user.head_portrait}" class="round_icon"/>
        </div>

    </div>
</div>


<script>
    $(".round_icon").click(function () {
        $("#empAddModel").modal();
        var file=$("#file");
        var imgs=$(".imgs");
        //清除已选择图片
        imgs.attr("src","../../static/img/default.jpg");
        //清除已选择图片路径
        file.after(file.clone().val(""));
        file.remove();
        $("#empAddModel .round_icon").addClass("round_icons")
    })
    function xll(resl) {
        var Fs = $(resl)[0];
        var formData = new FormData();
        formData.append("file",Fs.files[0]);
        var div = "<img src='"+window.URL.createObjectURL(Fs.files[0])+"' class='imgs'/>";
        $("#d").html(div);
    }

</script>