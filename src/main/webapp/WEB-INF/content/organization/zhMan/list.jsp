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


    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/zhnw/content/purview/user/css/bootstrap-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.css">


    <script language="javascript" type="text/javascript">
        if (window.self == window.top) {
            window.top.location = "${pageContext.request.contextPath}";
        }
    </script>

    <%--  分页 begin  --%>
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
    <%--  分页 end  --%>

    <%-- add begin --%>
    <script>
        function beforeSave(){
            $("#input1").val("");
            $("#input2").val("");
            $("#input8").val("");
            $("#input9").val("");
            $("#input3").val("");
        }

        function saveBtn(){
            var name = $.trim($("#input1").val());
            var contactMan = $.trim($("#input2").val());
            var tel = $.trim($("#input8").val());
            var phone = $.trim($("#input9").val());
            var email = $.trim($("#input3").val());

            if(name==null||name==''){
                $("#addnamespan").html("姓名不能为空！");
                $("#addnamespan").css("display","block");
            }else if(contactMan==null||contactMan==''){
                $("#addcontactManspan").html("身份不能为空！");
                $("#addcontactManspan").css("display","block");
            }else if(tel==null||tel==''){
                $("#addtelspan").html("座机不能为空！");
                $("#addtelspan").css("display","block");
            }else if(phone==null||phone==''){
                $("#addphonespan").html("手机不能为空！");
                $("#addphonespan").css("display","block");
            }else if(email==null||email==''){
                $("#addemailspan").html("邮箱不能为空！");
                $("#addemailspan").css("display","block");
            }else{
                $("#addIdCurrentPage").val($("#currentPageHidden").val());
                $("#addIdpageSizes").val($("#pageSizeHidden").val());
                $("#addForm").submit();
            }
        }

        function addnamefocus(){
            $("#addnamespan").css("display","none");
        }

        function addcontactManfocus(){
            $("#addcontactManspan").css("display","none");
        }

        function addtelfocus(){
            $("#addtelspan").css("display","none");
        }

        function addphonefocus(){
            $("#addphonespan").css("display","none");
        }

        function addemailfocus(){
            $("#addemailspan").css("display","none");
        }
    </script>
    <%-- add end --%>

    <script>

        function delid(id){
            $("#deleteIdInput").val(id);
        }
        function deleteById(){
            $("#deleteIdFormId").val($("#deleteIdInput").val());

            $("#deleteIdCurrentPage").val($("#currentPageHidden").val());
            $("#deleteIdpageSizes").val($("#pageSizeHidden").val());

            $("#deleteIdForm").attr("action","${pageContext.request.contextPath}/zhMan/delete");
            $("#deleteIdForm").submit();
        }



        function xiugai(id,name,contactMan,tel,phone,email){
            $("#updateId").val(id);

            $("#input11").val(name);
            $("#input12").val(contactMan);
            $("#input18").val(tel);
            $("#input19").val(phone);
            $("#input13").val(email);

            $("#updateIdCurrentPage").val($("#currentPageHidden").val());
            $("#updateIdpageSizes").val($("#pageSizeHidden").val());


        }




    </script>


</head>
<body>
<div class="container" style="width: 100%;max-width:95%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/zhMan" method="post">
                    <div>
                        <input type="hidden" name="zhId" value="${zhId}" />
                        <button type="button" onclick="beforeSave()" class="btn btn-success" data-target="#addModel" data-toggle="modal">添加机构人员</button>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>身份</th>
                            <th>座机</th>
                            <th>手机</th>
                            <th>邮箱</th>
                            <th>备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="zhMan" items="${zhManList}">
                            <tr>
                                <td>${zhMan.name}</td>
                                <td>${zhMan.contactMan}</td>
                                <td>${zhMan.tel}</td>
                                <td>${zhMan.phone}</td>
                                <td>${zhMan.email}</td>
                                <td>${zhMan.remark}</td>
                                <td>
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#updateModel" onclick="xiugai('${zhMan.id}','${zhMan.name}','${zhMan.contactMan}','${zhMan.tel}','${zhMan.phone}','${zhMan.email}')">修改</button>
                                    <button type="button" class="btn btn-xs btn-danger" data-toggle="modal" onclick="delid(${zhMan.id})" data-target="#delModel">删除</button>
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

                                <input type="hidden" name="zhId" value="${zhId}" />

                                <input type="hidden" id="deleteIdCurrentPage" name="currentPage" >
                                <input type="hidden" id="deleteIdpageSizes" name="pageSize" >
                            </form>
                        </div>
                    </div>
                </div>
                <%-- delete end --%>

                <%-- add begin --%>
                <div class="modal fade bs-example-modal-lg" id="addModel" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-lg" style="width: 100%;">
                        <div class="modal-content" >
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="addModalLabel">添加工作记录</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="addForm" action="${pageContext.request.contextPath}/zhMan/add">
                                    <fieldset>
                                        <input type="hidden" name="zhId" value="${zhId}" />

                                        <input type="hidden" id="addIdCurrentPage" name="currentPage" >
                                        <input type="hidden" id="addIdpageSizes" name="pageSize" >


                                        <table style="width: 100%;height:350px;">
                                            <tr>
                                                <td><label for="input1" class="control-label">姓名</label></td>
                                                <td style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input1" onfocus="addnamefocus()" name="name" placeholder="姓名" required><span id="addnamespan" style="color: red;display: none;"></span>
                                                </div></td>
                                                <td><label for="input2" class="control-label">身份</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input2" onfocus="addcontactManfocus()" name="contactMan" placeholder="身份" required><span id="addcontactManspan" style="color: red;display: none;"></span>
                                                    </select>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input8" class=" control-label">座机</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input8" name="tel" onfocus="addtelfocus()" placeholder="座机" required><span id="addtelspan" style="color: red;display: none;"></span>
                                                </div></td>
                                                <td><label for="input9" class="control-label">手机</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input9" name="phone" onfocus="addphonefocus()" placeholder="手机" required><span id="addphonespan" style="color: red;display: none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input3" class=" control-label">邮箱</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="email" class="form-control" id="input3" name="email" onfocus="addemailfocus()" placeholder="邮箱" required><span id="addemailspan" style="color: red;display: none;"></span>
                                                </div></td>
                                                <td colspan="2"><input type="button" onclick="saveBtn()" class="btn btn-primary" style="height: 50px;width: 85%;" value="保存" /></td>
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
                                <h4 class="modal-title" id="updateModalLabel">修改工作记录</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="updateForm" action="${pageContext.request.contextPath}/zhMan/update">
                                    <input type="hidden" id="updateId"  name="id" />
                                    <input type="hidden" name="zhId" value="${zhId}" />
                                    <fieldset>


                                        <input type="hidden" id="updateIdCurrentPage" name="currentPage" >
                                        <input type="hidden" id="updateIdpageSizes" name="pageSize" >

                                        <table style="width: 100%;height:350px;">
                                            <tr>
                                                <td><label for="input1" class="control-label">姓名</label></td>
                                                <td style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input11" name="name" placeholder="姓名" required><span id="updatenamespan" style="color: red;display: none;"></span>
                                                </div></td>
                                                <td><label for="input2" class="control-label">身份</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input12" name="contactMan" placeholder="身份" required>
                                                    </select>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input8" class=" control-label">座机</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input18" name="tel" placeholder="座机" required>
                                                </div></td>
                                                <td><label for="input9" class="control-label">手机</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input19" name="phone" placeholder="手机" required>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input3" class=" control-label">邮箱</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="email" class="form-control" id="input13" name="email" placeholder="邮箱" required>
                                                </div></td>
                                                <td colspan="2"><input type="submit"  class="btn btn-primary" style="height: 50px;width: 85%;" value="保存" /></td>
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
<script src="${pageContext.request.contextPath}/common/zhnw/content/purview/user/js/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
</body>
</html>
