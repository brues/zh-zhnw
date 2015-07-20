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

            $("#deleteIdCurrentPage").val($("#currentPageHidden").val());
            $("#deleteIdpageSizes").val($("#pageSizeHidden").val());
            $("#deleteSouName").val($("#souKehuName").val());
            $("#deleteSouAddress").val($("#souFuzerenName").val());
        }
        function deleteById(){
            $("#deleteIdFormId").val($("#deleteIdInput").val());
            $("#deleteIdForm").attr("action","${pageContext.request.contextPath}/client/delete");
            $("#deleteIdForm").submit();
        }

        function savesubmit(){
            var name = $.trim($("#input1").val());
            var address = $.trim($("#input3").val());
            if(name==null||name==''||address==null||address==''){
                $("#addtishispan").html("公司名称或办公地址不能为空！");
                $("#addtishispan").css("display","block");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/client/nameJson",
                    data:{name:name},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if(data.length==0){
                            $("#addIdCurrentPage").val($("#currentPageHidden").val());
                            $("#addIdpageSizes").val($("#pageSizeHidden").val());
                            $("#addSouName").val($("#souKehuName").val());
                            $("#addSouAddress").val($("#souFuzerenName").val());

                            $("#addForm").submit();
                        }else{
                            $("#addtishispan").html("公司名称已存在！");
                            $("#addtishispan").css("display","block");
                            $("#input1").val("");
                        }
                    }
                });
            }
        }

        function addfoucs(){
            $("#addtishispan").css("display","none");
        }

        function updatefoucs(){
            $("#updatetishispan").css("display","none");
        }



        function xiugai(id,comName,address){
            $("#updateId").val(id);

            $("#input101").val(comName);
            $("#input103").val(address);

            $("#updateIdCurrentPage").val($("#currentPageHidden").val());
            $("#updateIdpageSizes").val($("#pageSizeHidden").val());
            $("#updateSouName").val($("#souKehuName").val());
            $("#updateSouAddress").val($("#souFuzerenName").val());
        }

        function updatesubmit(){
            var name = $.trim($("#input101").val());
            var address = $.trim($("#input103").val());
            if(name==null||name==''||address==null||address==''){
                $("#updatetishispan").html("公司名称或办公地址不能为空！");
                $("#updatetishispan").css("display","block");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/client/updateNameJson",
                    data:{name:name,id:$("#updateId").val()},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if(data.length==0){
                            $("#updateForm").submit();
                        }else{
                            $("#updatetishispan").html("公司名称已存在！");
                            $("#updatetishispan").css("display","block");
                            $("#input101").val("");
                        }
                    }
                });
            }
        }


        function lianxiren(id){
            $("#lianxirenclientid").val(id);
            $("#lianxirenform").submit();
        }

    </script>
</head>
<body>
<div class="container" style="width: 100%;max-width:95%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/client" method="post">
                    <div>
                        <button type="button" class="btn btn-success" data-target="#addModel" data-toggle="modal">添加客户</button>
                        客户名称：<input id="souKehuName" type="text" name="comName" value="${comName}">
                        办公地址：<input type="text" id="souFuzerenName" name="address" value="${address}">
                        <button type="submit" class="btn btn-primary">搜索客户</button>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>
                                客户名称
                            </th>
                            <th>
                                办公地址
                            </th>
                            <th>
                                操作
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="client" items="${clientCompanyList}">
                            <tr>
                                <td>${client.comName}</td>
                                <td>${client.address}</td>
                                <td>
                                    <button type="button" class="btn btn-xs btn-primary" onclick="lianxiren('${client.id}')">联系人</button>
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#updateModel" onclick="xiugai('${client.id}','${client.comName}','${client.address}')">修改</button>
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

                <%-- 联系人 begin --%>
                <form method="post" style="display: none;" id="lianxirenform" action="${pageContext.request.contextPath}/clientp" >
                    <input type="hidden" name="clientId" id="lianxirenclientid" />
                </form>
                <%-- 联系人 end --%>

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
                                <input type="hidden" id="deleteIdCurrentPage" name="currentPage" >
                                <input type="hidden" id="deleteIdpageSizes" name="pageSize" >
                                <input type="hidden" id="deleteSouName" name="souname" >
                                <input type="hidden" id="deleteSouAddress" name="souaddress" >
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
                                <h4 class="modal-title" id="addModalLabel">添加客户</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="addForm" action="${pageContext.request.contextPath}/client/add">
                                    <input type="hidden" id="addIdCurrentPage" name="currentPage" >
                                    <input type="hidden" id="addIdpageSizes" name="pageSize" >
                                    <input type="hidden" id="addSouName" name="souname" >
                                    <input type="hidden" id="addSouAddress" name="souaddress" >


                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <span id="addtishispan" style="color:red;display: none;"></span>
                                            <tr>
                                                <td><label for="input1" class="control-label">客户名称</label></td>
                                                <td colspan="3"><div class="col-sm-10">
                                                    <input type="text" class="form-control" onfocus="addfoucs()" id="input1" placeholder="客户名称" name="comName"  onblur="quchongfu()" required>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input3" class=" control-label">办公地址</label></td>
                                                <td colspan="3"><div class="col-sm-10">
                                                    <input  type="text" onfocus="addfoucs()" class="form-control" id="input3" placeholder="办公地址" name="address"  required/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><input type="button" onclick="savesubmit()" class="btn btn-primary" style="height: 50px;width: 92%;" value="保存" /></td>
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
                                <form method="post" id="updateForm" action="${pageContext.request.contextPath}/client/update">
                                    <input type="hidden" id="updateId"  name="id" />

                                    <input type="hidden" id="updateIdCurrentPage" name="currentPage" >
                                    <input type="hidden" id="updateIdpageSizes" name="pageSize" >
                                    <input type="hidden" id="updateSouName" name="souname" >
                                    <input type="hidden" id="updateSouAddress" name="souaddress" >

                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <span id="updatetishispan" style="color:red;display: none;"></span>
                                            <tr>
                                                <td><label for="input1" class="control-label">客户名称</label></td>
                                                <td colspan="3"><div class="col-sm-10">
                                                    <input type="text" class="form-control" onfocus="updatefoucs()" id="input101" placeholder="客户名称" name="comName"  required>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input3" class=" control-label">办公地址</label></td>
                                                <td colspan="3"><div class="col-sm-10">
                                                    <input  type="text" onfocus="updatefoucs()" class="form-control" id="input103" placeholder="办公地址" name="address"  required/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><input type="button" onclick="updatesubmit()" class="btn btn-primary" style="height: 50px;width: 92%;" value="保存" /></td>
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
