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
    <meta name="Content-Type"  tip_content="text/html;charset=utf-8">
    <meta name="keywords" tip_content="论坛">
    <title>论坛问答系统</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
    <style>
        li {list-style-type:none;}
        html, body {
            height: 100%;
            font-size: 14px;
            color: #525252;
            font-family: NotoSansHans-Regular,AvenirNext-Regular,arial,Hiragino Sans GB,"Microsoft Yahei","Hiragino Sans GB","WenQuanYi Micro Hei",sans-serif;
            background: #f0f2f5;
        }
        .footer {
            background-color: #fff;
            margin-top: 22px;
            margin-bottom: 22px;
            width: 100%;
            padding-top: 22px;
            color: #8A8A8A;
            display: block;
            height: 200px;
            border: 1px ;
            clear:both
        }

        .container {
            margin-right: 5%;
            margin-left: 5%;
            padding-left: 15px;
            padding-right: 15px;
            width: 40%;
            float: left;
        }
        .info {
            margin-right: 5%;
            width: 10%;
            float: left;
        }
        a{
            color: #8A8A8A;
            cursor: pointer;
        }
        .blue{
            color: deeppink;
        }
    </style>
</head>
<body>

<!-- 引入header文件 -->
<%@ include file="header.jsp"%>
<div style="margin-left: 100px"><span id="runtime_span"><script type="text/javascript">function show_runtime(){window.setTimeout("show_runtime()",1000);X=new Date("7/24/2020 17:07:00");Y=new Date();T=(Y.getTime()-X.getTime());M=24*60*60*1000;a=T/M;A=Math.floor(a);b=(a-A)*24;B=Math.floor(b);c=(b-B)*60;C=Math.floor((b-B)*60);D=Math.floor((c-C)*60);runtime_span.innerHTML="本站勉强运行: "+A+"天"+B+"小时"+C+"分"+D+"秒"}show_runtime();</script></span></div>
<div class="panel panel-default" id="main" style="width: 70%;margin:1% 2% 5% 5%;float: left;">
    <form role="form" method="post" action="${pageContext.request.contextPath}/sousuo" method="post">
        <div class="input-group col-md-3" style="margin-top:2px; float: left; text-align: center;">
            <%--首页的贴子搜索框--%>
            <input type="text" class="form-control" id="keyword" name="keyword" placeholder="请输入要搜索的关键词" />
            <span class="input-group-btn">
            <button  type="submit" class="btn btn-info btn-search">搜索</button>
        </span>
        </div>
    </form>

    <div class="panel-heading" style="background-color: white;">
        <a style="margin-left: 2%"><%--活跃--%></a>
        <a style="margin-left: 2%"><%--精华--%></a>
        <a style="margin-left: 2%"><%--最近--%></a>
    </div>

    <script>
        $(document).on("click",".liClick",function () {
            var tid=$(this).attr("alt");
            location.href="${pageContext.request.contextPath}/click/"+tid;
        })
    </script>
    <ul class="list-group" style="width: 100%">
        <c:set value="false" var="hf"/>
        <c:forEach items="${page.list}" var="i">
            <c:set value="true" var="hf"/>
            <c:if test="${i.forum.forum_isDeleted==0 && i.tab.tab_isDeleted==0 && i.tip_isDeleted==0}">
                <li class="list-group-item liClick" alt="${i.tip_id}">
                    <div style="height: 50px">
                        <div style="width: 89%;float: left">
                                <%--这里显示贴子标题，点击贴子跳转到贴子详情，需要传参贴子id--%>
                            <a href="${pageContext.request.contextPath}/click/${i.tip_id}">${i.tip_title}</a>&nbsp;
                                <%--显示贴子的状态     结贴&置顶--%>
                            <c:if test="${i.tip_isKnot==1}">
                                <span class="label label-success" >结贴</span>
                            </c:if>
                            <c:if test="${i.tip_isTop==1}">
                                <span class="label label-danger" >置顶</span>
                            </c:if>
                            <br>
                            <div>
                                    <%--显示贴子对应的版块--%>

                                <a><span class="label label-primary">${i.forum.forum_name}</span></a>

                                    <%--显示贴子对应的分类--%>
                                <a><span class="label label-warning" >${i.tab.tab_name}</span></a>
                                &nbsp;&nbsp;&nbsp;
                                    <%--点击用户跳转到用户信息页面，需要传参用户id--%>
                             <c:choose>
                                 <c:when test="${i.user.user_id==sessionScope.user.user_id}">
                                     <a href="${pageContext.request.contextPath}/toUpdate_userInfo/${i.user.user_id}"><span><strong>${i.user.user_nick}</strong></span></a>
                                     <c:if test="${i.user.is_Vip==1}">
                                         <span class="label label-danger" >VIP</span>
                                     </c:if>
                                 </c:when>
                                 <c:otherwise>
                                     <a href=""><span><strong>${i.user.user_nick}</strong></span></a>
                                     <c:if test="${i.user.is_Vip==1}">
                                         <span class="label label-danger" >VIP</span>
                                     </c:if>
                                 </c:otherwise>
                             </c:choose>
                                    <%--显示贴子发表时间--%>
                                <small class="text-muted" >
                                    发表时间：<fmt:formatDate value="${i.tip_publishTime}" type="both"/>&nbsp;
                                    &nbsp;更新时间：<fmt:formatDate value="${i.tip_modifyTime}" type="both"/>
                                    <span class="label label-warning" title="点击量">${i.tip_click}次点击</span>
                                </small>
                            </div>
                        </div>
                        <div style="width: 5%;float: right;text-align: center">
                    <span class="label label-info" title="回复数">
                        <%--这里显示贴子回复量--%>
                        ${i.tip_replies}条回复
                    </span>
                        </div>
                    </div>
                </li>
            </c:if>
        </c:forEach>

    </ul>
    <c:if test="${code == 1}">
        <c:if test="${hf==true}">
            <!-- 显示分页信息 -->
            <div style="width: 100%;text-align: right;">
                <ul class="pagination" style="width: 40%">
                    <li><a href="${pageContext.request.contextPath}/main?currentPage=1">首页</a></li>
                    <c:if test="${page.hasPreviousPage}">
                        <li><a href="${pageContext.request.contextPath}/main?currentPage=${page.pageNum-1}"> <span>&laquo;</span></a></li>
                    </c:if>
                    <c:forEach items="${page.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num == page.pageNum}">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != page.pageNum }">
                            <li><a href="${pageContext.request.contextPath}/main?currentPage=${page_Num}">${page_Num}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${page.hasNextPage }">
                        <li><a href="${pageContext.request.contextPath}/main?currentPage=${page.pageNum+1 }"> <span>&raquo;</span></a></li>
                    </c:if>
                    <li><a href="${pageContext.request.contextPath}/main?currentPage=${page.pages}">末页</a></li>
                </ul>
                共<strong class="blue">${page.total}</strong>条记录，当前显示第&nbsp;<strong class="blue">${page.pageNum}&nbsp;</strong>页 总 <strong class="blue">${page.pages }</strong> 页
            </div>
        </c:if>
    </c:if>
    <c:if test="${code == 2}">
        <!-- 显示分页信息 -->
        <div style="width: 100%;text-align: right;">
            <ul class="pagination" style="width: 40%">
                <li><a href="${pageContext.request.contextPath}/sousuo?keyword=${keyword}&currentPage=1">首页</a></li>
                <c:if test="${page.hasPreviousPage}">
                    <li><a href="${pageContext.request.contextPath}/sousuo?keyword=${keyword}&currentPage=${page.pageNum-1}"> <span>&laquo;</span></a></li>
                </c:if>
                <c:forEach items="${page.navigatepageNums}" var="page_Num">
                    <c:if test="${page_Num == page.pageNum}">
                        <li class="active"><a href="#">${page_Num}</a></li>
                    </c:if>
                    <c:if test="${page_Num != page.pageNum }">
                        <li><a href="${pageContext.request.contextPath}/sousuo?keyword=${keyword}&currentPage=${page_Num}">${page_Num}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${page.hasNextPage }">
                    <li><a href="${pageContext.request.contextPath}/sousuo?keyword=${keyword}&currentPage=${page.pageNum+1 }"> <span>&raquo;</span></a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/sousuo?keyword=${keyword}&currentPage=${page.pages}">末页</a></li>
            </ul>
            共<strong class="blue">${page.total}</strong>条记录，当前显示第&nbsp;<strong class="blue">${page.pageNum}&nbsp;</strong>页 总 <strong class="blue">${page.pages }</strong> 页
        </div>
    </c:if>
</div>
<script>
    $(document).on("click",".zs",function () {
        $("#money").val("999.99");
        $("#empUpdateModel").modal("show");
    })
    //订单号
    $(function () {
        var sNow = "";
        function GetDateNow() {
            var vNow = new Date();
            sNow += String(vNow.getFullYear());
            sNow += String(vNow.getMonth() + 1);
            sNow += String(vNow.getDate());
            sNow += String(vNow.getHours());
            sNow += String(vNow.getMinutes());
            sNow += String(vNow.getSeconds());
            sNow += String(vNow.getMilliseconds());
            document.getElementById("WIDout_trade_no").value =  sNow;

        }
        GetDateNow();
    })
</script>
<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">开通会员</h4>
            </div>
            <form class="form-horizontal" action="${pageContext.request.contextPath}/aliPay">
            <div class="modal-body">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">金额</label>
                        <div class="col-sm-10">
                            <input type="text" readonly value="999.99" id="money" name="WIDtotal_amount" oninput="value=value.replace(/[^\d]/g,'')" required class="form-control"/>
                            <input type="hidden" name="WIDsubject" value="开通会员" class="form-control"/>
                            <input type="hidden" name="WIDbody"  value="开通会员" class="form-control"/>
                            <input type="hidden" id="WIDout_trade_no" name="WIDout_trade_no" class="form-control"/>
                            <span class="help-block"></span>

                        </div>
                    </div>
            </div>

            <div class="modal-footer">
                <input type="submit" class="btn btn-primary" id="emp_update_btn" value="开通"/>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
            </form>
        </div>
    </div>
</div>
<!-- 引入侧边栏文件 -->
<%@ include file="side.jsp"%>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>
</body>

<script>

</script>
</html>