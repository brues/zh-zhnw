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

    <%-- 发票信息跳转 begin --%>
    <script>
        function goxiangmurenyuan(id){
            $("#hiddenFormId").val(id);
            $("#hiddenForm").attr("action","${pageContext.request.contextPath}/invoice");
            $("#hiddenForm").submit();
        }
    </script>
    <%-- 发票信息跳转 end --%>

    <%-- sou project script begin--%>
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
    <%-- sou project script end--%>
</head>
<body>
<div class="container" style="width: 100%;max-width:95%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/invoice/project" method="post" style="font-size: 10pt;">
                    <div>
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
                                    <button type="button" class="btn btn-xs btn-success" onclick="goxiangmurenyuan(${project.id})" >增加发票</button>
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
                <form method="post" id="hiddenForm">
                    <input type="hidden" id="hiddenFormId" name="projectId" >
                </form>


            </div>
        </div>
    </div>
</div>


<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->

<script src="${pageContext.request.contextPath}/common/zhnw/content/purview/user/js/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
</body>
</html>
