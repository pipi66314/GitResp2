<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>login</title>
    <style>

    </style>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container" style="width: 40%">
    <h3 style="text-align: center">登录</h3>
    <form action="${pageContext.request.contextPath}/loginServlet" method="post">
        <div class="form-group">
            <label for="username">用户名:</label>
            <input type="text" name="username" class="form-control" id="username" placeholder="请输入用户名"/>
        </div>

        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码"/>
        </div>

        <div class="form-inline">
            <label for="vcode">验证码:</label>
            <input type="text" name="verifycode" class="form-control" id="verifycode" placeholder="请输入验证码"/>
            <a href="javascript:refreshCode()">
                <img src="${pageContext.request.contextPath}/checkServlet" title="看不清" id="vcode">
            </a>
        </div>
        <hr>

        <div class="form-group">
            <input class="btn btn-primary" type="submit" value="登录"/>
        </div>

    </form>
    <%--${not empty login_msg}--%>
    <%--${login_msg}--%>
    <c:if test="${not empty login_msg}">

        <div class="alert alert-warning alert-dismissable" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span>×</span>
            </button>
            <strong>${login_msg}</strong>

        </div>
    </c:if>
</div>
<script>

    function refreshCode() {
        var img = document.getElementById("vcode");
        img.src = "${pageContext.request.contextPath}/checkServlet?" + new Date().getTime();
    }
</script>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>