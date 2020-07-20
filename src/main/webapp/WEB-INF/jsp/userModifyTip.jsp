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
                            <td>${tip.tip_id}</td>
                            <%--贴子ID不允许用户修改--%>
                            <td><input class="form-control" type="hidden"
                                        name="tip_id" value="1" readonly/></td>
                        </tr>
                        <tr>
                            <td>版块</td>
                            <td>
                                <c:forEach items="${forums}" var="i">
                                    <c:if test="${tip.forum_id==i.forum_id}">
                                        ${i.forum_name}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <select class="form-control" id="selectForum" name="selectedForumId">
                                    <c:forEach items="${forums}" var="i">
                                        <option value="${i.forum_id}"<c:if test="${tip.forum_id==i.forum_id}">selected="selected"</c:if>>${i.forum_name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>分类</td>
                            <td><c:forEach items="${tab}" var="i">
                                    <c:if test="${tip.tab_id==i.tab_id}">
                                        ${i.tab_name}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <select class="form-control" id="selectTab" name="selectedTabId">
                                    <c:forEach items="${tab}" var="i">
                                        <option value="${i.tab_id}" <c:if test="${tip.tab_id==i.tab_id}">selected="selected"</c:if>>${i.tab_name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>发贴人</td>
                            <td>
                               <c:forEach items="${user}" var="i">
                                   <c:if test="${tip.user_id==i.user_id}">
                                       ${i.user_nick}
                                   </c:if>
                               </c:forEach>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>标题</td>
                            <td>${tip.tip_title}</td>
                            <td>
                                <textarea class="form-control" rows="2" name="tip_content" id="title" style="resize:none;">${tip.tip_title}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>内容</td>
                            <td>${tip.tip_content}</td>
                            <td>
                                <textarea class="form-control" rows="2" name="tip_content" id="content" style="resize:none;">${tip.tip_content}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>回复数</td>
                            <td>${tip.tip_replies}</td>
                        </tr>
                        <tr>
                            <td>发表时间<br>更新时间</td>
                            <td>
                                <fmt:formatDate value="${tip.tip_publishTime}" type="both"/>
                                <br>
                                <fmt:formatDate value="${tip.tip_modifyTime}" type="both"/>
                            </td>
                        </tr>
                        <tr>
                            <td>点击量</td>
                            <td>${tip.tip_click}</td>
                        </tr>
                        <tr>
                            <td>状态</td>
                            <td>
                                <c:if test="${tip.tip_isDeleted ==1}">
                                    删除<br>
                                </c:if>
                                <c:if test="${tip.tip_isKnot==1}">
                                    结贴
                                    <br>
                                </c:if>
                                <c:if test="${tip.tip_isKnot==0}">
                                    未结贴
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td>操作</td>
                            <td>
                                <input class="btn btn-warning" type="button" id="xiugai" value="修改"/>
                                <input class="btn btn-default" type="reset" value="重填"/>
                                <%--这里的返回应回到贴子详情--%>
                                <a href="${pageContext.request.contextPath}/click/+${tip.tip_id}" class="btn btn-default">返回</a>
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
    $(document).on("click","#xiugai",function () {
        var  myselect=document.getElementById("selectForum");
        var index=myselect.selectedIndex ;
        var forum=myselect.options[index].value;
        var  tmyselect=document.getElementById("selectTab");
        var tindex=tmyselect.selectedIndex ;
        var tab=tmyselect.options[tindex].value;
        var content=$("#content").val();
        var title=$("#title").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/xiugaitip",
            type:"get",
            dataType: "json",
            data:{"forum_id":forum,"tab_id":tab,"tip_title":title,"tip_content":content,"tip_modifyTime":new Date(),"tip_id":"${tip.tip_id}"},
            success:function (result) {
                if (result>0){
                    alert("修改成功");
                    location.href="${pageContext.request.contextPath}/click/"+${tip.tip_id};
                }else {
                    alert("修改失败");
                }
            },
            error:function () {
                alert("修改时出错")
            }
        })
    });
</script>

</body>
</html>