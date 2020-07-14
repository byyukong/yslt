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
    <title>添加分类 - 论坛</title>
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
        <h3 class="panel-title">添加分类</h3>
    </div>
    <div class="panel-body">
        <form action="${pageContext.request.contextPath}/addTab" method="POST" id="myAddTabForm" class="form-horizontal" role="form" style="margin-left: 5%">
            <div class="form-group" >
                <label class="col-sm-2 control-label">*分类名</label>
                <div class="col-sm-10" style="width: 40%;">
                    <input type="text" class="form-control" id="tab_name" name="tab_name" required />
                    <p id="tabNameErr" class="form-control-static"></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">*所属版块：</label>
                <div class="col-sm-10" style="width: 20%">
                    <select class="form-control" id="selectForum" name="forum_id">
                        <%--遍历所有版块--%>
                        <c:forEach items="${forum}" var="i">
                            <option value="${i.forum_id}">${i.forum_name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

              <input id="sub" type="submit" class="btn btn-primary" value="添加" style="margin-left: 20%"/>
            &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/toTab" class="btn btn-default" style="margin-left: 15%">返回</a>
        </form>

    </div>
</div>

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
                    alert("获取分类失败！")
                }
            })
        })
    })
</script>
</body>
</html>