<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>权限管理</title>
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


    <script language="javascript" type="text/javascript">
        if (window.self == window.top) {
            window.top.location = "${pageContext.request.contextPath}";
        }
    </script>

    <%-- tree 样式 begin --%>
    <style>
        .tree {
            min-height:20px;
            padding:19px;
            margin-bottom:20px;
            background-color:#fbfbfb;
            border:1px solid #999;
            -webkit-border-radius:4px;
            -moz-border-radius:4px;
            border-radius:4px;
            -webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
            -moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
            box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05)
        }
        .tree li {
            list-style-type:none;
            margin:0;
            padding:10px 5px 0 5px;
            position:relative
        }
        .tree li::before, .tree li::after {
            content:'';
            left:-20px;
            position:absolute;
            right:auto
        }
        .tree li::before {
            border-left:1px solid #999;
            bottom:50px;
            height:100%;
            top:0;
            width:1px
        }
        .tree li::after {
            border-top:1px solid #999;
            height:20px;
            top:25px;
            width:25px
        }
        .tree li span {
            -moz-border-radius:5px;
            -webkit-border-radius:5px;
            border:1px solid #999;
            border-radius:5px;
            display:inline-block;
            padding:3px 8px;
            text-decoration:none
        }
        .tree li.parent_li>span {
            cursor:pointer
        }
        .tree>ul>li::before, .tree>ul>li::after {
            border:0
        }
        .tree li:last-child::before {
            height:30px
        }
        .tree li.parent_li>span:hover, .tree li.parent_li>span:hover+ul li span {
            background:#eee;
            border:1px solid #94a0b4;
            color:#000
        }
    </style>
    <%-- tree 样式 end --%>

    <%-- tree 展开闭合操作 begin --%>
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
    <%-- tree 展开闭合操作 end --%>

    <%-- 删除节点 begin --%>
    <script>
        function deleteById(id){
            $("#deleteIdFormId").val(id);
            $("#deletehiddenbutton").click();
        }

        function deleteSubmit(){
            $("#deleteIdForm").submit();
        }
    </script>
    <%-- 删除节点 end --%>

    <%-- 添加一级权限 begin --%>
    <script>
        function addOneBtn(){
            var purviewName= $.trim($("#input1").val());
            if(purviewName==null||purviewName==''){
                $("#addonepurviewnamespan").html("目录名不能为空！");
                $("#addonepurviewnamespan").css("display","block");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/purview/addOnePurviewNameSingleJson",
                    data:{purviewName:purviewName},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if(data=='1'){
                            $("#addonepurviewnamespan").html("目录名已存在！");
                            $("#addonepurviewnamespan").css("display","block");
                            $("#input1").val("")
                        }else{
                            $("#addOneForm").submit();
                        }
                    }
                });
            }
        }

        function addonenamefocus(){
            $("#addonepurviewnamespan").css("display","none");
        }
    </script>
    <%-- 添加一级权限 end --%>

    <%-- 添加二级权限 begin --%>
    <script>
        function addTwo(parentId){
            $("#addtwohiddenparentid").val(parentId);
            $("#addtwohiddenbutton").click();
        }

        function addTwoBtn(){
            var purviewName= $.trim($("#input101").val());
            var url= $.trim($("#input102").val());
            if(purviewName==null||purviewName==''){
                $("#addtwonamespan").html("目录名不能为空！");
                $("#addtwonamespan").css("display","block");
            }else if(url==null||url==''){
                $("#addtwourlspan").html("链接地址不能为空！");
                $("#addtwourlspan").css("display","block");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/purview/addTwoPurviewNameSingleJson",
                    data:{parentId:$("#addtwohiddenparentid").val(),purviewName:purviewName},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if(data=='1'){
                            $("#addtwonamespan").html("目录名已存在！");
                            $("#addtwonamespan").css("display","block");
                            $("#input101").val("")
                        }else{
                            $.ajax({
                                url:"${pageContext.request.contextPath}/purview/addTwoUrlSingleJson",
                                data:{parentId:$("#addtwohiddenparentid").val(),url:url},
                                dataType:"json",
                                type:"post",
                                success:function(data){
                                    if(data=='1'){
                                        $("#addtwourlspan").html("链接地址已存在！");
                                        $("#addtwourlspan").css("display","block");
                                        $("#input102").val("")
                                    }else{
                                        $("#addTwoForm").submit();
                                    }
                                }
                            });
                        }
                    }
                });
            }
        }

        function addtwonamefocus(){
            $("#addtwonamespan").css("display","none");
        }

        function addtwourlfocus(){
            $("#addtwourlspan").css("display","none");
        }
    </script>
    <%-- 添加二级权限 end --%>

    <%-- 更新一级权限 begin --%>
    <script>
        function updateOne(id,purviewName){
            $("#oneupdatehiddenid").val(id);
            $("#input1001").val(purviewName);
            $("#updateonehiddenbutton").click();
        }

        function updateOneBtn(){
            var purviewName= $.trim($("#input1001").val());
            if(purviewName==null||purviewName==''){
                $("#updateonenamespan").html("目录名不能为空！");
                $("#updateonenamespan").css("display","block");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/purview/updateOnePurviewNameSingleJson",
                    data:{id:$("#oneupdatehiddenid").val(),purviewName:purviewName},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if(data=='1'){
                            $("#updateonenamespan").html("目录名已存在！");
                            $("#updateonenamespan").css("display","block");
                            $("#input1001").val("")
                        }else{
                            $("#updateOneForm").submit();
                        }
                    }
                });
            }

        }

        function updateOneNameFocus(){
            $("#updateonenamespan").css("display","none");
        }
    </script>
    <%-- 更新一级权限 end --%>

    <%-- 更新二级权限 begin --%>
    <script>
        function updateTwo(id,purviewName,url){
            $("#twoupdatehiddenid").val(id);
            $("#input10001").val(purviewName);
            $("#input10002").val(url);
            $("#updatetwohiddenbutton").click();
        }

        function updateTwoBtn(){
            var purviewName= $.trim($("#input10001").val());
            var url= $.trim($("#input10002").val());
            if(purviewName==null||purviewName==''){
                $("#updatetwonamespan").html("目录名不能为空！");
                $("#updatetwonamespan").css("display","block");
            }else if(url==null||url==''){
                $("#updatetwourlspan").html("链接地址不能为空！");
                $("#updatetwourlspan").css("display","block");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/purview/updateTwoPurviewNameSingleJson",
                    data:{id:$("#twoupdatehiddenid").val(),purviewName:purviewName},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if(data=='1'){
                            $("#updatetwonamespan").html("目录名已存在！");
                            $("#updatetwonamespan").css("display","block");
                            $("#input10001").val("")
                        }else{
                            $.ajax({
                                url:"${pageContext.request.contextPath}/purview/updateTwoUrlSingleJson",
                                data:{id:$("#twoupdatehiddenid").val(),parentId:$("#addtwohiddenparentid").val(),url:url},
                                dataType:"json",
                                type:"post",
                                success:function(data){
                                    if(data=='1'){
                                        $("#updatetwourlspan").html("链接地址已存在！");
                                        $("#updatetwourlspan").css("display","block");
                                        $("#input10002").val("")
                                    }else{
                                        $("#updateTwoForm").submit();
                                    }
                                }
                            });
                        }
                    }
                });
            }
        }

        function updatetwonamefocus(){
            $("#updatetwonamespan").css("display","none");
        }

        function updatetwourlfocus(){
            $("#updatetwourlspan").css("display","none");
        }
    </script>
    <%-- 更新二级权限 end --%>
</head>
<body>
<div class="container" style="width: 100%;height: 100%;padding-top: 30px;">
    <%-- 权限展示列表 begin --%>
    <div class="tree well">
        <ul>
            <li>
                <span><i class="icon-folder-open"></i>  中韩内网 </span><a href="javascript:#addOneModel" ata-target="#addOneModel" data-toggle="modal"> 添加 </a>
                <ul>
                    <c:forEach var="purview" items="${purviewList}">
                        <li>
                            <span><i class="icon-minus-sign"></i> ${purview.purviewName}</span> <a href="javascript:addTwo(${purview.id})">添加 </a><a href="javascript:updateOne('${purview.id}','${purview.purviewName}')">编辑 </a><a href="javascript:deleteById(${purview.id})">删除</a>
                            <ul>
                                <c:forEach var="pur" items="${purviews}">
                                    <c:if test="${pur.parentId==purview.id}">
                                        <li>
                                            <span><i class="icon-leaf"></i> ${pur.purviewName}</span><a href="javascript:updateTwo('${pur.id}','${pur.purviewName}','${pur.url}')">编辑 </a><a href="javascript:deleteById(${pur.id})">删除</a>
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
    <%-- 权限展示列表 end --%>

    <%-- 添加一级目录 begin --%>
    <div class="modal fade bs-example-modal-lg" id="addOneModel" tabindex="-1" role="dialog" aria-labelledby="addOneModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg" style="width: 90%;">
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="addOneModalLabel">添加一级目录</h4>
                </div>
                <div class="modal-body">
                    <form method="post" id="addOneForm" action="${pageContext.request.contextPath}/purview/addOne">
                        <fieldset>
                            <table style="width: 100%;height: 300px;">
                                <tr>
                                    <td><label for="input1" class="control-label">目录名</label></td>
                                    <td><div class="col-sm-10">
                                        <input type="text" class="form-control" id="input1" placeholder="目录名" name="purviewName" onfocus="addonenamefocus()" required><span id="addonepurviewnamespan" style="color: red;display: none;"></span>
                                    </div></td>
                                    <td><label for="input2" class="control-label">连接地址</label></td>
                                    <td><div class="col-sm-10">
                                        <input type="text" class="form-control" id="input2" placeholder="连接地址" name="url" value="#"  readonly/>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><input type="button" onclick="addOneBtn()" class="btn btn-primary" style="height: 50px;width: 92%;" value="保存" /></td>
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
    <%-- 添加一级目录 end --%>


    <%-- 添加二级目录 begin --%>
    <input type="hidden" id="addtwohiddenbutton" data-toggle="modal" data-target="#addTwoModel"/>
    <div class="modal fade bs-example-modal-lg" id="addTwoModel" tabindex="-1" role="dialog" aria-labelledby="addTwoModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg" style="width: 90%;">
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="addTwoModalLabel">添加二级目录</h4>
                </div>
                <div class="modal-body">
                    <form method="post" id="addTwoForm" action="${pageContext.request.contextPath}/purview/addTwo">
                        <input type="hidden" name="parentId" id="addtwohiddenparentid" >
                        <fieldset>
                            <table style="width: 100%;height: 300px;">
                                <tr>
                                    <td><label for="input1" class="control-label">目录名</label></td>
                                    <td><div class="col-sm-10">
                                        <input type="text" class="form-control" id="input101" placeholder="目录名" name="purviewName" onfocus="addtwonamefocus()" ><span id="addtwonamespan" style="color: red;display: none;"></span>
                                    </div></td>
                                    <td><label for="input2" class="control-label">连接地址</label></td>
                                    <td><div class="col-sm-10">
                                        <input type="text" class="form-control" id="input102" placeholder="连接地址" name="url" onfocus="addtwourlfocus()"  /><span id="addtwourlspan" style="color: red;display: none;"></span>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><input type="button" onclick="addTwoBtn()" class="btn btn-primary" style="height: 50px;width: 92%;" value="保存" /></td>
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
    <%-- 添加二级目录 end --%>


    <%-- delete begin --%>
    <input type="hidden" id="deletehiddenbutton" data-toggle="modal" data-target="#delModel"/>
    <div class="modal fade" id="delModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">提示框</h4>
                </div>
                <div class="modal-body">
                    您确定要删除此功能以及所有子功能吗？
                </div>
                <input id="deleteIdInput" type="hidden">
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="deleteSubmit()">确定</button>
                </div>
                <form style="display: none;" id="deleteIdForm" method="post" action="${pageContext.request.contextPath}/purview/delete">
                    <input type="hidden" id="deleteIdFormId" name="id">
                </form>
            </div>
        </div>
    </div>
    <%-- delete end --%>

    <%-- 更新一级目录 begin --%>
    <input type="hidden" id="updateonehiddenbutton" data-toggle="modal" data-target="#updateOneModel"/>
    <div class="modal fade bs-example-modal-lg" id="updateOneModel" tabindex="-1" role="dialog" aria-labelledby="updateOneModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg" style="width: 90%;">
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="updateOneModalLabel">更新一级目录</h4>
                </div>
                <div class="modal-body">
                    <form method="post" id="updateOneForm" action="${pageContext.request.contextPath}/purview/updateOne">
                        <input type="hidden" name="id" id="oneupdatehiddenid">
                        <fieldset>
                            <table style="width: 100%;height: 300px;">
                                <tr>
                                    <td><label for="input1" class="control-label">目录名</label></td>
                                    <td><div class="col-sm-10">
                                        <input type="text" class="form-control" id="input1001" placeholder="目录名" name="purviewName" onfocus="updateOneNameFocus()" required><span id="updateonenamespan" style="color: red;display: none;"></span>
                                    </div></td>
                                    <td><label for="input2" class="control-label">连接地址</label></td>
                                    <td><div class="col-sm-10">
                                        <input type="text" class="form-control" id="input1002" placeholder="连接地址" name="url" value="#"  readonly/>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><input type="button" onclick="updateOneBtn()" class="btn btn-primary" style="height: 50px;width: 92%;" value="保存" /></td>
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
    <%-- 更新一级目录 end --%>

    <%-- 更新二级目录 begin --%>
    <input type="hidden" id="updatetwohiddenbutton" data-toggle="modal" data-target="#updateTwoModel"/>
    <div class="modal fade bs-example-modal-lg" id="updateTwoModel" tabindex="-1" role="dialog" aria-labelledby="updateTwoModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg" style="width: 90%;">
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="updateTwoModalLabel">更新二级目录</h4>
                </div>
                <div class="modal-body">
                    <form method="post" id="updateTwoForm" action="${pageContext.request.contextPath}/purview/updateTwo">
                        <input type="hidden" name="id" id="twoupdatehiddenid">
                        <fieldset>
                            <table style="width: 100%;height: 300px;">
                                <tr>
                                    <td><label for="input1" class="control-label">目录名</label></td>
                                    <td><div class="col-sm-10">
                                        <input type="text" class="form-control" id="input10001" placeholder="目录名" name="purviewName" onfocus="updatetwonamefocus()"   required><span id="updatetwonamespan" style="color: red;display: none;"></span>
                                    </div></td>
                                    <td><label for="input2" class="control-label">连接地址</label></td>
                                    <td><div class="col-sm-10">
                                        <input type="text" class="form-control" id="input10002" placeholder="连接地址" name="url" onfocus="updatetwourlfocus()" required/><span id="updatetwourlspan" style="color: red;display: none;"></span>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><input type="button" onclick="updateTwoBtn()" class="btn btn-primary" style="height: 50px;width: 92%;" value="保存" /></td>
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
    <%-- 更新二级目录 end --%>
</div>
</body>
</html>
