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

        function fanhuikehusiliao(){
            $("#fanhuikehuziliaoform").submit();
        }

        function savesubmit(){
            var name = $.trim($("#input1").val());
            var work = $.trim($("#input2").val());
            if(name==null||name==''){
                $("#addtishispan").html("联系人姓名不能为空！");
                $("#addtishispan").css("display","block");
            }else if(work==null||work==''){
                $("#addtishispan").html("联系人职位不能为空！");
                $("#addtishispan").css("display","block");
            }else{
                $("#addForm").submit();
            }
        }

        function addfoucs(){
            $("#addtishispan").css("display","none");
        }

        function delid(id){
            $("#deleteIdInput").val(id);
        }
        function deleteById(){
            $("#deleteIdFormId").val($("#deleteIdInput").val());
            $("#deleteIdForm").attr("action","${pageContext.request.contextPath}/clientp/delete");
            $("#deleteIdForm").submit();
        }





        function updatefoucs(){
            $("#updatetishispan").css("display","none");
        }



        function xiugai(id,name,work,tel,phone,email){
            $("#updateId").val(id);

            $("#input101").val(name);
            $("#input102").val(work);
            $("#input103").val(tel);
            $("#input104").val(phone);
            $("#input105").val(email);

        }

        function updatesubmit(){
            var name = $.trim($("#input101").val());
            var work = $.trim($("#input102").val());
            if(name==null||name==''){
                $("#updatetishispan").html("联系人姓名不能为空！");
                $("#updatetishispan").css("display","block");
            }else if(work==null||work==''){
                $("#updatetishispan").html("联系人职位不能为空！");
                $("#updatetishispan").css("display","block");
            }else{
                $("#updateForm").submit();
            }
        }


    </script>
</head>
<body>
<div class="container" style="width: 100%;max-width:95%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/clientp" method="post">
                    <input type="hidden" name="clientId" value="${clientId}" id="souclientId" />
                    <div>
                        <button type="button" class="btn btn-success" data-target="#addModel" data-toggle="modal">添加联系人</button>
                        <button type="button" class="btn btn-success" onclick="fanhuikehusiliao()">返回客户资料</button>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>职位</th>
                            <th>电话</th>
                            <th>手机</th>
                            <th>Email</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="client" items="${clientPeopleList}">
                            <tr>
                                <td>${client.name}</td>
                                <td>${client.work}</td>
                                <td>${client.tel}</td>
                                <td>${client.phone}</td>
                                <td>${client.email}</td>
                                <td>
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#updateModel" onclick="xiugai('${client.id}','${client.name}','${client.work}','${client.tel}','${client.phone}','${client.email}')">修改</button>
                                    <button type="button" class="btn btn-xs btn-danger" data-toggle="modal" onclick="delid(${client.id})" data-target="#delModel">删除</button>
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

                <%-- 返回客户资料 begin --%>
                <form method="post" style="display: none;" id="fanhuikehuziliaoform" action="${pageContext.request.contextPath}/client" >
                </form>
                <%-- 返回客户资料 end --%>

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

                                <input type="hidden" name="clientId" value="${clientId}"  />

                                <input type="hidden"  name="currentPage" value="${currentPage}" >
                                <input type="hidden"  name="pageSize" value="${pageSize}">
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
                                <h4 class="modal-title" id="addModalLabel">添加联系人</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="addForm" action="${pageContext.request.contextPath}/clientp/add">
                                    <input type="hidden" name="clientId" value="${clientId}"  />

                                    <input type="hidden"  name="currentPage" value="${currentPage}" >
                                    <input type="hidden"  name="pageSize" value="${pageSize}">


                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <span id="addtishispan" style="color:red;display: none;"></span>
                                            <tr>
                                                <td><label for="input1" class="control-label">姓名</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control"  id="input1" placeholder="姓名" name="name" onfocus="addfoucs()"  required>
                                                </div></td>
                                                <td><label for="input2" class="control-label">职位</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control"  id="input2" placeholder="职位" name="work" onfocus="addfoucs()"  required>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input3" class="control-label">固定电话</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control"  id="input3" placeholder="固定电话" name="tel" onfocus="addfoucs()"  required>
                                                </div></td>
                                                <td><label for="input4" class="control-label">手机</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control"  id="input4" placeholder="客户名称" name="phone"  onfocus="addfoucs()" required>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input5" class="control-label">Email</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control"  id="input5" placeholder="客户名称" name="email" onfocus="addfoucs()"  required>
                                                </div></td>
                                                <td colspan="2"><input type="button" onclick="savesubmit()" class="btn btn-primary" style="height: 50px;width: 90%;" value="保存" /></td>
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
                                <h4 class="modal-title" id="updateModalLabel">修改客户</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="updateForm" action="${pageContext.request.contextPath}/clientp/update">
                                    <input type="hidden" id="updateId"  name="id" />

                                    <input type="hidden" name="clientId" value="${clientId}"  />

                                    <input type="hidden"  name="currentPage" value="${currentPage}" >
                                    <input type="hidden"  name="pageSize" value="${pageSize}">



                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <span id="updatetishispan" style="color:red;display: none;"></span>
                                            <tr>
                                                <td><label for="input101" class="control-label">姓名</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control"  id="input101" placeholder="姓名" name="name" onfocus="updatefoucs()"  required>
                                                </div></td>
                                                <td><label for="input102" class="control-label">职位</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control"  id="input102" placeholder="职位" name="work" onfocus="updatefoucs()"  required>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input103" class="control-label">固定电话</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control"  id="input103" placeholder="固定电话" name="tel" onfocus="updatefoucs()"  required>
                                                </div></td>
                                                <td><label for="input104" class="control-label">手机</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control"  id="input104" placeholder="客户名称" name="phone"  onfocus="updatefoucs()" required>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input105" class="control-label">Email</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control"  id="input105" placeholder="客户名称" name="email" onfocus="updatefoucs()"  required>
                                                </div></td>
                                                <td colspan="2"><input type="button" onclick="updatesubmit()" class="btn btn-primary" style="height: 50px;width: 90%;" value="保存" /></td>
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
            </div>
        </div>
    </div>
</div>
</body>
</html>
