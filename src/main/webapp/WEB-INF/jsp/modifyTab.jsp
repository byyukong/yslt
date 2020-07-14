<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>论坛 ›修改分类信息</title>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

<div style="width: 50%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <a href="<%=basePath%>">论坛</a> › <a href="/toTab">修改分类信息</a> › <a href="#">${tab.tab_name}</a>
        </div>

        <div class="panel-body">
            <form  action="${pageContext.request.contextPath}/modifyTab" id="myTabUpdateForm" method="POST" class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-sm-2 control-label">分类ID</label>
                    <div class="col-sm-5">
                        <p class="form-control-static">${tab.tab_id}</p>
                    </div>
                    <div class="col-sm-5">
                        <input type="text"  name="tab_id" value="${tab.tab_id}" readonly />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">分类名</label>
                    <div class="col-sm-5">
                        <p class="form-control-static">${tab.tab_name}</p>
                    </div>
                    <div class="col-sm-5">
                        修改分类名：<br>
                        <input id="tab_name" type="text"  name="tab_name" value="${tab.tab_name}" required />
                        <p id="tabNameErr"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">所属版块</label>
                    <div class="col-sm-5">
                        <p class="form-control-static">${tab.forum.forum_name}</p>
                    </div>
                    <div class="col-sm-5">
                        修改所属版块：<br>
                        <select class="form-control" name="forum_id">
                            <%--遍历所有版块--%>
                            <c:forEach items="${forum}" var="i">
                                <option value="${i.forum_id}" <c:if test="${i.forum_name==tab.forum.forum_name}"> selected="selected"</c:if>>${i.forum_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <input id="sub" class="btn btn-warning" type="submit" value="修改"/>
                <input class="btn btn-default" type="reset" value="重填"/>
                <a href="${pageContext.request.contextPath}/toTab" class="btn btn-default">返回</a>
            </form>
        </div>
    </div>
</div>

<!-- 引入侧边栏文件 -->
<%@ include file="side.jsp"%>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>

<script>
    $(function () {
        $("#tab_name").blur(function () {
            var tab_name= $(this).val();
            var tabNameErr=$("#tabNameErr");
            $.ajax({
                url:"${pageContext.request.contextPath}/uniquenessTabName",
                type:"post",
                data:{"tab_name":tab_name},
                dataType:"text",
                success:function (result) {
                    if(tab_name!=""){
                        if (result!="0"){
                            tabNameErr.css("color","green");
                            tabNameErr.text("分类名可以使用！");
                            $("#sub").attr("disabled", false);
                        }else{
                            tabNameErr.css("color","red");
                            tabNameErr.text("分类名已被使用！");
                            $("#sub").attr("disabled", true);
                        }
                    }else{
                        tabNameErr.css("color","red");
                        tabNameErr.text("分类名不能为空！");
                        $("#sub").attr("disabled", true);
                    }
                },
                error:function () {
                    alert("获取版块失败！")
                }
            })
        })
    })
</script>

</body>
</html>