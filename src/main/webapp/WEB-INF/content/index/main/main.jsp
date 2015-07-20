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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/zhnw/content/index/main/css/main.css">

    <script>
        function iframes(url){
            $("#iframeId").attr("src",url);
        }
    </script>


</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" style="width: 100%;">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="javascript:void(0)">中翰内网</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="javascript:void(0)" onclick="iframes('${pageContext.request.contextPath}/user/change')">修改密码</a></li>
                <li><a href="javascript:void(0)">用户：${zhnw_loginUser.userName}</a></li>
                <li><a href="${pageContext.request.contextPath}/quit">退出</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid" style="height: 100%;width: 100%;">
    <div class="row" style="height: 100%;width: 100%;">
        <div class="col-sm-3 col-md-2 sidebar" style="padding: 0;width: 16%;max-width: 16%;">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="text-align: center;width: 100%;">
                <%--开始--%>
                <c:forEach var="purview" items="${purviewList}">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="heading_${purview.id}">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse_${purview.id}" aria-expanded="false" class="collapsed" aria-controls="collapse_${purview.id}">
                                    ${purview.purviewName}
                                </a>
                            </h4>
                        </div>
                        <div id="collapse_${purview.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_${purview.id}">
                            <c:forEach var="pur" items="${purviews}">
                                <c:if test="${pur.parentId==purview.id}">
                                    <div class="panel-body">
                                        <a href="javascript:void(0)" onclick="iframes('${pageContext.request.contextPath}${pur.url}')">${pur.purviewName}</a>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
                <%--结束--%>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="padding: 0;height: 100%;width: 84%;max-width:84%;border: 0;">
            <iframe id="iframeId" src="${pageContext.request.contextPath}/welcome" style="width: 100%;height: 100%;border: 0;padding: 0px;"></iframe>
        </div>
    </div>
</div>
</body>
</html>
