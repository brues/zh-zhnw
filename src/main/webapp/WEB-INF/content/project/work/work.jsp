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

    <%-- 评价 begin --%>
    <script>
        function xiugai(id,assess,reviewId){
            $("#updateId").val(id);
            $("#input14").val(assess);
            $("#updatereviewId").val(reviewId);
        }

        function updatework(){

            $("#updateIdCurrentPage").val($("#currentPageHidden").val());
            $("#updateIdpageSizes").val($("#pageSizeHidden").val());
            $("#updateNameId").val($("#selectNameSou").val());
            $("#updateThing").val($("#selectThingSou").val());
            $("#updateForecast").val($("#selectForecastSou").val());
            $("#updateIsend").val($("#selectIsEndSou").val());

            var assess = $.trim($("#input14").val());

            if(assess==null||assess==''){
                $("#updateworkspan").html("工作评价不能为空！");
                $("#updateworkspan").css("display","block");
            }else{
                $("#updateForm").submit();
            }
        }

        function updateworkfocus(){
            $("#updateworkspan").css("display","none");
        }
    </script>
    <%-- 评价 end --%>


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


</head>
<body>
<div class="container" style="width: 100%;max-width:95%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/project/work" method="post">
                    <div>
                        <input type="hidden" id="inputNameSou" value="${nameId}">
                        <input type="hidden" id="inputThingSou" value="${thing}">
                        <input type="hidden" id="inputForecastSou" value="${forecast}">

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
                            <th>评价</th>
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
                                <td>${work.assess}</td>
                                <td>
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#updateModel" onclick="xiugai('${work.id}','${work.assess}','${work.reviewId}')">评价</button>
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



                <%-- update begin --%>
                <div class="modal fade bs-example-modal-lg" id="updateModel" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-lg" style="width: 90%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="updateModalLabel">评价</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="updateForm" action="${pageContext.request.contextPath}/project/work/update">
                                    <input type="hidden" id="updateId"  name="id" />
                                    <fieldset>


                                        <input type="hidden" id="updateIdCurrentPage" name="currentPage" >
                                        <input type="hidden" id="updateIdpageSizes" name="pageSize" >
                                        <input type="hidden" id="updateNameId" name="updatenameId" >
                                        <input type="hidden" id="updateThing" name="updatething" >
                                        <input type="hidden" id="updateForecast" name="updateforecast" >
                                        <input type="hidden" id="updateIsend" name="updateisend" >


                                        <input type="hidden" id="updatereviewId" name="reviewId" >



                                        <table style="width: 100%;height:350px;">
                                            <tr>
                                                <td><label for="input14" class="control-label">评价</label></td>
                                                <td colspan="3" style=""><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input14" placeholder="评价" name="assess" onfocus="updateworkfocus()" ><span id="updateworkspan" style="color:red;display: none;"></span>
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
<script type="text/javascript">



</script>
</body>
</html>
