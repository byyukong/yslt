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
            <table class="table">
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
                <tr>
                    <td>1</td>
                    <td>其他</td>
                    <%--标题--%>
                    <td style="overflow: hidden; text-overflow: ellipsis; max-width: 120px; white-space: nowrap">标题测试</td>
                    <%--内容--%>
                    <td style="overflow: hidden; text-overflow: ellipsis; max-width: 120px; white-space: nowrap">内容</td>
                    <%--发贴用户昵称或用户名--%>
                    <td>
                        yukong
                    </td>
                    <%--回复数--%>
                    <td>9</td>
                    <%--发贴时间 修改时间--%>
                    <td>
                        2019-10-23 16:35:17
                        <br>
                        2020-06-30 14:40:36
                    </td>
                    <%--点击数--%>
                    <td>99</td>
                    <%--状态--%>
                    <td>
                        <%--2020-03-05 10:44--%>
                        <span class="label label-danger">已删除</span>
                        <span class="label label-success">已结贴</span>
                        <span class="label label-warning">已置顶</span>
                    </td>
                    <td><!-- 这里显示操作按钮 -->
                        <input type="button" class="btn btn-warning" value="修改"/>
                        <input type="button" class="btn btn-success" value="取消删除">
                        <input type="button" class="btn btn-danger" value="删除"/>
                        <input type="button" class="btn btn-success" value="取消结贴"/>
                        <input type="button" class="btn btn-primary" value="结贴"/>

                        <%--置顶 2020-02-27 10:00--%>
                        <input type="button" class="btn btn-success" value="取消置顶"/>
                        <input type="button" class="btn btn-warning" value="置顶">
                    </td>
                </tr>
                </tbody>
            </table>
            <input type="button" class="btn btn-default" value="返回"
                   style="margin-left: 17%"/>

    </div>
</div>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>

</body>
</html>