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


    <script src="${pageContext.request.contextPath}/common/zhnw/content/purview/user/js/bootstrap-select.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/zhnw/content/purview/user/css/bootstrap-select.css">

    <script language="javascript" type="text/javascript">
        if (window.self == window.top) {
            window.top.location = "${pageContext.request.contextPath}";
        }
    </script>


    <script type="text/javascript">
        function shouye(){
            $("#currentPageHidden").val("1");
            $("#pageSizeHidden").val("10");
            $("#pageAction").submit();
        }
        function weiye(){
            $("#pageSizeHidden").val("10");
            if($("#totalPage").val()<=0){
                $("#currentPageHidden").val(1);
            }else{
                $("#currentPageHidden").val($("#totalPage").val());
            }

            $("#pageAction").submit();
        }
        function shangyiye(){
            $("#pageSizeHidden").val("10");
            var dp = parseInt($("#currentPage").val());
            var dps = dp - 1;
            if(dps > parseInt($("#totalPage").val())){
                dps = parseInt($("#totalPage").val());
            }else if(dps < 1){
                dps = 1;
            }
            $("#currentPageHidden").val(dps);
            $("#pageAction").submit();
        }
        function xiayiye(){
            $("#pageSizeHidden").val("10");
            var dp = parseInt($("#currentPage").val());
            var dps = dp + 1;
            if(dps > parseInt($("#totalPage").val())){
                dps = parseInt($("#totalPage").val());
            }else if(dps < 1){
                dps = 1;
            }
            if(dps<=0){
                $("#currentPageHidden").val(1);
            }else{
                $("#currentPageHidden").val(dps);
            }

            $("#pageAction").submit();
        }
        function tiaozhuan(){
            $("#pageSizeHidden").val("10");
            var dp = parseInt($("#currentPage").val());
            var dps = dp - 1;
            if(dps > parseInt($("#totalPage").val())){
                dps = parseInt($("#totalPage").val());
            }else if(dps < 1){
                dps = 1;
            }
            $("#currentPageHidden").val(dps);
            $("#pageAction").submit();
        }
    </script>

    <script>

        function delid(id){
            $("#deleteIdInput").val(id);
        }
        function deleteById(){
                $("#deleteIdFormId").val($("#deleteIdInput").val());
                $("#deleteIdForm").attr("action","${pageContext.request.contextPath}/user/delete");
                $("#deleteIdForm").submit();
        }

        function xiugai(id,userName,trueName,email,phone,remark){
            $("#updateId").val(id);
            $("#input101").val(userName);
            $("#input103").val(trueName);
            $("#input106").val(email);
            $("#input107").val(phone);
            $("#input108").val(remark);
        }

        function chushihua(id){
            $("#hiddenUserIdChushihua").val(id);
        }

        function chushihuasuccess(){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/initialize",
                data:{userId:$("#hiddenUserIdChushihua").val()},
                dataType:"json",
                type:"post",
                success:function(data){

                }
            });
        }

        function quchongfu(){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/quchongfu",
                data:{name:$.trim($("#input1").val())},
                dataType:"json",
                type:"post",
                success:function(data){
                    if(data){
                        $("#input1").val("");
                        $("#quchongfuspan").css("display","block");
                    }else{
                        $("#quchongfuspan").css("display","none");
                    }
                }
            });
        }

        function quchongfuupdate(id,name){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/quchongfuupdate",
                data:{name:$.trim($("#input101").val()),id:id},
                dataType:"json",
                type:"post",
                success:function(data){
                    if(data){
                        $("#input101").val("");
                        $("#quchongfuupdatespan").css("display","block");
                    }else{
                        $("#quchongfuupdatespan").css("display","none");
                    }
                }
            });
        }
    </script>
    <script type="text/javascript">
        $(window).on('load', function () {
            $('.selectpicker').selectpicker({
                'selectedText': 'cat'
            });
        });
    </script>
</head>
<body>
<div class="container" style="width: 100%;max-width:95%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/user" method="post">
                    <div>
                        <button type="button" class="btn btn-success" data-target="#addModel" data-toggle="modal">添加用户</button>
                        <button type="button" class="btn btn-success" data-target="#actorModel" data-toggle="modal" onclick="chushihuaselect()">分配角色</button>
                        用户名：<input type="text" name="userName" value="${userName}">
                        真实姓名：<input type="text" name="trueName" value="${trueName}">
                        角色：<input type="text" name="actorName" value="${actorName}">
                        <button type="submit" class="btn btn-primary">搜索用户</button>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>
                                用户名
                            </th>
                            <th>
                                真实姓名
                            </th>
                            <th>
                                邮箱
                            </th>
                            <th>
                                联系电话
                            </th>
                            <th>
                                角色
                            </th>
                            <th>
                                操作
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="user" items="${userList}">
                            <tr>
                                <td>${user.userName}</td>
                                <td>${user.trueName}</td>
                                <td>${user.email}</td>
                                <td>${user.phone}</td>
                                <td>${user.actorName}</td>
                                <td>
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#updateModel" onclick="xiugai('${user.id}','${user.userName}','${user.trueName}','${user.email}','${user.phone}','${user.remark}')">修改</button>
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#chushihuaModel" onclick="chushihua('${user.id}')">初始化密码</button>
                                    <button type="button" class="btn btn-xs btn-danger" data-toggle="modal" onclick="delid(${user.id})" data-target="#delModel">删除</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <p>
                        <input type="hidden" id="totalCount" value="${totalCount}"  />
                        <input type="hidden" id="totalPage" value="${totalPage}"  />
                        <input type="hidden" id="pageSize" value="${pageSize}"  />
                        <input type="hidden" id="currentPage" value="${currentPage}"  />
                        <input type="hidden" id="currentPageHidden" name="currentPage" value="${currentPage}"  />
                        <input type="hidden" id="pageSizeHidden" name="pageSize" value="${pageSize}"  />

                        <button type="button" class="btn btn-lg btn-default" onclick="shouye()">首页</button>
                        <button type="button" class="btn btn-lg btn-default" onclick="shangyiye()">上一页</button>
                        第<input type="text" onblur="tiaozhuan()" value="${currentPage}" style="width: 30px;height: 40px;">/${totalPage}页
                        <button type="button" class="btn btn-lg btn-default" onclick="xiayiye()">下一页</button>
                        <button type="button" class="btn btn-lg btn-default" onclick="weiye()">尾页</button>
                    </p>
                </form>
                <%-- delete begin --%>
                <div class="modal fade" id="delModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">提示框</h4>
                            </div>
                            <div class="modal-body">
                                您确定要删除此记录吗？
                            </div>
                            <input id="deleteIdInput" type="hidden">
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="deleteById()">确定</button>
                            </div>
                            <form style="display: none;" id="deleteIdForm" method="post">
                                <input type="hidden" id="deleteIdFormId" name="id">

                                <input type="hidden" id="deleteIdCurrentPage" name="currentPage" value="${currentPage}">
                                <input type="hidden" id="deleteIdpageSizes" name="pageSize" value="${pageSize}">
                                <input type="hidden" id="deleteIdUserName" name="userName" value="${userName}">
                                <input type="hidden" id="deleteIdTrueName" name="trueName" value="${trueName}">
                                <input type="hidden" id="deleteIdActorName" name="actorName" value="${actorName}">
                            </form>
                        </div>
                    </div>
                </div>
                <%-- delete end --%>

                <%-- add begin --%>
                <div class="modal fade bs-example-modal-lg" id="addModel" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-lg" style="width: 90%;">
                        <div class="modal-content" >
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="addModalLabel">添加用户</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="addForm" action="${pageContext.request.contextPath}/user/add">
                                    <input type="hidden" id="addIdCurrentPage" name="currentPage1" value="${currentPage}">
                                    <input type="hidden" id="addIdpageSizes" name="pageSize1" value="${pageSize}">
                                    <input type="hidden" id="addIdUserName" name="userName1" value="${userName}">
                                    <input type="hidden" id="addIdTrueName" name="trueName1" value="${trueName}">
                                    <input type="hidden" id="addIdActorName" name="actorName1" value="${actorName}">
                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <tr>
                                                <td><label for="input1" class="control-label">用户名</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input1" placeholder="用户名" name="userName"  onblur="quchongfu()" required><span id="quchongfuspan" style="color: red;display: none;">用户名已存在</span>
                                                </div></td>
                                                <td><label for="input2" class="control-label">密码</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input2" placeholder="密码" name="password" value="123456" readonly/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input3" class=" control-label">真实姓名</label></td>
                                                <td><div class="col-sm-10">
                                                    <input  type="text" class="form-control" id="input3" placeholder="真实姓名" name="trueName"  required/>
                                                </div></td>
                                                <td><label for="input6" class="control-label">邮箱地址</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="email" class="form-control" id="input6" placeholder="邮箱地址" name="email" required >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input7" class=" control-label">联系电话</label></td>
                                                <td><div class="col-sm-10">
                                                    <input  type="text" class="form-control" id="input7" placeholder="联系电话" name="phone"  required/>
                                                </div></td>
                                                <td>
                                                    <label for="input8" class="control-label">备注</label>
                                                </td>
                                                <td><div class="col-sm-10">
                                                    <input  type="text" class="form-control" id="input8" placeholder="备注" name="remark"  />
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><input type="submit" class="btn btn-primary" style="height: 50px;width: 92%;" value="保存" /></td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- add end --%>



                <%-- update begin --%>
                <div class="modal fade bs-example-modal-lg" id="updateModel" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-lg" style="width: 90%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="updateModalLabel">修改用户</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="updateForm" action="${pageContext.request.contextPath}/user/update">
                                    <input type="hidden" id="updateIdCurrentPage" name="currentPage1" value="${currentPage}">
                                    <input type="hidden" id="updateIdpageSizes" name="pageSize1" value="${pageSize}">
                                    <input type="hidden" id="updateIdUserName" name="userName1" value="${userName}">
                                    <input type="hidden" id="updateIdTrueName" name="trueName1" value="${trueName}">
                                    <input type="hidden" id="updateIdActorName" name="actorName1" value="${actorName}">

                                    <input type="hidden" id="updateId"  name="id" />
                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <tr>
                                                <td><label for="input101" class="control-label">用户名</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input101" placeholder="用户名" name="userName" value="${userName}" onblur="quchongfuupdate('${id}','${userName}')" required><span id="quchongfuupdatespan" style="color: red;display: none;">用户名已存在</span>
                                                </div></td>
                                                <td><label for="input102" class="control-label">密码</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input102" placeholder="密码" name="password" value="" readonly/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input103" class=" control-label">真实姓名</label></td>
                                                <td><div class="col-sm-10">
                                                    <input  type="text" class="form-control" id="input103" placeholder="真实姓名" name="trueName" value="${trueName}" required/>
                                                </div></td>
                                                <td><label for="input106" class="control-label">邮箱地址</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="email" class="form-control" id="input106" placeholder="邮箱地址" name="email" value="${email}" >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input107" class=" control-label">联系电话</label></td>
                                                <td><div class="col-sm-10">
                                                    <input  type="text" class="form-control" id="input107" placeholder="联系电话" name="phone" value="${phone}" />
                                                </div></td>
                                                <td>
                                                    <label for="input108" class="control-label">备注</label>
                                                </td>
                                                <td><div class="col-sm-10">
                                                    <input  type="text" class="form-control" id="input108" placeholder="备注" name="remark" value="${remark}" />
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><input type="submit" class="btn btn-primary" style="height: 50px;width: 92%;" value="保存" /></td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- update end --%>
                <%-- actor begin --%>
                <div class="modal fade bs-example-modal-lg" id="actorModel" tabindex="-1" role="dialog" aria-labelledby="actorModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-lg" style="width: 90%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="actorModalLabel">分配角色</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="actorForm" action="${pageContext.request.contextPath}/user/userActor">
                                    <input type="hidden" id="actorIdCurrentPage" name="currentPage1" value="${currentPage}">
                                    <input type="hidden" id="actorIdpageSizes" name="pageSize1" value="${pageSize}">
                                    <input type="hidden" id="actorIdUserName" name="userName1" value="${userName}">
                                    <input type="hidden" id="actorIdTrueName" name="trueName1" value="${trueName}">
                                    <input type="hidden" id="actorIdActorName" name="actorName1" value="${actorName}">
                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <tr>
                                                <td><label for="input101" class="control-label">用户名：</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="userNameSelect" name="userId" class="selectpicker bla bla bli"  data-live-search="true">
                                                        <c:forEach var="user" items="${users}">
                                                            <option value="${user.id}">${user.userName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div></td>
                                                <td><label for="input102" class="control-label">角色：</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="actorNameSelect" name="actorId" class="selectpicker bla bla bli"  data-live-search="true">
                                                        <c:forEach var="actor" items="${actors}">
                                                            <option value="${actor.id}">${actor.actorName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><input type="submit" class="btn btn-primary" style="height: 50px;width: 85%;" value="保存" /></td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- actor end --%>
                <%-- chushihua begin --%>
                <div class="modal fade" id="chushihuaModel" tabindex="-1" role="dialog" aria-labelledby="chushihuaModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="chushihuaModalLabel">提示框</h4>
                            </div>
                            <div class="modal-body">
                                确定初始化密码为123456？
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="chushihuasuccess()">确定</button>
                                <input type="hidden" id="hiddenUserIdChushihua" />
                            </div>
                        </div>
                    </div>
                </div>
                <%-- chushihua end --%>
            </div>
        </div>
    </div>
</div>
</body>
</html>
