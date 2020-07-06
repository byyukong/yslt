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
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
    <title>论坛 › 修改贴子 › 贴子标题</title>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

<div style="width: 70%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <a href="<%=basePath%>">论坛</a> › 修改贴子 ›
            <%--贴子ID    贴子标题--%>
            <a href="1">测试</a>
        </div>

        <div class="panel-body">
            <%--发贴人修改贴子，不同的action--%>
            <form  action="" id="myTipUpdateForm" method="POST" class="form-horizontal" role="form">
                <table class="table">
                    <thead>
                    <tr>
                        <th>名称</th>
                        <th>修改前</th>
                        <th>修改后</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>贴子ID</td>
                            <td>1</td>
                            <%--贴子ID不允许用户修改--%>
                            <td><input class="form-control" type="hidden"
                                        name="tip_id" value="1" readonly/></td>
                        </tr>
                        <tr>
                            <td>版块</td>
                            <td>默认</td>
                            <td>
                                <select class="form-control" id="selectForum" name="selectedForumId" onchange="selectForumFunc()">
                                    <%--遍历所有版块--%>
                                    <option value="1" selected>默认</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>分类</td>
                            <td>技术</td>
                            <td>
                                <select class="form-control" id="selectTab" name="selectedTabId">
                                    <option value="1" selected>技术</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>发贴人</td>
                            <td>
                                yukong
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>标题</td>
                            <td>标题测试</td>
                            <td><input class="form-control" type="text"
                                       name="tip_title" value="标题测试" required/></td>
                        </tr>
                        <tr>
                            <td>内容</td>
                            <td>内容测试</td>
                            <td>
                                <textarea class="form-control" rows="2"
                                          name="tip_content">内容测试</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>回复数</td>
                            <td>99</td>
                        </tr>
                        <tr>
                            <td>发表时间<br>更新时间</td>
                            <td>
                                2019-10-27 23:29:11
                                <br>
                                2020-07-01 22:44:03
                            </td>
                        </tr>
                        <tr>
                            <td>点击量</td>
                            <td>99</td>
                        </tr>
                        <tr>
                            <td>状态</td>
                            <td>
                                删除
                                <br>
                                结贴
                                <br>
                                未结贴
                            </td>
                        </tr>
                        <tr>
                            <td>操作</td>
                            <td>
                                <input class="btn btn-warning" type="button" value="修改"/>
                                <input class="btn btn-default" type="reset" value="重填"/>
                                <%--这里的返回应回到贴子详情--%>
                                <input type="button" class="btn btn-default" value="返回"
                                       style="margin-left: 10%"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>

<!-- 引入侧边栏文件 -->
<%@ include file="side.jsp"%>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>

<script>

</script>

</body>
</html>