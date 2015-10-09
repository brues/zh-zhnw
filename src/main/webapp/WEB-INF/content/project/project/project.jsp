<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
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

    <%-- 分页 js begin --%>
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
    <%-- 分页 js end --%>


    <%-- 搜索查询 Ajax begin --%>
    <script>
        $.ajax({
            url:"${pageContext.request.contextPath}/client/clientJson",
            dataType:"json",
            success:function(data){
                $("#selectClientSou").append("<option value='0'>请选择客户名称</option>");
                for(i=0;i<data.length;i++){
                    if(data[i].id==$("#inputClientSou").val()){
                        $("#selectClientSou").append("<option selected='selected' value='"+data[i].id+"'>"+data[i].comName+"</option>");
                    }else{
                        $("#selectClientSou").append("<option value='"+data[i].id+"'>"+data[i].comName+"</option>");
                    }
                }
                $('#selectClientSou').selectpicker({
                    'selectedText': 'cat'
                });
            }
        });
        $.ajax({
            url:"${pageContext.request.contextPath}/btype/btypeJson",
            dataType:"json",
            success:function(data){
                $("#selectBTypeSou").append("<option value='0'>请选择业务类型</option>");
                for(i=0;i<data.length;i++){
                    if(data[i].id==$("#inputBTypeSou").val()){
                        $("#selectBTypeSou").append("<option selected='selected' value='"+data[i].id+"'>"+data[i].name+"</option>");
                    }else{
                        $("#selectBTypeSou").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                    }
                }
                $('#selectBTypeSou').selectpicker({
                    'selectedText': 'cat'
                });
            }
        });
        $.ajax({
            url:"${pageContext.request.contextPath}/user/userJson",
            dataType:"json",
            success:function(data){
                $("#selectContractSou").append("<option value='0'>请选择负责人</option>");
                for(i=0;i<data.length;i++){
                    if(data[i].id==$("#inputContractSou").val()){
                        $("#selectContractSou").append("<option selected='selected' value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                    }else{
                        $("#selectContractSou").append("<option value='"+data[i].id+"'>"+data[i].trueName+"</option>");
                    }
                }
                $('#selectContractSou').selectpicker({
                    'selectedText': 'cat'
                });
            }
        });
    </script>
    <%-- 搜索查询 Ajax end --%>

    <%--  add begin  --%>
    <script>
        function beforeAdd(){
            $("#addclientinput").val($("#selectClientSou").val());
            $("#addbtypeinput").val($("#selectBTypeSou").val());
            $("#addcontractinput").val($("#selectContractSou").val());
            $("#addcurrentpageinput").val($("#currentPageHidden").val());
            $("#addpagesizeinput").val($("#pageSizeHidden").val());
        }

        $.ajax({
            url:"${pageContext.request.contextPath}/client/clientJson",
            dataType:"json",
            success:function(data){
                for(i=0;i<data.length;i++){
                    $("#input1").append("<option value='"+data[i].id+"'>"+data[i].comName+"</option>");
                }
                $('#input1').selectpicker({
                    'selectedText': 'cat'
                });
            }
        });
        $.ajax({
            url:"${pageContext.request.contextPath}/btype/btypeJson",
            dataType:"json",
            success:function(data){
                for(i=0;i<data.length;i++){
                    $("#input3").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $('#input3').selectpicker({
                    'selectedText': 'cat'
                });
            }
        });


    </script>
    <%--  add end  --%>

    <%-- update begin --%>
    <script>
        function xiugai(id,clientId,clientName,contactId,contacts,beginDate,endDate,businessTypeId,businessType,contractMoney,isPigeonhole){
            $("#updateId").val(id);

            $("#updateclientinput").val($("#selectClientSou").val());
            $("#updatebtypeinput").val($("#selectBTypeSou").val());
            $("#updatecontractinput").val($("#selectContractSou").val());
            $("#updatecurrentpageinput").val($("#currentPageHidden").val());
            $("#updatepagesizeinput").val($("#pageSizeHidden").val());



            $("#input108").val(beginDate);
            $("#input109").val(endDate);

            $("#input106").val(contractMoney);

            if(isPigeonhole=="否"){
                $("#input107").html("");
                $("#input107").append("<option value='否'>否</option>");
                $("#input107").append("<option value='是'>是</option>");
            }else{
                $("#input107").html("");
                $("#input107").append("<option value='否'>否</option>");
                $("#input107").append("<option selected='selected' value='是'>是</option>");
            }

            $.ajax({
                url:"${pageContext.request.contextPath}/client/clientJson",
                dataType:"json",
                success:function(data){
                    for(i=0;i<data.length;i++){
                        if(data[i].id==clientId){
                            $("#input101").append("<option selected='selected' value='"+data[i].id+"'>"+data[i].comName+"</option>");
                        }else{
                            $("#input101").append("<option value='"+data[i].id+"'>"+data[i].comName+"</option>");
                        }
                    }
                    $('#input101').selectpicker({
                        'selectedText': 'cat'
                    });
                }
            });

            $.ajax({
                url:"${pageContext.request.contextPath}/btype/btypeJson",
                dataType:"json",
                success:function(data){
                    for(i=0;i<data.length;i++){
                        if(data[i].id==businessTypeId){
                            $("#input103").append("<option selected='selected' value='"+data[i].id+"'>"+data[i].name+"</option>");
                        }else{
                            $("#input103").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                        }
                    }
                    $('#input103').selectpicker({
                        'selectedText': 'cat'
                    });
                }
            });
        }
    </script>
    <%-- update begin --%>

    <%-- update num begin --%>
    <script>
        function updateNum(id,num){
            $("#updateNumId").val(id);
            $("#input1101").val(num);

            $("#updatenumclientinput").val($("#selectClientSou").val());
            $("#updatenumbtypeinput").val($("#selectBTypeSou").val());
            $("#updatenumcontractinput").val($("#selectContractSou").val());
            $("#updatenumcurrentpageinput").val($("#currentPageHidden").val());
            $("#updatenumpagesizeinput").val($("#pageSizeHidden").val());
        }

        function updateNumBtn(){
            var num = $.trim($("#input1101").val());
            if(num==null||num==''){
                $("#updatenumnumspan").html("合同编号不能为空！");
                $("#updatenumnumspan").css("display","block");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/project/updateNumNumSingle",
                    data:{id:$("#updateNumId").val(),num:num},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if(data=='1'){
                            $("#updatenumnumspan").html("合同编号已存在！");
                            $("#updatenumnumspan").css("display","block");
                        }else{
                            $("#updateNumForm").submit();
                        }
                    }
                });
            }
        }

        function updateNumNumFocus(){
            $("#updatenumnumspan").css("display","none");
        }
    </script>
    <%-- update num end --%>

    <%-- delete begin --%>
    <script>
        function delid(id){
            $("#deleteIdInput").val(id);

            $("#deleteclientinput").val($("#selectClientSou").val());
            $("#deletebtypeinput").val($("#selectBTypeSou").val());
            $("#deletecontractinput").val($("#selectContractSou").val());
            $("#deletecurrentpageinput").val($("#currentPageHidden").val());
            $("#deletepagesizeinput").val($("#pageSizeHidden").val());
        }
        function deleteById(){
            $("#deleteIdFormId").val($("#deleteIdInput").val());
            $("#deleteIdForm").attr("action","${pageContext.request.contextPath}/project/delete");
            $("#deleteIdForm").submit();
        }
    </script>
    <%-- delete end --%>

</head>
<body style="margin: 0;padding: 0;border: 0;">
<div class="container" style="width: 100%;max-width:95%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/project" method="post" style="font-size: 10pt;">
                    <div>
                        <button type="button" onclick="beforeAdd()" class="btn btn-success" data-target="#addModel" data-toggle="modal" style="margin-bottom: 10px;">添加合同</button>
                        <select id="selectClientSou" name="selectClientSouName" class="selectpicker bla bla bli"  data-live-search="true">
                        </select>
                        <input type="hidden" id="inputClientSou" value="${selectClientSouName}">
                        <input type="hidden" id="inputBTypeSou" value="${selectBTypeSouName}">
                        <input type="hidden" id="inputContractSou" value="${selectContractSouName}">
                        <select id="selectBTypeSou" name="selectBTypeSouName" class="selectpicker bla bla bli"  data-live-search="true">
                        </select>
                        <select id="selectContractSou" name="selectContractSouName" class="selectpicker bla bla bli"  data-live-search="true">
                        </select>
                        <button type="submit" class="btn btn-primary" style="margin-bottom: 10px;">搜索</button>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>客户名称</th>
                            <th>负责人</th>
                            <th>业务</th>
                            <th>合同编号</th>
                            <th>开始日期</th>
                            <th>结束日期</th>
                            <th>金额</th>
                            <th>是否归档</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="project" items="${projectList}">
                            <tr>
                                <td>${project.clientName}</td>
                                <td>${project.contacts}</td>
                                <td>${project.businessType}</td>
                                <td>${project.contractNum}</td>
                                <td>${project.beginDate}</td>
                                <td>${project.endDate}</td>
                                <td>${project.contractMoney}</td>
                                <td>${project.isPigeonhole}</td>
                                <td>
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#updateModel" onclick="xiugai('${project.id}','${project.clientId}','${project.clientName}','${project.contactId}','${project.contacts}','${project.beginDate}','${project.endDate}','${project.businessTypeId}','${project.businessType}','${project.contractMoney}','${project.isPigeonhole}')">修改</button>
                                    <button type="button" class="btn btn-xs btn-danger" data-toggle="modal" onclick="delid(${project.id})" data-target="#delModel">删除</button>
                                    <button type="button" class="btn btn-xs btn-success" data-target="#updateNumModel" data-toggle="modal" onclick="updateNum('${project.id}','${project.contractNum}')" >修改合同编号</button>
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
                                <input type="hidden" id="deleteclientinput"  name="selectClientSouName" />
                                <input type="hidden" id="deletebtypeinput"  name="selectBTypeSouName"  />
                                <input type="hidden" id="deletecontractinput"  name="selectContractSouName" />
                                <input type="hidden" id="deletecurrentpageinput"  name="currentPage" />
                                <input type="hidden" id="deletepagesizeinput"  name="pageSize" />


                                <input type="hidden" id="deleteIdFormId" name="id">
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
                                <h4 class="modal-title" id="addModalLabel">添加合同</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="addForm" action="${pageContext.request.contextPath}/project/add">
                                    <fieldset>
                                        <input type="hidden"  name="id" value="${id}" />
                                        <input type="hidden"  name="projectId" value="${projectId}" />
                                        <input type="hidden" id="addclientinput"  name="selectClientSouName" />
                                        <input type="hidden" id="addbtypeinput"  name="selectBTypeSouName"  />
                                        <input type="hidden" id="addcontractinput"  name="selectContractSouName" />
                                        <input type="hidden" id="addcurrentpageinput"  name="currentPage" />
                                        <input type="hidden" id="addpagesizeinput"  name="pageSize" />
                                        <table style="width: 100%;height:350px;">
                                            <tr>
                                                <td><label for="input1" class="control-label">客户名称</label></td>
                                                <td style=""><div class="col-sm-10">
                                                    <select id="input1" class="form-control input-lg" name="clientName" data-live-search="true">
                                                    </select>
                                                </div></td>
                                                <td><label for="input2" class="control-label">项目负责人</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input2" placeholder="项目负责人" readonly name="contacts" value="${zhnw_loginUser.trueName}"  >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input8" class=" control-label">开始日期</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control date" id="input8" placeholder="(年年年年-月月-日日)" name="beginDate"   data-date-format="yyyy-mm-dd" readonly required>
                                                </div></td>
                                                <td><label for="input9" class="control-label">结束日期</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input9" placeholder="(年年年年-月月-日日)"  name="endDate"  data-date-format="yyyy-mm-dd" readonly required>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input3" class=" control-label">业务类型</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="input3" class="form-control input-lg" name="businessType" data-live-search="true">
                                                    </select>
                                                </div></td>
                                                <td><label for="input6" class="control-label">合同金额</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input6" placeholder="合同金额" name="contractMoney" required >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input7" class="control-label">是否归档</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="input7" class="form-control input-lg" name="isPigeonhole">
                                                        <option value="否">否</option>
                                                        <option value="是">是</option>
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
                                <h4 class="modal-title" id="updateModalLabel">修改合同</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="updateForm" action="${pageContext.request.contextPath}/project/update">
                                    <input type="hidden" id="updateId"  name="id" />

                                    <input type="hidden" id="updateclientinput"  name="selectClientSouName" />
                                    <input type="hidden" id="updatebtypeinput"  name="selectBTypeSouName"  />
                                    <input type="hidden" id="updatecontractinput"  name="selectContractSouName" />
                                    <input type="hidden" id="updatecurrentpageinput"  name="currentPage" />
                                    <input type="hidden" id="updatepagesizeinput"  name="pageSize" />

                                    <fieldset>
                                        <table style="width: 100%;height:350px;">
                                            <tr>
                                                <td><label for="input101" class="control-label">客户名称</label></td>
                                                <td style=""><div class="col-sm-10">
                                                    <select id="input101" class="form-control input-lg" name="clientName" data-live-search="true">
                                                    </select>
                                                </div></td>
                                                <td><label for="input102" class="control-label">项目负责人</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input102" placeholder="项目负责人" readonly name="contacts" value="${zhnw_loginUser.trueName}"  >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input108" class=" control-label">开始日期</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control date" id="input108" placeholder="(年年年年-月月-日日)" name="beginDate" value="${beginDate}" required data-date-format="yyyy-mm-dd" readonly>
                                                </div></td>
                                                <td><label for="input109" class="control-label">结束日期</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input109" placeholder="(年年年年-月月-日日)" required name="endDate" value="${endDate}" data-date-format="yyyy-mm-dd" readonly>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input103" class=" control-label">业务类型</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="input103" class="form-control input-lg" name="businessType" data-live-search="true">
                                                    </select>
                                                </div></td>
                                                <td><label for="input106" class="control-label">合同金额</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input106" placeholder="合同金额" name="contractMoney" required >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input107" class="control-label">是否归档</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="input107" class="form-control input-lg" name="isPigeonhole">
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

                <%-- updateNum begin --%>
                <div class="modal fade bs-example-modal-lg" id="updateNumModel" tabindex="-1" role="dialog" aria-labelledby="updateNumModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-lg" style="width: 90%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="updateNumModalLabel">修改合同编号</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="updateNumForm" action="${pageContext.request.contextPath}/project/updateNum">
                                    <fieldset>
                                        <input type="hidden" id="updateNumId"  name="id" />

                                        <input type="hidden" id="updatenumclientinput"  name="selectClientSouName" />
                                        <input type="hidden" id="updatenumbtypeinput"  name="selectBTypeSouName"  />
                                        <input type="hidden" id="updatenumcontractinput"  name="selectContractSouName" />
                                        <input type="hidden" id="updatenumcurrentpageinput"  name="currentPage" />
                                        <input type="hidden" id="updatenumpagesizeinput"  name="pageSize" />

                                        <table style="width: 100%;height:350px;">
                                            <tr>
                                                <td><label for="input1101" class="control-label">合同编号</label></td>
                                                <td style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input1101" placeholder="合同编号" name="contractNum" onfocus="updateNumNumFocus()" required ><span id="updatenumnumspan" style="color:red;display: none;"></span>
                                                </div></td>
                                                <td colspan="2"><input type="button" onclick="updateNumBtn()" class="btn btn-primary" style="height: 50px;width: 85%;" value="保存" /></td>
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
                <%-- updateNum end --%>
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
