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

    <%-- 分页方法 begin --%>
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
    <%-- 分页方法 end --%>

    <%-- 搜索用ajax begin --%>
    <script>
        $.ajax({
            url:"${pageContext.request.contextPath}/work/forecastJson",
            dataType:"json",
            success:function(data){
                $("#selectForecastSou").append("<option value='0'>请选择预计结束日期</option>");
                for(i=0;i<data.length;i++){
                    if(data[i].forecast!=null&&data[i].forecast!=""&&data[i].forecast==$("#inputForecastSou").val()){
                        $("#selectForecastSou").append("<option selected='selected' value='"+data[i].forecast+"'>"+data[i].forecast+"</option>");
                    }else{
                        $("#selectForecastSou").append("<option value='"+data[i].forecast+"'>"+data[i].forecast+"</option>");
                    }
                }
                $('#selectForecastSou').selectpicker({
                    'selectedText': 'cat'
                });
            }
        });

        $.ajax({
            url:"${pageContext.request.contextPath}/work/nameJson",
            dataType:"json",
            success:function(data){
                $("#selectNameSou").append("<option value='0'>请选择姓名</option>");
                for(i=0;i<data.length;i++){
                    if(data[i].nameId!=null&&data[i].nameId!=""&&data[i].nameId==$("#inputNameSou").val()){
                        $("#selectNameSou").append("<option selected='selected' value='"+data[i].nameId+"'>"+data[i].name+"</option>");
                    }else{
                        $("#selectNameSou").append("<option value='"+data[i].nameId+"'>"+data[i].name+"</option>");
                    }
                }
                $('#selectNameSou').selectpicker({
                    'selectedText': 'cat'
                });
                $('#selectIsEndSou').selectpicker({
                    'selectedText': 'cat'
                });
            }
        });

        $.ajax({
            url:"${pageContext.request.contextPath}/work/thingJson",
            dataType:"json",
            success:function(data){
                $("#selectThingSou").append("<option value='0'>请选择事项</option>");
                for(i=0;i<data.length;i++){
                    if(data[i].thing!=null&&data[i].thing!=""&&data[i].thing==$("#inputThingSou").val()){
                        $("#selectThingSou").append("<option selected='selected' value='"+data[i].thing+"'>"+data[i].thing+"</option>");
                    }else{
                        $("#selectThingSou").append("<option value='"+data[i].thing+"'>"+data[i].thing+"</option>");
                    }
                }
                $('#selectThingSou').selectpicker({
                    'selectedText': 'cat'
                });
            }
        });
    </script>
    <%-- 搜索用ajax end --%>

    <%-- add begin --%>
    <script>
        $.ajax({
            url:"${pageContext.request.contextPath}/user/userJson",
            dataType:"json",
            success:function(data){
                for(i=0;i<data.length;i++){
                    $("#input2").append("<option value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                    $("#input3").append("<option value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                }
                $('#input2').selectpicker({
                    'selectedText': 'cat'
                });

                $('#input3').selectpicker({
                    'selectedText': 'cat'
                });
            }
        });

        function addwork(){
            $("#addIdCurrentPage").val($("#currentPageHidden").val());
            $("#addIdpageSizes").val($("#pageSizeHidden").val());
            $("#addNameId").val($("#selectNameSou").val());
            $("#addThing").val($("#selectThingSou").val());
            $("#addForecast").val($("#selectForecastSou").val());
            $("#addIsend").val($("#selectIsEndSou").val());


            var thing = $.trim($("#input4").val());
            var forecast = $.trim($("#input9").val());
            var progress = $.trim($("#input7").val());
            if(thing==null||thing==''){
                $("#addthingspan").html("事项不能为空！");
                $("#addthingspan").css("display","block");
            }else if(forecast==null||forecast==''){
                $("#addforecastspan").html("预计结束日期不能为空！");
                $("#addforecastspan").css("display","block");
            }else if(progress==null||progress==''){
                $("#addprogressspan").html("进展不能为空！");
                $("#addprogressspan").css("display","block");
            }else{
                $("#addForm").submit();
            }
        }

        function addthingfocus(){
            $("#addthingspan").css("display","none");
        }

        function addforecastfocus(){
            $("#addforecastspan").css("display","none");
        }

        function addprogressfocus(){
            $("#addprogressspan").css("display","none");
        }
    </script>
    <%-- add end --%>

    <%-- delete begin --%>
    <script>
        function delid(id){
            $("#deleteIdInput").val(id);
        }
        function deleteById(){
            $("#deleteIdFormId").val($("#deleteIdInput").val());


            $("#deleteIdCurrentPage").val($("#currentPageHidden").val());
            $("#deleteIdpageSizes").val($("#pageSizeHidden").val());
            $("#deleteNameId").val($("#selectNameSou").val());
            $("#deleteThing").val($("#selectThingSou").val());
            $("#deleteForecast").val($("#selectForecastSou").val());
            $("#deleteIsend").val($("#selectIsEndSou").val());


            $("#deleteIdForm").attr("action","${pageContext.request.contextPath}/work/delete");
            $("#deleteIdForm").submit();
        }
    </script>
    <%-- delete end --%>

    <%-- update begin --%>
    <script>
        function xiugai(id,name,nameId,thing,accountable,accountableId,begin,forecast,end,isend,progress,review,reviewId){
            $("#updateId").val(id);

            $.ajax({
                url:"${pageContext.request.contextPath}/user/userJson",
                dataType:"json",
                success:function(data){
                    $("#input12").append("<option value='0'>请选择交代人</option>");
                    for(i=0;i<data.length;i++){
                        if(data[i].id!=null&&data[i].id!=""&&data[i].id==accountableId){
                            $("#input12").append("<option selected='selected' value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                        }else{
                            $("#input12").append("<option value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                        }

                    }
                    $('#input12').selectpicker({
                        'selectedText': 'cat'
                    });
                }
            });


            $("#input14").val(thing);

            $("#input18").val(begin);
            $("#input19").val(forecast);
            $("#input15").val(end);

            if(isend=='是'){
                $("#input10").append("<option value='否'>否</option>");
                $("#input10").append("<option selected='selected' value='是'>是</option>");
                $('#input10').selectpicker({
                    'selectedText': 'cat'
                });
            }else{
                $("#input10").append("<option value='否'>否</option>");
                $("#input10").append("<option value='是'>是</option>");
                $('#input10').selectpicker({
                    'selectedText': 'cat'
                });
            }

            $("#input17").val(progress);

            $.ajax({
                url:"${pageContext.request.contextPath}/user/userJson",
                dataType:"json",
                success:function(data){
                    $("#input13").append("<option value='0'>请选择交代人</option>");
                    for(i=0;i<data.length;i++){
                        if(data[i].id!=null&&data[i].id!=""&&data[i].id==reviewId){
                            $("#input13").append("<option selected='selected' value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                        }else{
                            $("#input13").append("<option value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                        }

                    }
                    $('#input13').selectpicker({
                        'selectedText': 'cat'
                    });
                }
            });


        }



        function updatework(){

            $("#updateIdCurrentPage").val($("#currentPageHidden").val());
            $("#updateIdpageSizes").val($("#pageSizeHidden").val());
            $("#updateNameId").val($("#selectNameSou").val());
            $("#updateThing").val($("#selectThingSou").val());
            $("#updateForecast").val($("#selectForecastSou").val());
            $("#updateIsend").val($("#selectIsEndSou").val());

            var thing = $.trim($("#input14").val());
            var forecast = $.trim($("#input19").val());
            var progress = $.trim($("#input17").val());
            if(thing==null||thing==''){
                $("#updatethingspan").html("事项不能为空！");
                $("#updatethingspan").css("display","block");
            }else if(forecast==null||forecast==''){
                $("#updateforecastspan").html("预计结束日期不能为空！");
                $("#updateforecastspan").css("display","block");
            }else if(progress==null||progress==''){
                $("#updateprogressspan").html("进展不能为空！");
                $("#updateprogressspan").css("display","block");
            }else{
                $("#updateForm").submit();
            }
        }

        function updatethingfocus(){
            $("#updatethingspan").css("display","none");
        }

        function updateforecastfocus(){
            $("#updateforecastspan").css("display","none");
        }

        function updateprogressfocus(){
            $("#updateprogressspan").css("display","none");
        }
    </script>
    <%-- update begin --%>
</head>
<body>
<div class="container" style="width: 100%;max-width:95%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/work" method="post">
                    <div>
                        <input type="hidden" id="inputNameSou" value="${nameId}">
                        <input type="hidden" id="inputThingSou" value="${thing}">
                        <input type="hidden" id="inputForecastSou" value="${forecast}">
                        <button type="button" class="btn btn-success" data-target="#addModel" data-toggle="modal">添加工作记录</button>

                        <select id="selectNameSou" name="nameId" class="selectpicker bla bla bli"  data-live-search="true" ></select>
                        <select id="selectThingSou" name="thing" class="selectpicker bla bla bli"  data-live-search="true"></select>
                        <select id="selectForecastSou" name="forecast" class="selectpicker bla bla bli"  data-live-search="true"></select>
                        <select id="selectIsEndSou" name="isend" class="selectpicker bla bla bli"  data-live-search="true">
                            <c:if test="${isend==null||isend=='0'}">
                                <option value="0">请选择是否完成</option>
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </c:if>
                            <c:if test="${isend=='是'}">
                                <option value="0">请选择是否完成</option>
                                <option selected="selected" value="是">是</option>
                                <option value="否">否</option>
                            </c:if>
                            <c:if test="${isend=='否'}">
                                <option value="0">请选择是否完成</option>
                                <option value="是">是</option>
                                <option selected="selected" value="否">否</option>
                            </c:if>
                        </select>
                        <button type="submit" class="btn btn-primary">搜索记录</button>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>姓名</th>
                            <th>事项</th>
                            <th>交代人</th>
                            <th>开始日期</th>
                            <th>预计结束日期</th>
                            <th>实际完成日期</th>
                            <th>是否完成</th>
                            <th>进展</th>
                            <th>复核人</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="work" items="${workList}">
                                <tr>
                                    <td>${workList.indexOf(work)+1}</td>
                                    <td>${work.name}</td>
                                    <td>${work.thing}</td>
                                    <td>${work.accountable}</td>
                                    <td>${work.begin}</td>
                                    <td>${work.forecast}</td>
                                    <td>${work.end}</td>
                                    <td>${work.isend}</td>
                                    <td>${work.progress}</td>
                                    <td>${work.review}</td>
                                    <td>
                                        <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#updateModel" onclick="xiugai('${work.id}','${work.name}','${work.nameId}','${work.thing}','${work.accountable}','${work.accountableId}','${work.begin}','${work.forecast}','${work.end}','${work.isend}','${work.progress}','${work.review}','${work.reviewId}')">修改</button>
                                        <button type="button" class="btn btn-xs btn-danger" data-toggle="modal" onclick="delid(${work.id})" data-target="#delModel">删除</button>
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

                                <input type="hidden" id="deleteIdCurrentPage" name="currentPage" >
                                <input type="hidden" id="deleteIdpageSizes" name="pageSize" >
                                <input type="hidden" id="deleteNameId" name="nameId" >
                                <input type="hidden" id="deleteThing" name="thing" >
                                <input type="hidden" id="deleteForecast" name="forecast" >
                                <input type="hidden" id="deleteIsend" name="isend" >
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
                                <form method="post" id="addForm" action="${pageContext.request.contextPath}/work/add">
                                    <fieldset>


                                        <input type="hidden" id="addIdCurrentPage" name="currentPage" >
                                        <input type="hidden" id="addIdpageSizes" name="pageSize" >
                                        <input type="hidden" id="addNameId" name="addnameId" >
                                        <input type="hidden" id="addThing" name="addthing" >
                                        <input type="hidden" id="addForecast" name="addforecast" >
                                        <input type="hidden" id="addIsend" name="addisend" >



                                        <table style="width: 100%;height:350px;">
                                            <tr>
                                                <td><label for="input1" class="control-label">姓名</label></td>
                                                <td style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input1" readonly value="${zhnw_loginUser.trueName}"  >
                                                </div></td>
                                                <td><label for="input2" class="control-label">交代人</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="input2" class="form-control input-lg" name="accountableId" data-live-search="true">
                                                    </select>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input4" class="control-label">事项</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input4" placeholder="事项" name="thing"  onfocus="addthingfocus()"><span id="addthingspan" style="color:red;display:none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input8" class=" control-label">开始日期</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control date" id="input8" placeholder="(年年年年-月月-日日)" name="begin"   data-date-format="yyyy-mm-dd" readonly required>
                                                </div></td>
                                                <td><label for="input9" class="control-label">预计结束日期</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input9" onfocus="addforecastfocus()" placeholder="(年年年年-月月-日日)"  name="forecast"  data-date-format="yyyy-mm-dd" readonly required><span id="addforecastspan" style="color:red;display:none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input5" class=" control-label">结束日期</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control date" id="input5" placeholder="(年年年年-月月-日日)" name="end"   data-date-format="yyyy-mm-dd" readonly required>
                                                </div></td>
                                                <td><label for="input0" class="control-label">是否结束</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="input0" class="form-control input-lg" name="isend" data-live-search="true">
                                                        <option value="否">否</option>
                                                        <option value="是">是</option>
                                                    </select>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input7" class="control-label">进展</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input7" placeholder="进展" name="progress"  onfocus="addprogressfocus()"><span id="addprogressspan" style="color:red;display:none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input3" class=" control-label">复核人</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="input3" class="form-control input-lg" name="reviewId" data-live-search="true">
                                                    </select>
                                                </div></td>
                                                <td colspan="2"><input type="button" onclick="addwork()" class="btn btn-primary" style="height: 50px;width: 85%;" value="保存" /></td>
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
                                <form method="post" id="updateForm" action="${pageContext.request.contextPath}/work/update">
                                    <input type="hidden" id="updateId"  name="id" />
                                    <fieldset>


                                        <input type="hidden" id="updateIdCurrentPage" name="currentPage" >
                                        <input type="hidden" id="updateIdpageSizes" name="pageSize" >
                                        <input type="hidden" id="updateNameId" name="updatenameId" >
                                        <input type="hidden" id="updateThing" name="updatething" >
                                        <input type="hidden" id="updateForecast" name="updateforecast" >
                                        <input type="hidden" id="updateIsend" name="updateisend" >



                                        <table style="width: 100%;height:350px;">
                                            <tr>
                                                <td><label for="input11" class="control-label">姓名</label></td>
                                                <td style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input11" readonly value="${zhnw_loginUser.trueName}"  >
                                                </div></td>
                                                <td><label for="input12" class="control-label">交代人</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="input12" class="form-control input-lg" name="accountableId" data-live-search="true">
                                                    </select>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input14" class="control-label">事项</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input14" placeholder="事项" name="thing"  onfocus="updatethingfocus()"><span id="updatethingspan" style="color:red;display:none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input18" class=" control-label">开始日期</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control date" id="input18" placeholder="(年年年年-月月-日日)" name="begin"   data-date-format="yyyy-mm-dd" readonly required>
                                                </div></td>
                                                <td><label for="input19" class="control-label">预计结束日期</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input19" placeholder="(年年年年-月月-日日)"  name="forecast"  data-date-format="yyyy-mm-dd" readonly onfocus="updateforecastfocus()"><span id="updateforecastspan" style="color:red;display:none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input15" class=" control-label">结束日期</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control date" id="input15" placeholder="(年年年年-月月-日日)" name="end"   data-date-format="yyyy-mm-dd" readonly required>
                                                </div></td>
                                                <td><label for="input10" class="control-label">是否结束</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="input10" class="form-control input-lg" name="isend" data-live-search="true"></select>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input17" class="control-label">进展</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input17" placeholder="进展" name="progress" onfocus="updateprogressfocus()" ><span id="updateprogressspan" style="color:red;display:none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input13" class=" control-label">复核人</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="input13" class="form-control input-lg" name="reviewId" data-live-search="true">
                                                    </select>
                                                </div></td>
                                                <td colspan="2"><input type="button" onclick="updatework()" class="btn btn-primary" style="height: 50px;width: 85%;" value="保存" /></td>
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
<script type="text/javascript">
    $('#selectForecastSou').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });

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

    $('#input5').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    })

    $('#input19').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });

    $('#input18').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });

    $('#input15').datetimepicker({
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
