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
    <title>分类管理 - 论坛</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
    <style>
        li {
            list-style-type: none;
        }

        a {
            color: #8A8A8A;
            cursor: pointer;
        }

        th {
            text-align: center; /*设置水平居中*/
            /* vertical-align:middle; */ /*设置垂直居中*/
        }

        td {
            text-align: center; /*设置水平居中*/
            /* vertical-align:middle; */ /*设置垂直居中*/
            /* border: 1px solid gray; */
        }
    </style>



</head>
<body>


<%--引入header文件--%>
<%@ include file="header.jsp" %>
<%@ include file="side.jsp"%>
<div class="panel panel-default"
     style="width: 50%;margin-left: 5%; margin-right: 5%; margin-bottom: 5%;border:2px solid #a1a1a1;padding:20px 40px;width:50%;border-radius:25px;">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">分类管理</h3>
    </div>
    <div class="panel-body">
        <a href="${pageContext.request.contextPath}/goAddTab" class="btn btn-success" style="margin-left: 0%">添加分类</a>
        <%--这里显示所有版块信息--%>
        <table class="table table-hover">
            <thead>
            <tr>
                <th style="width: 10%">分类ID</th>
                <th style="width: 20%">分类名</th>
                <th>所属版块名</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%--这里是表格内容，需要遍历数组--%>
            <c:forEach items="${tab}" var="i">
                <tr>
                    <td>${i.tab_id}</td>
                    <td>${i.tab_name}</td>
                    <td>${i.forum.forum_name}</td>
                        <%--状态--%>
                    <td>
                            <%--判断是否已删除--%>
                        <c:choose>
                            <c:when test="${i.tab_isDeleted==0}">
                                <span>正常</span>
                            </c:when>
                            <c:otherwise>
                                <span class="label label-danger">已删除</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                        <%--这里放操作按钮--%>
                    <td>
                        <a href="${pageContext.request.contextPath}/toModifyTab/${i.tab_id}" class="btn btn-warning">修改</a>
                            <%--逻辑删除与取消删除--%>
                        <c:choose>
                            <c:when test="${i.tab_isDeleted==0}">
                                <a href="${pageContext.request.contextPath}/delTab/${i.tab_id}" class="btn btn-danger">删除</a>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/cancelDelClassify/${i.tab_id}" class="btn btn-success">取消删除</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/" class="btn btn-default" style="margin-left: 20%">返回</a>
    </div>
</div>

<%--引入footer文件--%>
<%@ include file="footer.jsp" %>
</body>
</html>