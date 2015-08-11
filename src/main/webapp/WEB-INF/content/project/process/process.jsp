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

    <%-- 分页 begin --%>
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
    <%-- 分页 begin --%>

    <%-- add project script begin--%>
    <script>
        $.ajax({
            url:"${pageContext.request.contextPath}/user/userJson",
            dataType:"json",
            success:function(data){
                for(i=0;i<data.length;i++){
                    $("#input4").append("<option value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                    $("#input6").append("<option value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                }
                $('#input4').selectpicker({
                    'selectedText': 'cat'
                })
                $('#input6').selectpicker({
                    'selectedText': 'cat'
                });
            }
        });

        function addwork(){
            $("#addSouContentInput").val($("#souContentInput").val());
            $("#addcurrentpageInput").val($("#currentPageHidden").val());
            $("#addpagesizeInput").val($("#pageSizeHidden").val());

            var dates= $.trim($("#input1").val());
            var work= $.trim($("#input2").val());
            if(dates==null||dates==''){
                $("#adddatesspan").html("日期不能为空！");
                $("#adddatesspan").css("display","block");
            }else if(work==null||work==''){
                $("#addworkspan").html("工作事项不能为空！");
                $("#addworkspan").css("display","block");
            }else{
                $("#addForm").submit();
            }
        }

        function adddatesfocus(){
            $("#adddatesspan").css("display","none");
        }

        function addworkfocus(){
            $("#addworkspan").css("display","none");
        }
    </script>
    <%-- add project script end--%>

    <%-- delete begin --%>
    <script>
        function delid(id){
            $("#deleteIdInput").val(id);
        }
        function deleteById(){
            $("#deleteIdFormId").val($("#deleteIdInput").val());

            $("#deleteIdCurrentPage").val($("#souCurrentPageInput").val());
            $("#deleteIdpageSizes").val($("#pageSizeHidden").val());
            $("#deleteIdActorName").val($("#souContentInput").val());


            $("#deleteIdForm").attr("action","${pageContext.request.contextPath}/project/process/delete");
            $("#deleteIdForm").submit();
        }
    </script>
    <%-- delete end --%>

    <%-- update begin --%>
    <script>
        function xiugai(id,remark,remarkDate,projectId,dates,work,result,waitok,principal,reviewer,principalId,reviewerId){
            $("#updateId").val(id);
            $("#updateSouContentInput").val($("#souContentInput").val());

            $("#input11").val(dates);
            $("#input12").val(work);
            $("#input13").val(result);
            $("#input15").val(waitok);
            $("#input17").val(remark);
            $.ajax({
                url:"${pageContext.request.contextPath}/user/userJson",
                dataType:"json",
                success:function(data){
                    for(i=0;i<data.length;i++){
                        if(principalId==data[i].id){
                            $("#input14").append("<option selected='selected' value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                        }else{
                            $("#input14").append("<option value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                        }

                        if(reviewerId==data[i].id){
                            $("#input16").append("<option selected='selected' value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                        }else{
                            $("#input16").append("<option value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                        }
                    }
                    $('#input14').selectpicker({
                        'selectedText': 'cat'
                    })
                    $('#input16').selectpicker({
                        'selectedText': 'cat'
                    });
                }
            });

        }

        function update(){
            $("#updateSouContentInput").val($("#souContentInput").val());
            $("#updatecurrentpageInput").val($("#currentPageHidden").val());
            $("#updatepagesizeInput").val($("#pageSizeHidden").val());

            var dates= $.trim($("#input11").val());
            var work= $.trim($("#input12").val());
            if(dates==null||dates==''){
                $("#updatedatesspan").html("日期不能为空！");
                $("#updatedatesspan").css("display","block");
            }else if(work==null||work==''){
                $("#updateworkspan").html("工作事项不能为空！");
                $("#updateworkspan").css("display","block");
            }else{
                $("#updateForm").submit();
            }
        }

        function updatedatesfocus(){
            $("#updatedatesspan").css("display","none");
        }

        function updateworkfocus(){
            $("#updateworkspan").css("display","none");
        }
    </script>
    <%-- update end --%>

</head>
<body>
<div class="container" style="width: 100%;max-width:95%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/project/process" method="post" style="font-size: 10pt;">
                    <div>
                        <button type="button" class="btn btn-success" data-target="#addModel" data-toggle="modal" style="margin-bottom: 10px;">添加记录</button>
                        内容：<input type="text" id="souContentInput" name="souContent" value="${souContent}">
                        <button type="submit" class="btn btn-primary" style="margin-bottom: 10px;">模糊搜索</button>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>日期</th>
                            <th>工作事项</th>
                            <th>结果</th>
                            <th>待确认</th>
                            <th>具体负责人</th>
                            <th>复核人员</th>
                            <th>备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="p" items="${processList}">
                            <tr>
                                <td>${p.dates}</td>
                                <td>${p.work}</td>
                                <td>${p.result}</td>
                                <td>${p.waitok}</td>
                                <td>${p.principal}</td>
                                <td>${p.reviewer}</td>
                                <td>${p.remark}</td>
                                <td>
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#updateModel" onclick="xiugai('${p.id}','${p.remark}','${p.remarkDate}','${p.projectId}','${p.dates}','${p.work}','${p.result}','${p.waitok}','${p.principal}','${p.reviewer}','${p.principalId}','${p.reviewerId}')">修改</button>
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
                        第<input type="text" id="souCurrentPageInput" onblur="tiaozhuan()" value="${currentPage}" style="width: 30px;height: 40px;">/${totalPage}页
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
                                <input type="hidden"  name="projectId" value="${projectId}"  />
                                <input type="hidden" id="deleteIdFormId" name="id">
                                <input type="hidden" id="deleteIdCurrentPage" name="currentPage" value="${currentPage}">
                                <input type="hidden" id="deleteIdpageSizes" name="pageSize" value="${pageSize}">
                                <input type="hidden" id="deleteIdActorName" name="souContent" value="${souContent}">
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
                                <h4 class="modal-title" id="addModalLabel">添加记录</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="addForm" action="${pageContext.request.contextPath}/project/process/add">
                                    <fieldset>
                                        <input type="hidden"  name="projectId" value="${projectId}" />
                                        <input type="hidden" id="addSouContentInput"  name="souContent" value="${souContent}" />
                                        <input type="hidden" id="addcurrentpageInput"  name="currentPage"  />
                                        <input type="hidden" id="addpagesizeInput"  name="pageSize"  />
                                        <table style="width: 100%;height:350px;">
                                            <tr>
                                                <td><label for="input1" class="control-label">日期</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input1" onfocus="adddatesfocus()" readonly data-date-format="yyyy-mm-dd" placeholder="日期" name="dates"><span id="adddatesspan" style="color: red;display: none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input2" class="control-label">工作事项</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input2" placeholder="工作事项" name="work"  onfocus="addworkfocus()"><span id="addworkspan" style="color: red;display: none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input3" class="control-label">结果</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input3" placeholder="结果" name="result"  >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input5" class="control-label">待确认</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input5" placeholder="待确认" name="waitok"  >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input4" class="control-label">具体负责人</label></td>
                                                <td  style=""><div class="col-sm-10">
                                                    <select id="input4" class="form-control input-lg" name="principalId" data-live-search="true"></select>
                                                </div></td>
                                                <td><label for="input6" class="control-label">复核人</label></td>
                                                <td  style=""><div class="col-sm-10">
                                                    <select id="input6" class="form-control input-lg" name="reviewerId" data-live-search="true"></select>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input7" class="control-label">备注</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input7" placeholder="备注" name="remark"  >
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
                                <h4 class="modal-title" id="updateModalLabel">修改人员</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="updateForm" action="${pageContext.request.contextPath}/project/process/update">
                                    <input type="hidden" id="updateId"  name="id" />
                                    <input type="hidden"  name="projectId" value="${projectId}" />
                                    <input type="hidden" id="updateSouContentInput"  name="souContent" value="${souContent}" />

                                    <input type="hidden" id="updatecurrentpageInput"  name="currentPage"  />
                                    <input type="hidden" id="updatepagesizeInput"  name="pageSize"  />
                                    <fieldset>
                                        <table style="width: 100%;height:350px;">
                                            <tr>
                                                <td><label for="input11" class="control-label">日期</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input11" readonly data-date-format="yyyy-mm-dd" placeholder="日期" name="dates" onfocus="updatedatesfocus()" ><span id="updatedatesspan" style="color: red;display: none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input12" class="control-label">工作事项</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input12" placeholder="工作事项" name="work" onfocus="updateworkfocus()" ><span id="updateworkspan" style="color: red;display: none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input13" class="control-label">结果</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input13" placeholder="结果" name="result"  >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input15" class="control-label">待确认</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input15" placeholder="待确认" name="waitok"  >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input14" class="control-label">具体负责人</label></td>
                                                <td  style=""><div class="col-sm-10">
                                                    <select id="input14" class="form-control input-lg" name="principalId" data-live-search="true"></select>
                                                </div></td>
                                                <td><label for="input16" class="control-label">复核人</label></td>
                                                <td  style=""><div class="col-sm-10">
                                                    <select id="input16" class="form-control input-lg" name="reviewerId" data-live-search="true"></select>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input17" class="control-label">备注</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input17" placeholder="备注" name="remark"  >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><input type="button" onclick="update()" class="btn btn-primary" style="height: 50px;width: 85%;" value="保存" /></td>
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
    $('#input1').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });

    $('#input11').datetimepicker({
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
