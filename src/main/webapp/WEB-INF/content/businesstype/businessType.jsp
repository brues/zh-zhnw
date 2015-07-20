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

            $("#deleteIdCurrentPage").val($("#currentPageHidden").val());
            $("#deleteIdpageSizes").val($("#pageSizeHidden").val());
            $("#deleteIdUserName").val($("#souNameInput").val());
            $("#deleteIdTrueName").val($("#souEnNameInput").val());


            $("#deleteIdForm").attr("action","${pageContext.request.contextPath}/btype/delete");
            $("#deleteIdForm").submit();
        }

        function xiugai(id,name,enName){
            $("#updateId").val(id);
            $("#input103").val(name);
            $("#input106").val(enName);
        }

    </script>

    <script>

        function onadd(){
            $("#addIdCurrentPage").val($("#currentPageHidden").val());
            $("#addIdpageSizes").val($("#pageSizeHidden").val());
            $("#addIdName").val($("#souNameInput").val());
            $("#addIdEnName").val($("#souEnNameInput").val());

            var name = $("#input1").val();
            var enName = $("#input2").val();
            if($.trim(name).length==0||$.trim(enName).length==0){
                $("#yewuleixingtd").html("业务类型和英文简称均不能为空！");
                $("#yewuleixingtd").css("display","block");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/btype/nameJson",
                    data:{name:name},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if(data=='1'){
                            $("#yewuleixingtd").html("业务类型已存在！");
                            $("#yewuleixingtd").css("display","block");
                            $("#input1").val("");
                        }else{
                            $.ajax({
                                url:"${pageContext.request.contextPath}/btype/enNameJson",
                                data:{enName:enName},
                                dataType:"json",
                                type:"post",
                                success:function(data){
                                    if(data=='1'){
                                        $("#yewuleixingtd").html("英文简称已存在！");
                                        $("#yewuleixingtd").css("display","block");
                                        $("#input2").val("");
                                    }else{
                                        $("#addForm").submit();
                                    }
                                }
                            });
                        }
                    }
                });
            }
        }

        function nameyincangtishi(){
            $("#yewuleixingtd").css("display","none");
            $("#yingwenjianchengtd").css("display","none");

        }
        function ennameyincangtishi(){
            $("#yewuleixingtd").css("display","none");
            $("#yingwenjianchengtd").css("display","none");
        }
    </script>

    <script>
        function updateSubmit(){
            $("#updateIdCurrentPage").val($("#currentPageHidden").val());
            $("#updateIdpageSizes").val($("#pageSizeHidden").val());
            $("#updateIdName").val($("#souNameInput").val());
            $("#updateIdEnName").val($("#souEnNameInput").val());

            var name = $("#input103").val();
            var enName = $("#input106").val();

            if($.trim(name).length==0||$.trim(enName).length==0){
                $("#updatetishi").html("业务类型和英文简称均不能为空！");
                $("#updatetishi").css("display","block");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/btype/updateNameJson",
                    data:{name:name,id:$("#updateId").val()},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if(data=='1'){
                            $("#updatetishi").html("业务类型已存在！");
                            $("#updatetishi").css("display","block");
                            $("#input103").val("");
                        }else{
                            $.ajax({
                                url:"${pageContext.request.contextPath}/btype/updateEnNameJson",
                                data:{enName:enName,id:$("#updateId").val()},
                                dataType:"json",
                                type:"post",
                                success:function(data){
                                    if(data=='1'){
                                        $("#updatetishi").html("英文简称已存在！");
                                        $("#updatetishi").css("display","block");
                                        $("#input106").val("");
                                    }else{
                                        $("#updateForm").submit();
                                    }
                                }
                            });
                        }
                    }
                });
            }
        }

        function quxiaotishi(){
            $("#updatetishi").css("display","none");
        }
    </script>
</head>
<body>
<div class="container" style="width: 100%;max-width:95%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/btype" method="post">
                    <div>
                        <button type="button" class="btn btn-success" data-target="#addModel" data-toggle="modal">添加业务类型</button>
                        业务名称：<input type="text" id="souNameInput" name="name" value="${name}">
                        英文简称：<input type="text" id="souEnNameInput" name="enName" value="${enName}">
                        <button type="submit" class="btn btn-primary">搜索类型</button>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>
                                业务类型
                            </th>
                            <th>
                                英文简称
                            </th>
                            <th>
                                操作
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="btype" items="${businessTypeList}">
                            <tr>
                                <td>${btype.name}</td>
                                <td>${btype.enName}</td>
                                <td>
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#updateModel" onclick="xiugai('${btype.id}','${btype.name}','${btype.enName}')">修改</button>
                                    <button type="button" class="btn btn-xs btn-danger" data-toggle="modal" onclick="delid(${btype.id})" data-target="#delModel">删除</button>
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
                                <input type="hidden" id="deleteIdUserName" name="name" value="${name}">
                                <input type="hidden" id="deleteIdTrueName" name="enName" value="${enName}">
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
                                <h4 class="modal-title" id="addModalLabel">添加业务类型</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="addForm" action="${pageContext.request.contextPath}/btype/add">

                                    <input type="hidden" id="addIdCurrentPage" name="currentPage" value="${currentPage}">
                                    <input type="hidden" id="addIdpageSizes" name="pageSize" value="${pageSize}">
                                    <input type="hidden" id="addIdName" name="name2" >
                                    <input type="hidden" id="addIdEnName" name="enName2" >

                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <span id="yewuleixingtd" colspan="2" style="color: red;display: none;"></span>
                                            <tr>
                                                <td><label for="input1" class="control-label">业务类型</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input1" placeholder="业务类型" onfocus="nameyincangtishi()" name="name"  required>
                                                </div></td>
                                                <td><label for="input2" class="control-label">英文简称</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control"  onfocus="ennameyincangtishi()" id="input2" placeholder="英文简称" name="enName" required/>
                                                </div></td>
                                            </tr>

                                            <tr>
                                                <td colspan="4"><input type="button" onclick="onadd()" class="btn btn-primary" style="height: 50px;width: 92%;" value="保存" /></td>
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
                                <h4 class="modal-title" id="updateModalLabel">更新记录</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="updateForm" action="${pageContext.request.contextPath}/btype/update">

                                    <input type="hidden" id="updateIdCurrentPage" name="currentPage" value="${currentPage}">
                                    <input type="hidden" id="updateIdpageSizes" name="pageSize" value="${pageSize}">
                                    <input type="hidden" id="updateIdName" name="name2" >
                                    <input type="hidden" id="updateIdEnName" name="enName2" >


                                    <input type="hidden" id="updateId"  name="id" />
                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <span id="updatetishi" colspan="2" style="color: red;display: none;"></span>
                                            <tr>
                                                <td><label for="input103" class=" control-label">业务类型</label></td>
                                                <td><div class="col-sm-10">
                                                    <input  type="text" class="form-control" onfocus="quxiaotishi()" id="input103" placeholder="业务类型" name="name" value="${name}" required/>
                                                </div></td>
                                                <td><label for="input106" class="control-label">英文简称</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" onfocus="quxiaotishi()" id="input106" placeholder="英文简称" name="enName" value="${enName}" >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><input type="button" onclick="updateSubmit()" class="btn btn-primary" style="height: 50px;width: 92%;" value="保存" /></td>
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
