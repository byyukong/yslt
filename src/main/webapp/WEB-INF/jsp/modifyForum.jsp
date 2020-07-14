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
    <title>论坛 › 修改版块信息</title>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

<div style="width: 50%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <a href="<%=basePath%>">论坛</a> › <a href="/toForumManage">修改版块信息</a> › <a href="#">${forum.forum_name}</a>
        </div>

        <div class="panel-body">
            <form  action="${pageContext.request.contextPath}/modifyForum" id="myForumUpdateForm" method="POST" class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-sm-2 control-label">版块ID</label>
                    <div class="col-sm-5">
                        <p class="form-control-static">${forum.forum_id}</p>
                    </div>
                    <div class="col-sm-5">
                        <input type="text"  name="forum_id" value="${forum.forum_id}" readonly />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">${forum.forum_name}</label>
                    <div class="col-sm-5">
                        <p class="form-control-static">${forum.forum_name}</p>
                    </div>
                    <div class="col-sm-5">
                        修改版块名：<br>
                        <input type="text" id="forum_name" name="forum_name" value="${forum.forum_name}" required />
                        <p id="forumNameErr" class="form-control-static"></p>
                    </div>
                </div>
                <input class="btn btn-warning" id="sub" type="submit" value="修改"/>
                <input class="btn btn-default" type="reset" value="重填"/>
                <a href="${pageContext.request.contextPath}/toForumManage" class="btn btn-default">返回</a>
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
        $("#forum_name").blur(function () {
            var forum_name= $(this).val();
            var forumNameErr=$("#forumNameErr");
            $.ajax({
                url:"${pageContext.request.contextPath}/uniquenessForumName",
                type:"post",
                data:{"forum_name":forum_name},
                dataType:"text",
                success:function (result) {
                    if(forum_name!=""){
                        if (result!="0"){
                            forumNameErr.css("color","green");
                            forumNameErr.text("版块名可以使用！");
                            $("#sub").attr("disabled", false);
                        }else{
                            forumNameErr.css("color","red");
                            forumNameErr.text("版块名已被使用！");
                            $("#sub").attr("disabled", true);
                        }
                    }else{
                        forumNameErr.css("color","red");
                        forumNameErr.text("版块名不能为空！");
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