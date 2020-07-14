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
    <title>版块管理 - 论坛</title>
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

    <script>

    </script>
</head>
<body>


<%--引入header文件--%>
<%@ include file="header.jsp" %>
<%@ include file="side.jsp"%>
<div class="panel panel-default"
     style="width: 50%;margin-left: 5%; margin-right: 5%; margin-bottom: 5%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">版块管理</h3>
    </div>
    <div class="panel-body">
        <a href="${pageContext.request.contextPath}/toAddForum" class="btn btn-success">添加版块</a>
        <a href="${pageContext.request.contextPath}/" class="btn btn-default">返回首页</a>
        <%--这里显示所有版块信息--%>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>版块ID</th>
                <th>版块名</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%--这里是表格内容，需要遍历数组--%>
                <c:forEach items="${forum}" var="i">
                    <tr>
                        <td>${i.forum_id}</td>
                        <td>${i.forum_name}</td>
                            <%--判断是否删除  状态--%>
                        <c:if test="${i.forum_isDeleted==1}">
                            <td>
                                <span class="label label-danger" >已删除</span>
                            </td>
                        </c:if>
                        <c:if test="${i.forum_isDeleted==0}">
                            <td>
                                <span>正常</span>
                            </td>
                        </c:if>
                            <%--这里放操作按钮--%>
                        <td>
                            <a href="${pageContext.request.contextPath}/toModifyForum/${i.forum_id}" class="btn btn-warning">修改</a>
                                <%--逻辑删除与取消删除--%>
                                <%--如果已删除可以取消删除--%>
                            <c:choose>
                                <c:when test="${i.forum_isDeleted==1}">
                                    <a href="${pageContext.request.contextPath}/cancelDel/${i.forum_id}" class="btn btn-success">取消删除</a>
                                    <%--<input type="button" class="btn btn-success" value="取消删除"/>--%>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/delForumManage/${i.forum_id}" class="btn btn-danger">删除</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<%--引入footer文件--%>
<%@ include file="footer.jsp" %>

</body>
</html>