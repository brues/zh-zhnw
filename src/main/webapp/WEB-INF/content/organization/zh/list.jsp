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
            $("#deleteSou").val($("#inputSou").val());


            $("#deleteIdForm").attr("action","${pageContext.request.contextPath}/zh/delete");
            $("#deleteIdForm").submit();
        }

        function xiugai(id,comName,shortName,address){
            $("#updateId").val(id);

            $("#input11").val(comName);
            $("#input14").val(shortName);
            $("#input17").val(address);
        }

        function addwork(){

            $("#addIdCurrentPage").val($("#currentPageHidden").val());
            $("#addIdpageSizes").val($("#pageSizeHidden").val());
            $("#addSou").val($("#inputSou").val());

            $("#addForm").submit();
        }

        function updatework(){

            $("#updateIdCurrentPage").val($("#currentPageHidden").val());
            $("#updateIdpageSizes").val($("#pageSizeHidden").val());
            $("#updateSou").val($("#inputSou").val());

            $("#updateForm").submit();
        }

        function lianxiren(id){
            $("#contactHiddenIdInput").val(id);
            $("#contactForm").submit();
        }
    </script>



</head>
<body>
<div class="container" style="width: 100%;max-width:95%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/zh" method="post">
                    <div>
                        <button type="button" class="btn btn-success" data-target="#addModel" data-toggle="modal">添加机构</button>
                        搜索内容：<input type="text" id="inputSou" style="width: 200px;" name="souContent" value="${souContent}" />
                        <button type="submit" class="btn btn-primary">搜索记录</button>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>公司名称</th>
                            <th>公司简称</th>
                            <th>公司地址</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="zh" items="${zhList}">
                            <tr>
                                <td>${zh.comName}</td>
                                <td>${zh.shortName}</td>
                                <td>${zh.address}</td>
                                <td>
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#updateModel" onclick="xiugai('${zh.id}','${zh.comName}','${zh.shortName}','${zh.address}')">修改</button>
                                    <button type="button" class="btn btn-xs btn-primary" onclick="lianxiren(${zh.id})">联系人</button>
                                    <button type="button" class="btn btn-xs btn-danger" data-toggle="modal" onclick="delid(${zh.id})" data-target="#delModel">删除</button>
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

                <form method="post" style="display: none;" action="${pageContext.request.contextPath}/zhMan" id="contactForm">
                    <input type="hidden" name="zhId" id="contactHiddenIdInput">
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

                                <input type="hidden" id="deleteIdCurrentPage" name="currentPage" >
                                <input type="hidden" id="deleteIdpageSizes" name="pageSize" >
                                <input type="hidden" id="deleteSou" name="souContent" >
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
                                <h4 class="modal-title" id="addModalLabel">添加机构</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="addForm" action="${pageContext.request.contextPath}/zh/add">
                                    <fieldset>
                                        <input type="hidden" id="addIdCurrentPage" name="currentPage" >
                                        <input type="hidden" id="addIdpageSizes" name="pageSize" >
                                        <input type="hidden" id="addSou" name="souContent" >

                                        <table style="width: 100%;height:350px;">
                                            <tr>
                                                <td><label for="input1" class="control-label">公司全称</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input1" placeholder="公司全称" name="comName"  >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input4" class="control-label">公司简称</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input4" placeholder="公司简称" name="shortName"  >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input7" class="control-label">公司地址</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input7" placeholder="公司地址" name="address"  >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><input type="button" onclick="addwork()" class="btn btn-primary" style="height: 50px;width: 85%;" value="保存" /></td>
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
                                <form method="post" id="updateForm" action="${pageContext.request.contextPath}/zh/update">
                                    <input type="hidden" id="updateId"  name="id" />
                                    <fieldset>


                                        <input type="hidden" id="updateIdCurrentPage" name="currentPage" >
                                        <input type="hidden" id="updateIdpageSizes" name="pageSize" >

                                        <input type="hidden" id="updateSou" name="souContent" >



                                        <table style="width: 100%;height:350px;">
                                            <tr>
                                                <td><label for="input11" class="control-label">公司全称</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input11" placeholder="公司全称" name="comName"  >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input14" class="control-label">公司简称</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input14" placeholder="公司简称" name="shortName"  >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input17" class="control-label">公司地址</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input17" placeholder="公司地址" name="address"  >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><input type="button" onclick="updatework()" class="btn btn-primary" style="height: 50px;width: 85%;" value="保存" /></td>
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
