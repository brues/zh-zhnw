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

        <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
        <script src="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/bootstrap/js/bootstrap.min.js"></script>

        <script language="javascript" type="text/javascript">
            if (window.self == window.top) {
                window.top.location = "${pageContext.request.contextPath}";
            }
        </script>


        <script>

            function isLetterAndNum(value){
                var strExp=/^[A-Za-z0-9]+$/;
                if(strExp.test(value)){
                    return true;
                }else{
                    return false;
                }
            }

            function change(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/passwordOk",
                    data:{password:$("#password").val()},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if($("#newpassword").val()==null||$.trim($("#newpassword").val()).length==0){
                            $("#xinmimaspan").html("新密码不能为空！");
                            $("#xinmimaspan").css("display","block");
                            $("#newpassword").val("");
                        }else if(data=="0"){
                            $("#xinmimaspan").html("原始新密码不正确，请从新输入！");
                            $("#xinmimaspan").css("display","block");
                        }else if(!isLetterAndNum($("#newpassword").val())){
                            $("#xinmimaspan").html("新密码只能是字母或数字！");
                            $("#xinmimaspan").css("display","block");
                        }else if(data=="1"){
                            $("#chageForm").submit();
                        }

                    }
                });
            }

            function newpassfocus(){
                $("#xinmimaspan").css("display","none");
            }
        </script>
    </head>
    <body>
        <div class="container" style="width: 100%;height: 100%;padding-top: 30px;"><div class="container-fluid" ><div class="row-fluid"><div class="span12">
            <form id="chageForm" method="post" action="${pageContext.request.contextPath}/user/changes">
                <div class="form-group">
                    <label for="password">原始密码：</label>
                    <input type="password" class="form-control" id="password" placeholder="Password" onfocus="newpassfocus()" required>
                </div>
                <div class="form-group">
                    <label for="newpassword">新密码：</label>
                    <input type="password" class="form-control" name="password" onfocus="newpassfocus()" id="newpassword" placeholder="New Password"  required><span id="xinmimaspan" style="display: none;color:red;"></span>
                </div>
                <input type="button" value="确定" onclick="change()" class="btn btn-primary" style="width: 100%;height: 50px;">
            </form>
            <button type="button" data-toggle="modal" data-target="#tishiModel" style="display: none;" id="cuobtn"></button>
            <div class="modal fade" id="tishiModel" tabindex="-1" role="dialog" aria-labelledby="tishiModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="tishiModalLabel">提示框</h4>
                        </div>
                        <div class="modal-body">
                            你输入的原始密码不正确！
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                        </div>
                    </div>
                </div>
            </div>

            <button type="button" data-toggle="modal" data-target="#nullModel" style="display: none;" id="nullbtn"></button>
            <div class="modal fade" id="nullModel" tabindex="-1" role="dialog" aria-labelledby="tishiModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="nullModalLabel">提示框</h4>
                        </div>
                        <div class="modal-body">
                            新密码不能为空！
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                        </div>
                    </div>
                </div>
            </div>
        </div></div></div></div>

    </body>
</html>
