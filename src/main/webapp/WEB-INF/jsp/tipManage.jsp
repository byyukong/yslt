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
    <meta charset="UTF-8">
    <title>贴子管理 - 论坛</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
    <style>
        li {list-style-type:none;}

        a{
            color: #8A8A8A;
            cursor: pointer;
        }

        th {
            text-align:center; /*设置水平居中*/
            /* vertical-align:middle; */ /*设置垂直居中*/
        }
        td {
            text-align:center; /*设置水平居中*/
            /* vertical-align:middle; */ /*设置垂直居中*/
            border: 1px solid gray;
        }
    </style>
</head>
<body>



<%--引入header文件--%>
<%@ include file="header.jsp"%>

<div class="panel panel-default"
     style="width: 90%;margin-left: 5%; margin-right: 5%; margin-bottom: 5%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">贴子管理</h3>
    </div>
    <div class="panel-body">

            <!-- 这里显示所有贴子信息 -->
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>所属分类</th>
                    <th>标题</th>
                    <th>内容</th>
                    <th>发表人</th>
                    <th>回复数</th>
                    <th>发表时间、更新时间</th>
                    <th>点击数</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <%--这里是表格内容，需要遍历数组--%>
                <c:forEach items="${tips}" var="i">
                    <tr>
                        <td>${i.tip_id}</td>
                        <td>${i.tab.tab_name}</td>
                            <%--标题--%>
                        <td style="overflow: hidden; text-overflow: ellipsis; max-width: 120px; white-space: nowrap">${i.tip_title}</td>
                            <%--内容--%>
                        <td style="overflow: hidden; text-overflow: ellipsis; max-width: 120px; white-space: nowrap">${i.tip_content}</td>
                            <%--发贴用户昵称或用户名--%>
                        <td>${i.user.user_nick}</td>
                            <%--回复数--%>
                        <td>${i.tip_replies}</td>
                            <%--发贴时间 修改时间--%>
                        <td>
                            <fmt:formatDate value="${i.tip_publishTime}" type="both"/>
                            <br>
                            <fmt:formatDate value="${i.tip_modifyTime}" type="both"/>
                        </td>
                            <%--点击数--%>
                        <td>${i.tip_click}</td>
                            <%--状态--%>
                        <td>
                            <c:if test="${i.tip_isDeleted==1}">
                                <span class="label label-danger">已删除</span>
                            </c:if>
                            <c:if test="${i.tip_isKnot==1}">
                                <span class="label label-success">已结贴</span>
                            </c:if>
                            <c:if test="${i.tip_isTop==1}">
                                <span class="label label-warning">已置顶</span>
                            </c:if>
                        </td>
                        <td><!-- 这里显示操作按钮 -->
                            <a href="${pageContext.request.contextPath}/modify/${i.tip_id}" class="btn btn-info">修改</a>
                            <c:choose>
                                <c:when test="${i.tip_isDeleted==1}">
                                    <input alt="${i.tip_id}" type="button" class="btn btn-success canceDelTip" value="取消删除">
                                </c:when>
                                <c:otherwise>
                                    <input alt="${i.tip_id}" type="button" class="btn btn-danger delTip" value="删除"/>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${i.tip_isKnot==1}">
                                    <input alt="${i.tip_id}" type="button" class="btn btn-success canceStick" value="取消结贴"/>
                                </c:when>
                                <c:otherwise>
                                    <input alt="${i.tip_id}" type="button" class="btn btn-primary stick" value="结贴"/>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${i.tip_isTop==1}">
                                    <input alt="${i.tip_id}" type="button" class="btn btn-success canceTop" value="取消置顶"/>
                                </c:when>
                                <c:otherwise>
                                    <input alt="${i.tip_id}" type="button" class="btn btn-warning addTop" value="置顶"/>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <a href="${pageContext.request.contextPath}/" class="btn btn-default" style="margin-left: 17%">返回</a>
    </div>
</div>
<script>
    $(document).on("click",".addTop",function () {
        var tid=$(this).attr("alt");
        $.ajax({
            url:"${pageContext.request.contextPath}/addTop/"+tid,
            type:"post",
            success:function (result) {
                location.href="${pageContext.request.contextPath}/toTipAdministration";
            },
            error:function () {
                alert("置顶失败！")
            }
        })
    })
    $(document).on("click",".canceTop",function () {
        var tid=$(this).attr("alt");
        $.ajax({
            url:"${pageContext.request.contextPath}/canceTop/"+tid,
            type:"post",
            success:function (result) {
                location.href="${pageContext.request.contextPath}/toTipAdministration";
            },
            error:function () {
                alert("取消置顶失败！")
            }
        })
    })
    $(document).on("click",".stick",function () {
        var tid=$(this).attr("alt");
        $.ajax({
            url:"${pageContext.request.contextPath}/stick/"+tid,
            type:"post",
            success:function (result) {
                location.href="${pageContext.request.contextPath}/toTipAdministration";
            },
            error:function () {
                alert("结贴失败！")
            }
        })
    })
    $(document).on("click",".canceStick",function () {
        var tid=$(this).attr("alt");
        $.ajax({
            url:"${pageContext.request.contextPath}/canceStick/"+tid,
            type:"post",
            success:function (result) {
                location.href="${pageContext.request.contextPath}/toTipAdministration";
            },
            error:function () {
                alert("取消结贴失败！")
            }
        })
    })
    $(document).on("click",".delTip",function () {
        var tid=$(this).attr("alt");
        $.ajax({
            url:"${pageContext.request.contextPath}/delTip/"+tid,
            type:"post",
            success:function (result) {
                location.href="${pageContext.request.contextPath}/toTipAdministration";
            },
            error:function () {
                alert("删除失败！")
            }
        })
    })
    $(document).on("click",".canceDelTip",function () {
        var tid=$(this).attr("alt");
        $.ajax({
            url:"${pageContext.request.contextPath}/canceDelTip/"+tid,
            type:"post",
            success:function (result) {
                location.href="${pageContext.request.contextPath}/toTipAdministration";
            },
            error:function () {
                alert("取消删除失败！")
            }
        })
    })
</script>
<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>

</body>
</html>