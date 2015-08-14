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

    <%-- delete begin --%>
    <script>
        function delid(id){
            $("#deleteIdInput").val(id);

            $("#deleteIdCurrentPage").val($("#currentPageHidden").val());
            $("#deleteIdpageSizes").val($("#pageSizeHidden").val());
            $("#deleteIdSou").val($("#sousouinput").val());
        }
        function deleteById(){
            $("#deleteIdFormId").val($("#deleteIdInput").val());
            $("#deleteIdForm").attr("action","${pageContext.request.contextPath}/invoice/delete");
            $("#deleteIdForm").submit();
        }
    </script>
    <%-- delete end --%>

    <%-- add begin --%>
    <script>
        function saveBtn(){
            var billingDate = $.trim($("#input1").val());
            var money = $.trim($("#input9").val());

            var invoiceNum = $.trim($("#input2").val());

            if(billingDate==null||billingDate==''){
                $("#addbillingdatespan").html("开票日期不能为空！");
                $("#addbillingdatespan").css("display","block");
            }else if(money==null||money==''){
                $("#addmoneyspan").html("发票金额不能为空！");
                $("#addmoneyspan").css("display","block");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/invoice/saveInvoiceNumSingle",
                    data:{invoiceNum:invoiceNum},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if(data=='1'){
                            $("#addinvoicenumspan").html("发票编号已经存在！");
                            $("#addinvoicenumspan").css("display","block");
                        }else{
                            $("#addIdCurrentPage").val($("#currentPageHidden").val());
                            $("#addIdpageSizes").val($("#pageSizeHidden").val());
                            $("#addIdSou").val($("#sousouinput").val());

                            $("#addForm").submit();
                        }
                    }
                });
            }
        }

        function addbillingdatefocus(){
            $("#addbillingdatespan").css("display","none");
        }

        function addmoneyfocus(){
            $("#addmoneyspan").css("display","none");
        }

        function addinvoicesnumfocus(){
            $("#addinvoicenumspan").css("display","none");
        }
    </script>
    <%-- add end --%>

    <%-- update begin --%>
    <script>
        function updateNum(id,num){
            $("#updateNumId").val(id);
            $("#input1101").val(num);
        }

        function xiugai(id,billingDate,invoiceNum,chargeDate,isCharge,remark,projectId,type,money){
            $("#updateId").val(id);
            $("#updateProjectId").val(projectId);

            $("#input101").val(billingDate);
            $("#input102").val(invoiceNum);
            $("#input103").val(chargeDate);
            $("#input108").val(remark);
            $("#input109").val(money);

            if(isCharge=='是'){
                $("#input106").html("");
                $("#input106").append("<option value='否'>否</option>");
                $("#input106").append("<option selected='selected' value='是'>是</option>");
            }else{
                $("#input106").html("");
                $("#input106").append("<option value='否'>否</option>");
                $("#input106").append("<option value='是'>是</option>");
            }

            if(type=='专用发票'){
                $("#input107").html("");
                $("#input107").append("<option value='普通发票'>普通发票</option>");
                $("#input107").append("<option selected='selected' value='专用发票'>专用发票</option>");
            }else{
                $("#input107").html("");
                $("#input107").append("<option value='普通发票'>普通发票</option>");
                $("#input107").append("<option value='专用发票'>专用发票</option>");
            }
        }
    </script>
    <%-- update begin --%>
</head>
<body>
<div class="container" style="width: 100%;max-width:95%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/invoice" method="post" style="font-size: 10pt;" class="form-horizontal"  role="form">

                    <div>
                        <button type="button" class="btn btn-success" data-target="#addModel" data-toggle="modal" style="">添加发票</button>
                        内容：<input type="text" id="sousouinput" name="sou" value="${sou}">
                        <button type="submit" class="btn btn-primary" style="">搜索</button>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>开票日期</th>
                            <th>发票编号</th>
                            <th>发票金额</th>
                            <th>到账日期</th>
                            <th>是否到账</th>
                            <th>发票类型</th>
                            <th>备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="invoices" items="${invoicesList}">
                            <tr>
                                <td>${invoices.billingDate}</td>
                                <td>${invoices.invoiceNum}</td>
                                <td>${invoices.money}</td>
                                <td>${invoices.chargeDate}</td>
                                <td>${invoices.isCharge}</td>
                                <td>${invoices.type}</td>
                                <td>${invoices.remark}</td>
                                <td>
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#updateModel" onclick="xiugai('${invoices.id}','${invoices.billingDate}','${invoices.invoiceNum}','${invoices.chargeDate}','${invoices.isCharge}','${invoices.remark}','${invoices.projectId}','${invoices.type}','${invoices.money}')">修改</button>
                                    <button type="button" class="btn btn-xs btn-danger" data-toggle="modal" onclick="delid(${invoices.id})" data-target="#delModel">删除</button>
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
                                <input type="hidden" id="deleteIdCurrentPage" name="currentPage" >
                                <input type="hidden" id="deleteIdpageSizes" name="pageSize" >
                                <input type="hidden" id="deleteIdSou" name="sou" >
                                <input type="hidden" name="projectId" value="${projectId}">
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
                                <form method="post" id="updateForm" action="${pageContext.request.contextPath}/invoice/update">
                                    <input type="hidden" id="updateId"  name="id" />
                                    <input type="hidden" id="updateProjectId"  name="projectId" />
                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <tr>
                                                <td><label for="input101" class="control-label">开票日期</label></td>
                                                <td style="width: 50%;"><div class="col-sm-10">
                                                    <input type="text" class="form-control" data-date-format="yyyy-mm-dd" readonly required id="input101" placeholder="开票日期" name="billingDate"  >
                                                </div></td>
                                                <td><label for="input102" class="control-label">发票编号</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input102" placeholder="发票编号" name="invoiceNum"  >
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input103" class=" control-label">到账日期</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input103" data-date-format="yyyy-mm-dd" readonly required placeholder="到账日期" name="chargeDate"   >
                                                </div></td>
                                                <td><label for="input106" class="control-label">是否到账</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="input106" class="form-control input-lg" name="isCharge" >
                                                    </select>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input107" class="control-label">发票类型</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="input107" class="form-control input-lg" name="type" >
                                                    </select>
                                                </div></td>
                                                <td><label for="input108" class="control-label">备注</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input108" placeholder="备注" name="remark"  />
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input109" class="control-label">发票金额</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input109" placeholder="发票金额" name="money" />
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




<div class="container">
    <%-- add begin --%>
    <div class="modal fade bs-example-modal-lg" id="addModel" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg" style="width: 100%;">
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="addModalLabel">添加发票</h4>
                </div>
                <div class="modal-body">
                    <form method="post" id="addForm" action="${pageContext.request.contextPath}/invoice/add">
                        <fieldset>
                            <input type="hidden"  name="projectId" value="${projectId}" />

                            <input type="hidden" id="addIdCurrentPage" name="currentPage" >
                            <input type="hidden" id="addIdpageSizes" name="pageSize" >
                            <input type="hidden" id="addIdSou" name="sou" >
                            <table style="width: 100%;height: 300px;">
                                <tr>
                                    <td><label for="input1" class="control-label">开票日期</label></td>
                                    <td style="width: 50%;"><div class="col-sm-10">
                                        <input type="text" class="form-control" id="input1" data-date-format="yyyy-mm-dd" readonly required placeholder="开票日期" name="billingDate" onfocus="addbillingdatefocus()" ><span id="addbillingdatespan" style="color: red;display: none;"></span>
                                    </div></td>
                                    <td><label for="input2" class="control-label">发票编号</label></td>
                                    <td><div class="col-sm-10">
                                        <input type="text" class="form-control" id="input2" placeholder="发票编号" name="invoiceNum"  onfocus="addinvoicesnumfocus()"><span id="addinvoicenumspan" style="color: red;display: none;"></span>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td><label for="input3" class=" control-label">到账日期</label></td>
                                    <td><div class="col-sm-10">
                                        <input type="text" class="form-control" id="input3" data-date-format="yyyy-mm-dd" readonly required placeholder="到账日期" name="chargeDate"  >
                                    </div></td>
                                    <td><label for="input6" class="control-label">是否到账</label></td>
                                    <td><div class="col-sm-10">
                                        <select id="input6" class="form-control input-lg" name="isCharge" >
                                            <option value="否">否</option>
                                            <option value="是">是</option>
                                        </select>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td><label for="input7" class="control-label">发票类型</label></td>
                                    <td><div class="col-sm-10">
                                        <select id="input7" class="form-control input-lg" name="type" >
                                            <option  value='普通发票'>普通发票</option>
                                            <option  value='专用发票'>专用发票</option>
                                        </select>
                                    </div></td>
                                    <td><label for="input8" class="control-label">备注</label></td>
                                    <td><div class="col-sm-10">
                                        <input type="text" class="form-control" id="input8" placeholder="备注" name="remark" />
                                    </div></td>
                                </tr>
                                <tr>
                                    <td><label for="input9" class="control-label">发票金额</label></td>
                                    <td><div class="col-sm-10">
                                        <input type="text" class="form-control" id="input9" placeholder="发票金额" name="money" onfocus="addmoneyfocus()" /><span id="addmoneyspan" style="color: red;display: none;"></span>
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
    $('#input3').datetimepicker({
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
    $('#input103').datetimepicker({
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
