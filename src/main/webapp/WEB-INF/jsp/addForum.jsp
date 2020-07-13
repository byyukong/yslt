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
    <title>添加版块 - 论坛</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
    <style>
        li {list-style-type:none;}
        a{
            color: #8A8A8A;
            cursor: pointer;
        }
    </style>
</head>
<body>


<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

<div class="panel panel-default" id="login" style="width: 55%;margin-left: 10%;margin-top: 5%;margin-bottom: 5%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">添加版块</h3>
    </div>
    <div class="panel-body">
        <form action="${pageContext.request.contextPath}/addForum" method="POST" id="myAddForumForm" class="form-horizontal" role="form" style="margin-left: 5%">
            <div class="form-group" >
                <label class="col-sm-2 control-label">*版块名</label>
                <div class="col-sm-10" style="width: 40%;">
                    <input type="text" class="form-control" id="forum_name" name="forum_name" required />
                    <p id="forumNameErr" class="form-control-static"></p>
                </div>
            </div>

            <input type="submit" id="sub" class="btn btn-primary" value="添加" style="margin-left: 20%"/>
            <%--返回首页--%>
            <a href="${pageContext.request.contextPath}/toForumManage" class="btn btn-default" style="margin-left: 15%">返回</a>
        </form>

    </div>
</div>

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