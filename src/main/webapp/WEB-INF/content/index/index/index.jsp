<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>中翰内网</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="中翰内部管理系统">
    <meta name="author" content="blues">
    <link rel="icon" href="${pageContext.request.contextPath}/common/zhnw/content/index/index/img/logo.jpg">

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/bootstrap/css/bootstrap.min.css">

    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/bootstrap/css/bootstrap-theme.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/jquery/jquery-1.8.3.min.js"></script>



    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/zhnw/content/index/index/css/index.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/zhnw/content/purview/user/css/bootstrap-select.css">

    <script>
        function login(){
            var name = $("#username").val();
            var pass = $("#password").val();
            if(isLetterAndNum(name)&&isLetterAndNum(pass)){
                $("#prompt").css("display","none");
                $.ajax({
                    url:"${pageContext.request.contextPath}/loginTest",
                    data:{userName:name,password:pass},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if(data){
                            $("#loginForm").submit();
                        }else{
                            $("#prompt").html("用户名或密码有误，请从新输入！");
                            $("#prompt").css("display","block");
                            $("#username").val("");
                            $("#password").val("");
                        }
                    }
                });
            }else{
                $("#prompt").html("用户名和密码只能是字母或者数字,且不能为空！");
                $("#prompt").css("display","block");
                $("#username").val("");
                $("#password").val("");
            }
        }

        function isLetterAndNum(value){
            var strExp=/^[A-Za-z0-9]+$/;
            if(strExp.test(value)){
                return    true;
            }else{
                return   false;
            }
        }

        function pnone(){
            $("#prompt").css("display","none");
        }
    </script>
</head>

<body>
<div class="box">
    <div class="login-box">
        <div class="login-title text-center">
            <h1><small>登&nbsp;&nbsp;&nbsp;录</small></h1>
        </div>
        <div class="login-content " >
            <div class="form">
                <form id="loginForm" action="${pageContext.request.contextPath}/main" method="post">
                    <span id="prompt" style="color:red;display: none;margin-left: 20px;"></span>
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input type="text" id="username" name="username" onfocus="pnone()" class="form-control" placeholder="用户名" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="password" id="password" onfocus="pnone()" name="password" class="form-control" placeholder="密码" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-actions" style="text-align: center;">
                        <div class="col-xs-4 col-xs-offset-4 " style="text-align: center;width: 100%;">
                            <button type="button" onclick="login()" class="btn btn-sm btn-info" style="width: 100%;"><span class="glyphicon glyphicon-off"></span>&nbsp;登录</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-6 link">
                            <input type="hidden" data-target="#zhaohuimimaModel" data-toggle="modal" id="zhaohuimimaHiddenInput"/>
                            <p class="text-center remove-margin"><small><%--忘记密码?--%></small> <a href="javascript:void(0)" onclick="zhaohuimima()"><small><%--找回--%></small></a>
                            </p>
                        </div>
                        <div class="col-xs-6 link">
                            <input type="hidden" data-target="#zhuceModel" data-toggle="modal" id="zhuceHiddenInput"/>
                            <p class="text-center remove-margin"><small><%--还没注册?--%></small> <a href="javascript:void(0)" onclick="zhuce()"><small><%--注册--%></small></a>
                            </p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/common/zhnw/content/purview/user/js/bootstrap-select.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
