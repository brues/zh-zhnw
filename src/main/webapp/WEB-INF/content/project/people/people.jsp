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
    <%--<link rel="icon" href="${pageContext.request.contextPath}/commons/zhnw/index/img/ico.png">--%>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/bootstrap/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/zhnw/content/purview/user/css/bootstrap-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.css">
    <script src="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/jquery/jquery-1.8.3.min.js"></script>


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
            $("#deleteIdForm").attr("action","${pageContext.request.contextPath}/project/people/delete");
            $("#deleteIdForm").submit();
        }

        function updateNum(id,num){
            $("#updateNumId").val(id);
            $("#input1101").val(num);
        }

        function xiugai(id,projectId,peopleId,name){
            $("#updateId").val(id);
            $("#updateProjectId").val(projectId);




            $.ajax({
                url:"${pageContext.request.contextPath}/user/userJson",
                dataType:"json",
                success:function(data){
                    for(i=0;i<data.length;i++){
                        if(data[i].id==peopleId){
                            $("#input101").append("<option selected='selected' value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                        }else{
                            $("#input101").append("<option value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                        }
                    }
                    $('#input101').selectpicker({
                        'selectedText': 'cat'
                    });
                }
            });


        }
    </script>

    <%-- add project script begin--%>
    <script>

        $.ajax({
            url:"${pageContext.request.contextPath}/user/userJson",
            dataType:"json",
            success:function(data){
                $("#selectClientSou").append("<option value='0'>请选择项目人员</option>");
                for(i=0;i<data.length;i++){
                    if(data[i].id==$("#inputClientSou").val()){
                        $("#selectClientSou").append("<option selected='selected' value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                    }else{
                        $("#selectClientSou").append("<option value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                    }
                }
                $('#selectClientSou').selectpicker({
                    'selectedText': 'cat'
                });
            }
        });

        $.ajax({
            url:"${pageContext.request.contextPath}/user/userJson",
            dataType:"json",
            success:function(data){
                for(i=0;i<data.length;i++){
                    $("#input1").append("<option value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                }
                $('#input1').selectpicker({
                    'selectedText': 'cat'
                });
            }
        });

    </script>
    <%-- add project script end--%>
</head>
<body>
<div class="container" style="width: 100%;max-width:95%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/project/people/people" method="post" style="font-size: 10pt;">
                    <div>
                        <button type="button" class="btn btn-success" data-target="#addModel" data-toggle="modal" style="margin-bottom: 10px;">添加人员</button>
                        <select id="selectClientSou" name="selectClientSouName" class="selectpicker bla bla bli"  data-live-search="true">
                        </select>
                        <input type="hidden" id="inputClientSou" value="${peopleId}">
                        <button type="submit" class="btn btn-primary" style="margin-bottom: 10px;">搜索</button>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="p" items="${ppList}">
                            <tr>
                                <td>${p.name}</td>
                                <td>
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#updateModel" onclick="xiugai('${p.id}','${p.projectId}','${p.peopleId}','${p.name}')">修改</button>
                                    <button type="button" class="btn btn-xs btn-danger" data-toggle="modal" onclick="delid(${p.id})" data-target="#delModel">删除</button>
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
                        <input type="hidden"  name="projectId" value="${projectId}"  />

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
                                <input type="hidden" id="deleteIdActorName" name="actorName" value="${actorName}">
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
                                <h4 class="modal-title" id="addModalLabel">添加人员</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="addForm" action="${pageContext.request.contextPath}/project/people/add">
                                    <fieldset>
                                        <input type="hidden"  name="projectId" value="${projectId}" />
                                        <table style="width: 100%;height:200px;">
                                            <tr>
                                                <td style="width: 20%;"><label for="input1" class="control-label">人员姓名</label></td>
                                                <td style="width: 20%;"><div class="col-sm-10">
                                                    <select id="input1" class="form-control input-lg" name="peopleId" data-live-search="true">
                                                    </select>
                                                </div></td>
                                                <td colspan="2"><input type="submit" class="btn btn-primary" style="height: 50px;width: 85%;" value="保存" /></td>
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
                                <h4 class="modal-title" id="updateModalLabel">修改人员</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="updateForm" action="${pageContext.request.contextPath}/project/update">
                                    <input type="hidden" id="updateId"  name="id" />
                                    <input type="hidden" id="updateProjectId"  name="projectId" />
                                    <fieldset>
                                        <table style="width: 100%;height:350px;">
                                            <tr>
                                                <td><label for="input101" class="control-label">人员姓名</label></td>
                                                <td style=""><div class="col-sm-10">
                                                    <select id="input101" class="form-control input-lg" name="peopleId" data-live-search="true">
                                                    </select>
                                                </div></td>
                                                <td colspan="2"><input type="submit" class="btn btn-primary" style="height: 50px;width: 85%;" value="保存" /></td>
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


<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->

<script src="${pageContext.request.contextPath}/common/zhnw/content/purview/user/js/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
    $('#input8').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('#input9').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('#input108').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('#input109').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
</script>
</body>
</html>
