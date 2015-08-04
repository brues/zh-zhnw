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


    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/zhnw/content/purview/actor/css/style.css">

    <script language="javascript" type="text/javascript">
        if (window.self == window.top) {
            window.top.location = "${pageContext.request.contextPath}";
        }
    </script>

    <%-- 树的展开闭合操作 begin --%>
    <script>
        $(function () {
            $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
            $('.tree li.parent_li > span').on('click', function (e) {
                var children = $(this).parent('li.parent_li').find(' > ul > li');
                if (children.is(":visible")) {
                    children.hide('fast');
                    $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
                } else {
                    children.show('fast');
                    $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
                }
                e.stopPropagation();
            });
        });
    </script>
    <%-- 树的展开闭合操作 end --%>

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

    <%-- add begin --%>
    <script>
        function addBtn(){
            var actorName = $.trim($("#input1").val());
            if(actorName==null||actorName==''){
                $("#addquchongfuspan").html("角色名不能为空！");
                $("#addquchongfuspan").css("display","block");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/actor/addActorNameSingle",
                    data:{actorName:actorName},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if(data=="1"){
                            $("#addquchongfuspan").html("角色名已存在！");
                            $("#addquchongfuspan").css("display","block");
                        }else{
                            $("#addCurrentPage").val($("#currentPageHidden").val());
                            $("#addpageSizes").val($("#pageSizeHidden").val());
                            $("#addForm").submit();
                        }
                    }
                });
            }
        }

        function addActorNameFocus(){
            $("#addquchongfuspan").css("display","none");
        }
    </script>
    <%-- add end --%>

    <%-- update begin --%>
    <script>
        function xiugai(id,actorName){
            $("#updateId").val(id);
            $("#input101").val(actorName);
        }

        function updateBtn(){
            var id = $.trim($("#updateId").val());
            var actorName = $.trim($("#input101").val());
            if(actorName==null||actorName==''){
                $("#udpatequchongfuupdatespan").html("角色名不能为空！");
                $("#udpatequchongfuupdatespan").css("display","block");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/actor/updateActorNameSingle",
                    data:{id:id,actorName:actorName},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if(data=="1"){
                            $("#udpatequchongfuupdatespan").html("角色名已存在！");
                            $("#udpatequchongfuupdatespan").css("display","block");
                            $("#input1").val("");
                        }else{
                            $("#updateCurrentPage").val($("#currentPageHidden").val());
                            $("#updatepageSizes").val($("#pageSizeHidden").val());
                            $("#updateForm").submit();
                        }
                    }
                });
            }
        }

        function updateActorNameFocus(){
            $("#udpatequchongfuupdatespan").css("display","none");
        }
    </script>
    <%-- update end --%>

    <%-- delete begin --%>
    <script>
        function delid(id){
            $("#deleteIdInput").val(id);
        }
        function deleteById(){
            $("#deleteIdCurrentPage").val($("#currentPageHidden").val());
            $("#deleteIdpageSizes").val($("#pageSizeHidden").val());

            $("#deleteIdFormId").val($("#deleteIdInput").val());
            $("#deleteIdForm").attr("action","${pageContext.request.contextPath}/actor/delete");
            $("#deleteIdForm").submit();
        }

    </script>
    <%-- delete end --%>

    <%-- 树的选择取消操作 begin --%>
    <script>
        function chushihuaselect(id){
            $("#actorIdHidden").val(id);
            $(":checkbox").attr("checked",null);

            $("#purviewIdCurrentPage").val($("#currentPageHidden").val());
            $("#purviewIdpageSizes").val($("#pageSizeHidden").val());
        }


        /*根目录权限点击*/
        function checkclick(){
            if($("#check").attr("checked")==null){
                var cheone = $(".check_one");
                var tempone = 0;
                for(i=0;i<cheone.length;i++){
                    if(cheone[i].checked) tempone++;
                }
                if(tempone==0){
                    $(":checkbox").attr("checked",null);
                }else if(tempone==cheone.length){
                    $(":checkbox").attr("checked",null);
                }else{
                    $(":checkbox").attr("checked","checked");
                }
            }else if($("#check").attr("checked")=="checked"){
                $(":checkbox").attr("checked","checked");
            }
        }

        /*第一级权限点击*/
        function checkoneclick(id){
            if($("#check_"+id).attr("checked")==null){

                var chetwo = $(".check_two_"+id);
                var temptwo = 0;
                for(i=0;i<chetwo.length;i++){
                    if(chetwo[i].checked) temptwo++;
                }

                var cheone = $(".check_one");
                var tempone = 0;
                for(i=0;i<cheone.length;i++){
                    if(cheone[i].checked) tempone++;
                }

                if(temptwo==0){
                    $("#check_"+id).attr("checked",null)
                    $(".check_two_"+id).attr("checked",null);
                    if(tempone==0){
                        $("#check").attr("checked",null);
                    }else if(tempone==cheone.length){
                        $("#check").attr("checked",null);
                    }else{
                        $("#check").attr("checked","checked");
                    }
                }else if(temptwo==chetwo.length){
                    $("#check_"+id).attr("checked",null)
                    $(".check_two_"+id).attr("checked",null);
                    if(tempone==0){
                        $("#check").attr("checked",null);
                    }else if(tempone==cheone.length){
                        $("#check").attr("checked",null);
                    }else{
                        $("#check").attr("checked","checked");
                    }
                }else{
                    $("#check").attr("checked","checked");
                    $("#check_"+id).attr("checked","checked")
                    $(".check_two_"+id).attr("checked","checked");
                }
            }else if($("#check_"+id).attr("checked")=="checked"){
                $("#check").attr("checked","checked");
                $(".check_two_"+id).attr("checked","checked");
            }
        }

        /*第二级权限点击*/
        function checktwoclick(parentId,id){
            if($("#check_"+parentId+"_"+id).attr("checked")==null){
                var che = $(".check_two_"+parentId);
                var temp = 0;
                for(i=0;i<che.length;i++){
                    if(che[i].checked) temp = 1;
                }
                if(temp==0){
                    $("#check_"+parentId).attr("checked",null);
                }

                var cheone = $(".check_one");
                var tempone = 0;
                for(i=0;i<cheone.length;i++){
                    if(cheone[i].checked) tempone = 1;
                }
                if(tempone==0){
                    $("#check").attr("checked",null);
                }

            }else if($("#check_"+parentId+"_"+id).attr("checked")=="checked"){
                $("#check_"+parentId).attr("checked","checked");
                $("#check").attr("checked","checked");
            }
        }
    </script>
    <%-- 树的选择取消操作 end --%>
</head>
<body>
<div class="container" style="width: 100%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/actor" method="post">
                    <div>
                        <button type="button" class="btn btn-success" data-target="#addModel" data-toggle="modal">添加角色</button>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>
                                角色名
                            </th>
                            <th>
                                操作
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="actor" items="${actorList}">
                            <tr>
                                <td>${actor.actorName}</td>
                                <td>
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#updateModel" onclick="xiugai('${actor.id}','${actor.actorName}','${actor.trueName}','${actor.email}','${actor.phone}','${actor.remark}')">修改</button>
                                    <button type="button" class="btn btn-xs btn-success" data-target="#actorModel" data-toggle="modal" onclick="chushihuaselect('${actor.id}')">分配权限</button>
                                    <button type="button" class="btn btn-xs btn-danger" data-toggle="modal" onclick="delid(${actor.id})" data-target="#delModel">删除</button>
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
                <div class="modal fade" id="delModel" tabindex="-1" role="dialog" aria-labelledby="delModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="delModalLabel">提示框</h4>
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

                                <input type="hidden" id="deleteIdCurrentPage" name="currentPage">
                                <input type="hidden" id="deleteIdpageSizes" name="pageSize" >
                            </form>
                        </div>
                    </div>
                </div>
                <%-- delete end --%>

                <%-- add begin --%>
                <div class="modal fade bs-example-modal-lg" id="addModel" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="addModalLabel">添加角色</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="addForm" action="${pageContext.request.contextPath}/actor/add">

                                    <input type="hidden" id="addCurrentPage" name="currentPage" >
                                    <input type="hidden" id="addpageSizes" name="pageSize" >

                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <tr>
                                                <td><label for="input1" class="control-label">角色名：</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input1" placeholder="角色名" name="actorName" onfocus="addActorNameFocus()"  required><span id="addquchongfuspan" style="color: red;display: none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><input type="button" onclick="addBtn()" id="actoraddsubmit" class="btn btn-primary" style="height: 50px;width: 86%;" value="保存" /></td>
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
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="updateModalLabel">修改角色</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="updateForm" action="${pageContext.request.contextPath}/actor/update">
                                    <input type="hidden" id="updateCurrentPage" name="currentPage">
                                    <input type="hidden" id="updatepageSizes" name="pageSize">

                                    <input type="hidden" id="updateId"  name="id" />
                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <tr>
                                                <td><label for="input101" class="control-label">角色名：</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input101" placeholder="角色名" name="actorName" onfocus="updateActorNameFocus()" ><span id="udpatequchongfuupdatespan" style="color: red;display: none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><input type="button" onclick="updateBtn()" class="btn btn-primary" style="height: 50px;width: 86%;" value="保存" /></td>
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

                <%-- purview begin --%>
                <div class="modal fade bs-example-modal-lg" id="actorModel" tabindex="-1" role="dialog" aria-labelledby="actorModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-lg" style="width: 90%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="actorModalLabel">分配权限</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="actorPurviewForm" action="${pageContext.request.contextPath}/actor/actorPurview">
                                    <input type="hidden" id="purviewIdCurrentPage" name="currentPage">
                                    <input type="hidden" id="purviewIdpageSizes" name="pageSize" >

                                    <input type="hidden" id="actorIdHidden" name="actorId" >

                                    <div class="tree well">
                                        <ul>
                                            <li>
                                                <input type="checkbox" id="check" onclick="checkclick()">&nbsp;&nbsp;<span><i class="icon-folder-open"></i> 中翰内网</span>
                                                <ul>
                                                    <c:forEach var="purview" items="${purviewList}">
                                                        <li>
                                                            <input type="checkbox" value="${purview.id}" name="ids" id="check_${purview.id}" onclick="checkoneclick(${purview.id})" class="check_one" >&nbsp;&nbsp;<span><i class="icon-minus-sign"> </i> ${purview.purviewName}</span>
                                                            <ul>
                                                                <c:forEach var="pur" items="${purviews}">
                                                                    <c:if test="${pur.parentId==purview.id}">
                                                                        <li>
                                                                            <input name="ids" type="checkbox" value="${pur.id}" id="check_${purview.id}_${pur.id}" class="check_two_${purview.id}" onclick="checktwoclick(${purview.id},${pur.id})">&nbsp;&nbsp;<span><i class="icon-leaf"></i> ${pur.purviewName}</span>
                                                                        </li>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </ul>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <button type="submit" class="btn btn-primary">确定</button>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- purview end --%>
            </div>
        </div>
    </div>
</div>
</body>
</html>
