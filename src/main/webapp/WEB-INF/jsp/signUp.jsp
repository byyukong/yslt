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
    <title>用户注册</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
    <style>
        li {
            list-style-type: none;
        }

        html, body {
            height: 100%;
            font-size: 14px;
            color: #525252;
            font-family: NotoSansHans-Regular, AvenirNext-Regular, arial, Hiragino Sans GB, "Microsoft Yahei", "Hiragino Sans GB", "WenQuanYi Micro Hei", sans-serif;
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
            border: 1px;
            clear: both
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

        a {
            color: #8A8A8A;
            cursor: pointer;
        }
    </style>
</head>
<body>
<script>
    $(function () {
        $("#sub").click(function () {
            var user_name=$("#user_name").val();
            var userNameErr=$("#userNameErr");
            var user_name_yz=/^[a-zA-Z]\w{3,12}$/;

            var user_nick=$("#user_nick").val();
            var userNickErr=$("#userNickErr");
            var user_nick_yz=/^[\u4e00-\u9fa5]{2,6}$/;

            var user_password=$("#user_password").val();
            var userPwdErr=$("#userPwdErr");
            var user_password_yz=/^[\s\S]{6,12}/;

            var user_qrpassword=$("#user_qrpassword").val();
            var userPwdQrErr=$("#userPwdQrErr");

            var user_email=$("#user_email").val();
            var userEmailErr=$("#userEmailErr");
            var user_email_yz=/^\w{3,12}@\w{1,5}\.[a-z]{2,3}$/;

            /*var user_verificationCode=$("#user_verificationCode").val();
            var userVerificationCodeErr=$("#userVerificationCodeErr");*/
            if(user_name==""){
                $("#user_name").focus();
                userNameErr.css("color","red");
                userNameErr.text("用户名不能为空！");
                return false;
            }else if(user_name_yz.test(user_name)==false){
                $("#user_name").focus();
                userNameErr.css("color","red");
                userNameErr.text("用户名格式不正确，只能以字母开头，4到13位（字母，数字，下划线，减号）！");
                return false;
            }else if(user_nick==""){
                userNameErr.text("");
                $("#user_nick").focus();
                userNickErr.text("昵称不能为空！");
                return false;
            }else if(user_nick_yz.test(user_nick)==false){
                $("#user_nick").focus();
                userNickErr.text("昵称只能是2~6位中文！");
                return false;
            }else if(user_password==""){
                userNickErr.text("");
                $("#user_password").focus();
                userPwdErr.text("密码不能为空！");
                return false;
            }else if(user_password_yz.test(user_password)==false){
                $("#user_password").focus();
                userPwdErr.text("密码格式不正确，6-12位！");
                return false;
            }else if(user_qrpassword==""){
                $("#user_qrpassword").focus();
                userPwdErr.text("");
                userPwdQrErr.text("确认密码不能为空！")
                return false;
            }else if(user_qrpassword!=user_password){
                $("#user_qrpassword").focus();
                userPwdQrErr.text("两次密码不一致！")
                return false;
            }else if(user_email==""){
                userPwdQrErr.text("");
                $("#user_email").focus();
                userEmailErr.text("邮箱不能为空！");
                return false;
            }else if(user_email_yz.test(user_email)==false){
                $("#user_email").focus();
                userEmailErr.text("邮箱格式不正确，例如：1719549607@qq.com！");
                return false;
            }/*else if(user_verificationCode==""){
                userEmailErr.text("");
                $("#user_verificationCode").focus();
                userVerificationCodeErr.text("验证码不能为空！");
                return false;
            }*/else{
                //userVerificationCodeErr.text("");
                return true;
            }
        })
        /*$("#vc").click(function () {
            var count = 60;
            var countdown = setInterval(CountDown, 1000);
            $("#vc").attr("disabled", true);
            function CountDown() {
                $("#vc").text(count + "秒后重新获取");
                if (count == 0) {
                    $("#vc").text("获取验证码").removeAttr("disabled");
                    clearInterval(countdown);
                }
                count--;
            }
            return true;
        })*/
        $("#user_name").blur(function () {
            var name= $(this).val();
            var userNameErr=$("#userNameErr");

            var user_name=$("#user_name").val();
            var user_name_yz=/^[a-zA-Z]\w{3,12}$/;
            $.ajax({
                url:"${pageContext.request.contextPath}/uniquenessName",
                type:"post",
                data:{"name":name},
                dataType:"text",
                success:function (result) {
                    if(name!=""){
                        if (result!="0"){
                            userNameErr.css("color","green");
                            userNameErr.text("用户名可以使用！");
                            $("#sub").attr("disabled", false);
                        }else{
                            userNameErr.css("color","red");
                            userNameErr.text("用户名已被使用！");
                            $("#sub").attr("disabled", true);
                        }
                        if(user_name_yz.test(user_name)==false){
                            $("#user_name").focus();
                            userNameErr.css("color","red");
                            userNameErr.text("用户名格式不正确，只能以字母开头，4到13位（字母，数字，下划线，减号）！");
                        }
                    }
                },
                error:function () {
                    alert("获取用户名失败！")
                }
            })
        })
        $("#user_email").blur(function () {
            var email= $(this).val();
            var userEmailErr=$("#userEmailErr");

            var user_email=$("#user_email").val();
            var user_email_yz=/^\w{3,12}@\w{1,5}\.[a-z]{2,3}$/;
            $.ajax({
                url:"${pageContext.request.contextPath}/uniquenessEmail",
                type:"post",
                data:{"email":email},
                dataType:"text",
                success:function (result) {
                    if(email!=""){
                        if (result!="0"){
                            userEmailErr.css("color","green");
                            userEmailErr.text("邮箱可以使用！");
                            $("#sub").attr("disabled", false);
                        }else{
                            userEmailErr.css("color","red");
                            userEmailErr.text("邮箱已被使用！");
                            $("#sub").attr("disabled", true);
                        }
                        if(user_email_yz.test(user_email)==false){
                            $("#user_name").focus();
                            userEmailErr.css("color","red");
                            userEmailErr.text("邮箱格式不正确，例如：1719549607@qq.com！");
                        }
                    }
                },
                error:function () {
                    alert("获取用户名失败！")
                }
            })
        })

    })
</script>
<%--引入header导航栏--%>
<%@ include file="header.jsp" %>

<div class="panel panel-default" id="login" style="width: 80%;margin-left: 20%;margin-top: 5%;margin-bottom: 5%;border:2px solid #a1a1a1;padding:20px 40px;width:60%;border-radius:25px;">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">注册</h3>
    </div>
    <div class="panel-body">
        <form action="${pageContext.request.contextPath}/regis" method="POST" id="mySignUpForm" class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-6" style="width: 40%;">
                    <span style="color:red">*必填，用于登录，注册后不可修改。</span>
                    <input type="text" class="form-control" id="user_name" name="user_name"/>
                    <span id="userNameErr" style="color:red"></span>
                </div>
                <div class="col-sm-4">
                    <p class="form-control-static">用户名：</p>
                    <p class="form-control-static">（1）不超过13位字符（含）</p>
                    <p class="form-control-static">（2）可以是字母、数字、下划线、减号</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">昵称</label>
                <div class="col-sm-6" style="width: 40%;">
                    <input type="text" class="form-control" id="user_nick" name="user_nick"/>
                    <span id="userNickErr" style="color:red"></span>
                </div>
                <div class="col-sm-4">
                    <p class="form-control-static">注册后可修改。</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">密码</label>
                <div class="col-sm-6" style="width: 40%;">
                    <span style="color:red">*必填，用于登录</span>
                    <input type="password" class="form-control" id="user_password" name="user_password"/>
                    <span id="userPwdErr" style="color:red"></span>
                </div>
                <div class="col-sm-4">
                    <p class="form-control-static">密码至少6位字符，可以是字母、数字、下划线</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">密码</label>
                <div class="col-sm-6" style="width: 40%;">
                    <span style="color:red">*必填，用于登录</span>
                    <input type="password" class="form-control" id="user_qrpassword" name="qruser_password"/>
                    <span id="userPwdQrErr" style="color:red"></span>
                </div>
                <div class="col-sm-4">
                    <p class="form-control-static">密码至少6位字符，可以是字母、数字、下划线</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">邮箱</label>
                <div class="col-sm-6" style="width: 40%;">
                    <span style="color:red">*必填</span>
                    <input type="text" class="form-control" id="user_email" name="user_email"/>
                    <span id="userEmailErr" style="color:red"></span>
                </div>
                <div class="col-sm-4">
                    <p class="form-control-static">邮箱必须包含@.例如：1719549607@qq.com</p>
                </div>
            </div>
            <%--<div class="form-group">
                <label class="col-sm-2 control-label">验证码</label>
                <div class="col-sm-6" style="width: 40%;">
                    <span style="color:red">*必填</span>
                    <input type="text" class="form-control" id="user_verificationCode" name="user_password"/>
                    <br>
                    <button id="vc" type="button" class="btn btn-info">获取验证码</button>
                    <span id="userVerificationCodeErr" style="color:red"></span>
                </div>
                <div class="col-sm-4">
                    <p class="form-control-static"></p>
                </div>
            </div>--%>
            <div class="form-group">
                <label class="col-sm-2 control-label">注册用户类型：</label>
                <div class="col-sm-10" style="width: 20%">
                    <select class="form-control" id="user_type" name="user_type">
                        <c:if test="${sessionScope.user.user_type==0}">
                            <!-- 超级管理员可以注册管理员 -->
                            <option value="1" selected>管理员</option>
                        </c:if>
                        <!-- 超级管理员没有登录 -->
                        <option value="2">普通用户</option>
                    </select>
                </div>
            </div>

            <a href="${pageContext.request.contextPath}/main" type="button" class="btn btn-default"  style="margin-left: 5%">返回</a>
            <a href="${pageContext.request.contextPath}/toLogin" type="button" class="btn btn-success"  style="margin-left: 25%">登录</a>
            <%--<input type="button" class="btn btn-success" value="登录"
                   style="margin-left: 25%"/>--%>
            <input id="sub" type="submit" class="btn btn-primary" value="注册"
                   style="margin-left: 5%"/>

        </form>

    </div>
</div>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp" %>

<script>

</script>
</body>
</html>