<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 这是侧边栏 -->
<style>
    .bg{
        background-color: #EFEFEF;
    }
</style>

<script>
    $(document).on("mouseover","ul li",function () {
        $(this).addClass("bg");
    });
    $(document).on("mouseout","ul li",function () {
        $(this).removeClass("bg");
    });
    $(document).on("click",".fb",function () {
        location.href="${pageContext.request.contextPath}/goAddTip";
    })
    $(document).on("click",".gly",function () {
        location.href="${pageContext.request.contextPath}/toRegis";
    })
    $(document).on("click",".yhgl",function () {
        location.href="${pageContext.request.contextPath}/userInfo";
    })
    $(document).on("click",".tzgl",function () {
        location.href="${pageContext.request.contextPath}/toTipAdministration";
    })
    $(document).on("click",".bkgl",function () {
        location.href="${pageContext.request.contextPath}/toForumManage";
    })
    $(document).on("click",".flgl",function () {
        location.href="${pageContext.request.contextPath}/toTab";
    })
</script>
<!-- 未登录 -->
<c:choose>
    <c:when test="${sessionScope.user.user_name==null}">
        <div class="panel panel-default" id="sidebar2" style="width: 20%;margin:1% 2% 1% 0%;float: right">
            <div class="panel-heading" style="background-color: white;text-align: center">
                <blockquote>
                    论坛
                    <small>中华万里腾飞，逍遥古今中外</small>
                </blockquote>
            </div>
            <ul class="list-group" style="width: 100%">
                <li class="list-group-item">
                    <a href="${pageContext.request.contextPath}/toLogin" class="btn btn-primary btn-block">登录</a>
                    <a href="${pageContext.request.contextPath}/toRegis" class="btn btn-default btn-block">注册</a>
                </li>
            </ul>
        </div>
    </c:when>
    <c:otherwise>
        <div class="panel panel-default" id="sidebar2" style="width: 20%;margin:1% 2% 1% 0%;float: right">
            <div class="panel-heading" style="background-color: white;text-align: center">欢迎您！
                <%--展示用户昵称--%>
                <a href="${pageContext.request.contextPath}/toUpdate_userInfo/${sessionScope.user.user_id}">${sessionScope.user.user_nick}</a>
                <%--展示用户权限需要判断--%>
                <c:choose>
                    <%--<c:when test="${sessionScope.user.user_type==0}">
                        <span class="label label-success">超级管理员</span>
                    </c:when>
                    <c:when test="${sessionScope.user.user_type==1}">
                        <span class="label label-warning">管理员</span>
                    </c:when>--%>


                    <%--<c:when test="${sessionScope.user.user_type==0 && sessionScope.user.is_Vip==1}">
                        <span class="label label-danger" >超级VIP</span>
                    </c:when>--%>
                    <c:when test="${sessionScope.user.user_type==0}">
                        <%--展示用户权限--%>
                        <span class="label label-success">超级管理员</span>
                    </c:when>


                    <%--<c:when test="${sessionScope.user.user_type==1 && sessionScope.user.is_Vip==1}">
                        <span class="label label-danger" >VIP</span>
                    </c:when>--%>
                    <c:when test="${sessionScope.user.user_type==1}">
                        <span class="label label-warning">管理员</span>
                    </c:when>



                    <c:when test="${sessionScope.user.user_type==2 && sessionScope.user.is_Vip==1}">
                        <span class="label label-danger" >VIP</span>
                    </c:when>
                    <c:when test="${sessionScope.user.user_type==2}">
                        <span class="label label-default">普通用户</span>
                    </c:when>
                </c:choose>

            </div>
            <c:choose>
                <c:when test="${sessionScope.user.user_type==0}">
                    <ul class="list-group" style="width: 100%">
                            <%--被锁定的用户不能发贴  不显示发帖--%>
                        <c:if test="${sessionScope.user.user_status!=2}">
                            <li class="list-group-item fb">
                                <a href="${pageContext.request.contextPath}/goAddTip">发表新贴</a>
                            </li>
                        </c:if>
                            <%--超管特有    判断是否是超管--%>
                        <li class="list-group-item gly">
                            <a href="${pageContext.request.contextPath}/toRegis">注册新的管理员</a>
                        </li>
                        <%--管理员功能 2020-07-4 22:33--%>
                        <li class="list-group-item yhgl"><a href="${pageContext.request.contextPath}/userInfo">用户管理</a></li>
                        <li class="list-group-item tzgl"><a href="${pageContext.request.contextPath}/toTipAdministration">贴子管理</a></li>
                        <li class="list-group-item bkgl"><a href="${pageContext.request.contextPath}/toForumManage">版块管理</a></li>
                        <li class="list-group-item flgl"><a href="${pageContext.request.contextPath}/toTab">分类管理</a></li>
                    </ul>
                </c:when>
                <c:when test="${sessionScope.user.user_type==1}">
                    <ul class="list-group" style="width: 100%">
                        <%--被锁定的用户不能发贴  不显示发帖--%>
                        <c:if test="${sessionScope.user.user_status!=2}">
                            <li class="list-group-item fb">
                                <a href="${pageContext.request.contextPath}/goAddTip">发表新贴</a>
                            </li>
                        </c:if>
                        <%--管理员功能 2020-07-04 22:33--%>
                        <li class="list-group-item yhgl"><a href="${pageContext.request.contextPath}/userInfo">用户管理</a></li>
                        <li class="list-group-item tzgl"><a href=    "${pageContext.request.contextPath}/toTipAdministration">贴子管理</a></li>
                        <li class="list-group-item bkgl"><a href="${pageContext.request.contextPath}/toForumManage">版块管理</a></li>
                        <li class="list-group-item flgl"><a href="${pageContext.request.contextPath}/toTab">分类管理</a></li>
                    </ul>
                </c:when>
                <c:when test="${sessionScope.user.user_type==2}">
                    <ul class="list-group" style="width: 100%">
                        <%--被锁定的用户不能发贴  不显示发帖--%>
                        <c:if test="${sessionScope.user.user_status!=2}">
                            <li class="list-group-item fb">
                                <a href="${pageContext.request.contextPath}/goAddTip">发表新贴</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.user.is_Vip!=1}">
                           <li class="list-group-item kthy"><a class="zs" href="#">开通会员</a></li>
                        </c:if>
                    </ul>
                </c:when>
            </c:choose>
        </div>
    </c:otherwise>
</c:choose>
<!-- 已登录 -->

</div>
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
<script>
    $(document).on("click",".zs",function () {
        $("#money").val("999.99");
        $("#empUpdateModel").modal("show");
    })
    $(document).on("click",".kthy",function () {
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