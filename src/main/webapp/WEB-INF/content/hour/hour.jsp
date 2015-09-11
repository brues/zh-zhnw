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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/bootstrap/css/bootstrap.min.css">
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
    <%-- 分页 end --%>

    <%-- add project ajax begin--%>
    <script>
        $.ajax({
            url:"${pageContext.request.contextPath}/user/userJson",
            dataType:"json",
            success:function(data){
                for(i=0;i<data.length;i++){
                    if(data[i].id==${zhnw_loginUser.id}){
                        $("#input2").append("<option selected='selected' value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                    }else{
                        $("#input2").append("<option value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                    }
                }
                $('#input2').selectpicker({
                    'selectedText': 'cat'
                });
            }
        });


        $.ajax({
            url:"${pageContext.request.contextPath}/user/userJson",
            dataType:"json",
            success:function(data){
                for(i=0;i<data.length;i++){
                    if(data[i].id==$("#inputClientSou").val()){
                        $("#input8").append("<option selected='selected' value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                    }else{
                        $("#input8").append("<option value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                    }
                }
                $('#input8').selectpicker({
                    'selectedText': 'cat'
                });
            }
        });

    </script>
    <%-- add project ajax end--%>

    <%-- add begin --%>
    <script>
        function saveBtn(){
            var dates = $.trim($("#input1").val());
            var begin = $.trim($("#input3").val());
            var end = $.trim($("#input6").val());
            var detail = $.trim($("#input9").val());

            if(dates==null||dates==''){
                $("#adddatesspan").html("日期不能为空！");
                $("#adddatesspan").css("display","block");
            }else if(begin==null||begin==''){
                $("#addbeginspan").html("开始时间不能为空！");
                $("#addbeginspan").css("display","block");
            }else if(end==null||end==''){
                $("#addendspan").html("结束时间不能为空！");
                $("#addendspan").css("display","block");
            }else if(detail==null||detail==''){
                $("#adddetailspan").html("详细描述不能为空！");
                $("#adddetailspan").css("display","block");
            }else{
                $("#addcurrentpagehidden").val($("#currentPageHidden").val());
                $("#addpagesizehiden").val($("#pageSizeHidden").val());
                $("#addnamesouhidden").val($("#souNameInput").val());
                $("#addForm").submit();
            }
        }

        function adddatesfocus(){
            $("#adddatesspan").css("display","none");
        }

        function addbeginfocus(){
            $("#addbeginspan").css("display","none");
        }

        function addendfocus(){
            $("#addendspan").css("display","none");
        }

        function adddetailfocus(){
            $("#adddetailspan").css("display","none");
        }
    </script>
    <%-- add end --%>


    <%-- update begin --%>
    <script>
        function updateNum(id,num){
            $("#updateNumId").val(id);
            $("#input1101").val(num);
        }

        function xiugai(id,dates,name,detail,begin,end,hour,checkName,success,projectId,checkId,nameId){
            $("#updateId").val(id);
            $("#updateProjectId").val(projectId);

            $("#input101").val(dates);
            $("#input102").val(name);
            $("#input103").val(begin);
            $("#input106").val(end);
            $("#input108").val(checkName);
            $("#input109").val(detail);

            $.ajax({
                url:"${pageContext.request.contextPath}/user/userJson",
                dataType:"json",
                success:function(data){
                    for(i=0;i<data.length;i++){
                        if(data[i].id==nameId){
                            $("#input102").append("<option selected='selected' value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                        }else{
                            $("#input102").append("<option value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                        }
                    }
                    $('#input102').selectpicker({
                        'selectedText': 'cat'
                    });
                }
            });
        }

        function updateBtn(){
            var dates = $.trim($("#input101").val());
            var begin = $.trim($("#input103").val());
            var end = $.trim($("#input106").val());
            var detail = $.trim($("#input109").val());

            if(dates==null||dates==''){
                $("#updatedatesspan").html("日期不能为空！");
                $("#updatedatesspan").css("display","block");
            }else if(begin==null||begin==''){
                $("#updatebeginspan").html("开始时间不能为空！");
                $("#updatebeginspan").css("display","block");
            }else if(end==null||end==''){
                $("#updateendspan").html("结束时间不能为空！");
                $("#updateendspan").css("display","block");
            }else if(detail==null||detail==''){
                $("#updatedetailspan").html("详细描述不能为空！");
                $("#updatedetailspan").css("display","block");
            }else{
                $("#udpatecurrentpagehidden").val($("#currentPageHidden").val());
                $("#udpatepagesizehiden").val($("#pageSizeHidden").val());
                $("#udpatenamesouhidden").val($("#souNameInput").val());
                $("#updateForm").submit();
            }
        }

        function updatedatesfocus(){
            $("#updatedatesspan").css("display","none");
        }

        function updatebeginfocus(){
            $("#updatebeginspan").css("display","none");
        }

        function updateendfocus(){
            $("#updateendspan").css("display","none");
        }

        function updatedetailfocus(){
            $("#updatedetailspan").css("display","none");
        }
    </script>
    <%-- update end --%>

    <%--  --%>
    <script>
        function delid(id){
            $("#deleteIdInput").val(id);
        }
        function deleteById(){
            $("#deleteIdFormId").val($("#deleteIdInput").val());


            $("#deletecurrentpagehidden").val($("#currentPageHidden").val());
            $("#deletepagesizehiden").val($("#pageSizeHidden").val());
            $("#deletenamesouhidden").val($("#souNameInput").val());

            $("#deleteIdForm").attr("action","${pageContext.request.contextPath}/hour/delete");
            $("#deleteIdForm").submit();
        }


    </script>


</head>
<body>
<div class="container" style="width: 100%;max-width:95%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/hour" method="post" style="font-size: 10pt;" class="form-horizontal"  role="form">
                    <div>
                        <button type="button" class="btn btn-success" data-target="#addModel" data-toggle="modal" style="">添加记录</button>
                        姓名：<input type="text" id="souNameInput" name="name" value="${name}">
                        <button type="submit" class="btn btn-primary" style="">搜索</button>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>日期</th>
                            <th>员工姓名</th>
                            <th>详细描述</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>工时小计</th>
                            <th>审核人</th>
                            <th>是否通过</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="hours" items="${hourList}">
                            <tr>
                                <td>${hours.dates}</td>
                                <td>${hours.name}</td>
                                <td>${hours.detail}</td>
                                <td>${hours.begin}</td>
                                <td>${hours.end}</td>
                                <td>${hours.hour}</td>
                                <td>${hours.checkName}</td>
                                <td>${hours.success}</td>
                                <td>
                                    <c:if test="${zhnw_loginUser.id==hours.nameId&&hours.success=='否'}">
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#updateModel" onclick="xiugai('${hours.id}','${hours.dates}','${hours.name}','${hours.detail}','${hours.begin}','${hours.end}','${hours.hour}','${hours.checkName}','${hours.success}','${hours.projectId}','${hours.checkId}','${hours.nameId}')">修改</button>
                                    <button type="button" class="btn btn-xs btn-danger" data-toggle="modal" onclick="delid(${hours.id})" data-target="#delModel">删除</button>
                                    </c:if>
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
                                <input type="hidden" id="deleteProjectId"  name="projectId" value="${projectId}" />

                                <input type="hidden" id="deletecurrentpagehidden"  name="currentPage" />
                                <input type="hidden"  id="deletepagesizehiden" name="pageSize"  />
                                <input type="hidden" id="deletenamesouhidden"  name="name0"  />
                            </form>
                        </div>
                    </div>
                </div>
                <%-- delete end --%>




                <%-- update begin --%>
                <div class="modal fade bs-example-modal-lg" id="updateModel" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-lg" style="width: 90%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="updateModalLabel">修改人员</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="updateForm" action="${pageContext.request.contextPath}/hour/update">
                                    <input type="hidden" id="updateId"  name="id" />
                                    <input type="hidden" id="updateProjectId"  name="projectId" value="${projectId}" />

                                    <input type="hidden" id="udpatecurrentpagehidden"  name="currentPage" />
                                    <input type="hidden"  id="udpatepagesizehiden" name="pageSize"  />
                                    <input type="hidden" id="udpatenamesouhidden"  name="name0"  />
                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <tr>
                                                <td><label for="input101" class="control-label">日期</label></td>
                                                <td style="width: 50%;"><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input101" data-date-format="yyyy-mm-dd" placeholder="(年年年年-月月-日日)" name="dates" onfocus="updatedatesfocus()" readonly ><span id="updatedatesspan" style="color: red;display: none;"></span>
                                                </div></td>
                                                <td><label for="input102" class="control-label">员工姓名</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="input102" class="form-control input-lg" name="name" data-live-search="true">
                                                    </select>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input103" class=" control-label">开始时间</label></td>
                                                <td><div class="col-sm-10">
                                                    <input  type="text" class="form-control" id="input103" data-date-format="hh:ii" placeholder="(时时:分分:秒秒)" name="begin" onfocus="updatebeginfocus()" readonly /><span id="updatebeginspan" style="color: red;display: none;"></span>
                                                </div></td>
                                                <td><label for="input106" class="control-label">结束时间</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input106" data-date-format="hh:ii" placeholder="(时时:分分:秒秒)" name="end" onfocus="updateendfocus()" readonly/><span id="updateendspan" style="color: red;display: none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input109" class=" control-label">详细描述</label></td>
                                                <td colspan="3"><div class="col-sm-11" style="width: 94%;">
                                                    <input  type="text" class="form-control" id="input109" placeholder="详细描述" name="detail" onfocus="updatedetailfocus()" required/><span id="updatedetailspan" style="color: red;display: none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><input type="button" onclick="updateBtn()" class="btn btn-primary" style="height: 50px;width: 95%;" value="保存" /></td>
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




<div class="container">
    <%-- add begin --%>
    <div class="modal fade bs-example-modal-lg" id="addModel" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg" style="width: 100%;">
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="addModalLabel">添加记录</h4>
                </div>
                <div class="modal-body">
                    <form method="post" id="addForm" action="${pageContext.request.contextPath}/hour/add">
                        <fieldset>
                            <input type="hidden"  name="projectId" value="${projectId}" />

                            <input type="hidden" id="addcurrentpagehidden"  name="currentPage" />
                            <input type="hidden"  id="addpagesizehiden" name="pageSize"  />
                            <input type="hidden" id="addnamesouhidden"  name="name0"  />
                            <table style="width: 100%;height: 300px;">
                                <tr>
                                    <td><label for="input1" class="control-label">日期</label></td>
                                    <td style="width: 50%;"><div class="col-sm-10">
                                        <input type="text" class="form-control" id="input1" data-date-format="yyyy-mm-dd" placeholder="(年年年年-月月-日日)" name="dates" onfocus="adddatesfocus()" readonly ><span id="adddatesspan" style="color: red;display: none;"></span>
                                    </div></td>
                                    <td><label for="input2" class="control-label">员工姓名</label></td>
                                    <td><div class="col-sm-10">
                                        <select id="input2" class="form-control input-lg" name="name" data-live-search="true">
                                        </select>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td><label for="input3" class=" control-label">开始时间</label></td>
                                    <td><div class="col-sm-10">
                                        <input  type="text" class="form-control" id="input3" data-date-format="hh:ii" onfocus="addbeginfocus()"  placeholder="(时时:分分)" name="begin"  readonly /><span id="addbeginspan" style="color: red;display: none;"></span>
                                    </div></td>
                                    <td><label for="input6" class="control-label">结束时间</label></td>
                                    <td><div class="col-sm-10">
                                        <input type="text" class="form-control" id="input6" onfocus="addendfocus()" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii" placeholder="(时时:分分)" name="end"  readonly /><span id="addendspan" style="color: red;display: none;"></span>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td><label for="input9" class=" control-label">详细描述</label></td>
                                    <td colspan="3"><div class="col-sm-11" style="width: 94%;">
                                        <input  type="text" class="form-control" id="input9" placeholder="详细描述" name="detail" onfocus="adddetailfocus()" required/><span id="adddetailspan" style="color: red;display: none;"></span>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><input type="button" onclick="saveBtn()" class="btn btn-primary" style="height: 50px;width: 93%;" value="保存" /></td>
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
    $('#input101').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('#input3').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });
    $('#input3').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });
    $('#input6').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });
    $('#input103').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });
    $('#input106').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });

</script>
</body>
</html>
