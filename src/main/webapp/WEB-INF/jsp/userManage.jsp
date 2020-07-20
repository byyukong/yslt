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
    <title>用户管理 - 论坛</title>
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
            /* border: 1px solid gray; */
        }
        .blue{
            color: deeppink;
        }
    </style>
</head>
<body>

<!-- 引入header文件 -->
<%@ include file="header.jsp"%>
<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">用户修改</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Username</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="user_email" id="email_update_input" placeholder="email@bdqn.com">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Power</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="user_type" id="power_update_input" placeholder="0是超级管理员,1是管理员,2是普通用户">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>


<%--<div class="panel panel-default"
     style="width: 90%;margin-left: 5%; margin-right: 5%; margin-bottom: 5%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">用户管理</h3>
    </div>
    <div class="panel-body">
        <!-- 这里显示所有用户信息 -->
        <table class="table">
            <thead>
            <tr>
                <th>用户ID</th>
                <th>用户名</th>
                <th>用户昵称</th>
                &lt;%&ndash;不显示用户密码 2020-03-04 11:02&ndash;%&gt;
                &lt;%&ndash;<th>用户密码</th>&ndash;%&gt;
                <th>用户权限</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <!-- 这里是表格内容，需要遍历数组 -->
            <tr>
                <td>1</td>
                <td>yukong</td>
                <td>yusheng</td>
                &lt;%&ndash;不显示用户密码 2020-03-04 11:02&ndash;%&gt;
                &lt;%&ndash;<td>${user.user_password}</td>&ndash;%&gt;
                <td>
                    <span class="label label-success">超级管理员</span>
                    <span class="label label-warning">管理员</span>
                    <span class="label label-primary">普通用户</span>
                <td>
                    <span class="label label-danger">禁用</span>
                    <span class="label label-warning">锁定</span>
                </td>
                <td><!-- 这里放操作按钮 -->
                    &lt;%&ndash;处理其它正常的用户：管理员不能处理自己的状态&ndash;%&gt;
                    &lt;%&ndash;管理员不能处理其它管理员&ndash;%&gt;
                    &lt;%&ndash;管理员可处理普通用户&ndash;%&gt;
                    <input type="button" class="btn btn-primary" value="修改"/>
                    <input type="button" class="btn btn-warning" value="锁定"/>
                    <input type="button" class="btn btn-danger" value="禁用"/>
                    <input type="button" class="btn btn-success" value="解锁"/>
                    <input type="button" class="btn btn-success" value="启用"/>
                    <!-- 如果对方是超级管理员 无操作 -->
                </td>
            </tr>
            </tbody>
        </table>
        <input type="button" class="btn btn-default" value="返回"/>
    </div>
</div>--%>
<div class="panel panel-default"
     style="width: 90%;margin-left: 5%; margin-right: 5%; margin-bottom: 5%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">用户管理</h3>
    </div>
    <div class="panel-body">

        <!-- 这里显示所有用户信息 -->
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>用户ID</th>
                <th>用户名</th>
                <th>用户昵称</th>
                <th>邮箱</th>
                <th>用户权限</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <!-- 这里是表格内容，需要遍历数组 -->

            <c:forEach items="${page.list}" var="i">
                <tr>
                    <td>${i.user_id}</td>
                    <td>${i.user_name}</td>
                    <td>${i.user_nick}</td>
                    <td>${i.user_email}</td>

                    <td>
                        <c:if test="${i.user_type eq 0}">
                            <span class="label label-success">超级管理员</span>
                        </c:if>
                        <c:if test="${i.user_type eq 1}">
                            <span class="label label-warning">管理员</span>
                        </c:if>
                        <c:if test="${i.user_type eq 2}">
                            <span class="label label-primary">普通用户</span>
                        </c:if>
                        <c:if test="${i.is_Vip==1}">
                            <span class="label label-danger" >VIP</span>
                        </c:if>
                    </td>


                    <td>

                        <c:if test="${i.user_status eq 0}">
                            <p class="info">正常</p>
                        </c:if>

                        <c:if test="${i.user_status eq 1}">
                            <p class="danger">封禁</p>
                        </c:if>

                        <c:if test="${i.user_status eq 2}">
                            <p class="warning">锁定</p>
                        </c:if>
                        <c:if test="${i.user_status eq 3}">
                            <p class="warning">未激活</p>
                        </c:if>

                    </td>

                    <td>
                        <%--<c:if test="${i.user_type eq 0}">
                            <input type="button" class="btn btn-primary edit_btn" attr1="${i.user_id}" value="修改"/>
                        </c:if>--%>
                        <c:if test="${sessionScope.user.user_type==0}">
                            <c:if test="${i.user_type eq 1}">
                                <input type="button" class="btn btn-primary edit_btn" attr1="${i.user_id}" value="修改"/>

                                <c:if test="${i.user_status eq 0 || i.user_status eq 2}">
                                    <input type="button" class="btn btn-danger  enable_btn "attr1="${i.user_id}" value="禁用"/>
                                </c:if>

                                <c:if test="${i.user_status eq 1}">
                                    <input type="button" class="btn btn-danger  enable_btn "attr1="${i.user_id}" value="解禁"/>
                                </c:if>
                                <%--<input type="button" class="btn btn-default delete_btn" attr2="${i.user_id}" value="删除"/>--%>
                            </c:if>
                        </c:if>

                        <c:if test="${i.user_type eq 2}">

                            <input type="button"  class="btn btn-primary edit_btn" attr1="${i.user_id}" value="修改"/>

                            <c:if test="${i.user_status eq 0}">
                                <input type="button" class="btn btn-warning lock_btn" attr1="${i.user_id}" value="锁定"/>
                            </c:if>

                            <c:if test="${i.user_status eq 2}">
                                <input type="button" class="btn btn-warning lock_btn" attr1="${i.user_id}" value="解锁"/>
                            </c:if>

                            <c:if test="${i.user_status eq 0 || i.user_status eq 2}">
                                <input type="button" class="btn btn-danger  enable_btn "attr1="${i.user_id}" value="禁用"/>
                            </c:if>

                            <c:if test="${i.user_status eq 1}">
                                <input type="button" class="btn btn-danger  enable_btn "attr1="${i.user_id}" value="解禁"/>
                            </c:if>

                            <%--<input type="button" class="btn btn-default delete_btn" attr2="${i.user_id}" value="删除"/>--%>

                        </c:if>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!-- 显示分页信息 -->
        <div style="width: 100%;text-align: right;">
            <ul class="pagination" style="width: 40%">
                <li><a href="${pageContext.request.contextPath}/userInfo?currentPage=1">首页</a></li>
                <c:if test="${page.hasPreviousPage}">
                    <li><a href="${pageContext.request.contextPath}/userInfo?currentPage=${page.pageNum-1}"> <span>&laquo;</span></a></li>
                </c:if>
                <c:forEach items="${page.navigatepageNums}" var="page_Num">
                    <c:if test="${page_Num == page.pageNum}">
                        <li class="active"><a href="#">${page_Num}</a></li>
                    </c:if>
                    <c:if test="${page_Num != page.pageNum }">
                        <li><a href="${pageContext.request.contextPath}/userInfo?currentPage=${page_Num}">${page_Num}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${page.hasNextPage }">
                    <li><a href="${pageContext.request.contextPath}/userInfo?currentPage=${page.pageNum+1 }"> <span>&raquo;</span></a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/userInfo?currentPage=${page.pages}">末页</a></li>
            </ul>
            共<strong class="blue">${page.total}</strong>条记录，当前显示第&nbsp;<strong class="blue">${page.pageNum}&nbsp;</strong>页 总 <strong class="blue">${page.pages }</strong> 页
        </div>
        <input type="button" class="btn btn-default turn_back" value="返回"/>
    </div>
</div>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>

<script>
    //清空表单数据
    function reset_form(ele) {
        //清空表单的数据
        $(ele)[0].reset();
        //清空表单的样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //给修改按钮绑定事件  使用动态绑定
    $(document).on("click",".edit_btn",function () {

        getEmp($(this).attr("attr1"));

        $("#emp_update_btn").attr("attr2",$(this).attr("attr1"));
        //3.弹出模态框
        $("#empUpdateModel").modal({
            backdrop:"static"
        })
    });

    //查询员工信息
    function getEmp(id) {
        $.ajax({
            "url":"${pageContext.request.contextPath}/emp/"+id,
            "type":"get",
            "dataType":"json",
            "success":function (result) {
                // console.log(result);
                var users=result.extend.user;
                //显示数据到模态框
                $("#empName_update_static").text(users.user_name);
                $("#email_update_input").val(users.user_email);
                $("#power_update_input").val([users.user_type]);
            },
            "error":function () {
                alert("在查询员工信息时发生错误!");
            }
        })
    }

    //点击更新,更新员工信息
    $("#emp_update_btn").click(function () {

        $.ajax({
            "url":"${pageContext.request.contextPath}/emp1/"+$(this).attr("attr2"),
            "type":"GET",
            "data":$("#empUpdateModel form").serialize(),
            "success":function (result) {
                /* alert(result.msg);*/
                $("#empUpdateModel").modal('hide');
                alert("修改成功！")
                location.href="/userInfo";
            },
            "error":function () {
                alert("错误!");
            }
        })
    })

    function del_User(id){
        $.ajax({
            "url":"${pageContext.request.contextPath}/emp_del/"+id,
            "type":"get",
            "success":function (result) {
                if(result.code==100){
                    alert("删除成功")
                    location.href="/userInfo";
                }else {
                    alert("删除失败")
                }
            },
            "error":function () {
                alert("在删除员工信息时发生错误!");
            }
        })
    }

    //锁定
    $(".lock_btn").click(function () {

        var flag = $(this).val();

        var status=0;

        if(flag=="锁定"){
            status=2;
        }else if (flag=="解锁"){
            status=0;
        }
        $.ajax({
            "url":"${pageContext.request.contextPath}/emp2/"+$(this).attr("attr1"),
            "type":"GET",
            "data": {status1:status},
            "success":function (result) {
                alert("修改成功！")
                location.href="/userInfo";
            },
            "error":function () {
                alert("错误!");
            }
        })
    })

    //禁用
    $(".enable_btn").click(function () {

        var flag = $(this).val();

        var status=0;

        if(flag=="禁用"){
            status=1;
        }else if (flag=="解禁"){
            status=0;
        }

        $.ajax({
            "url":"${pageContext.request.contextPath}/emp3/"+$(this).attr("attr1"),
            "type":"GET",
            "data": {status2:status},
            "success":function (result) {
                alert("修改成功！")
                location.href="/userInfo";
            },
            "error":function () {
                alert("错误!");
            }
        })
    })

    //给删除按钮绑定事件  使用动态绑定
    $(document).on("click",".delete_btn",function () {
        del_User($(this).attr("attr2"));
    });

    $(".turn_back").click(function () {
        location.href="/main"
    })

</script>

</body>
</html>