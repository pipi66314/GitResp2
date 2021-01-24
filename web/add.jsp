<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加</title>
    <style>

    </style>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container" style="width: 40%">
    <h3 style="text-align: center">添加</h3>
    <form action="${pageContext.request.contextPath}/addUserServlet" method="post">
        <div class="form-group">
            <label for="name">用户名:</label>
            <input type="text" name="name" class="form-control" id="name" placeholder="请输入用户名"/>
        </div>

        <div class="form-group">
            <label>性别:</label>
            <input type="radio" name="gender" value="男" checked/>男
            <input type="radio" name="gender" value="女"/>女
        </div>

        <div class="form-group">
            <label for="age">年龄:</label>
            <input type="text" name="age" class="form-control" id="age" placeholder="请输入年龄"/>
        </div>

        <div class="form-group">
            <label for="address">籍贯:</label>
            <select name="address" class="form-control" id="address">
                <option value="北京">北京</option>
                <option value="上海">上海</option>
                <option value="深圳">深圳</option>
            </select>
        </div>

        <div class="form-group">
            <label for="qq">qq:</label>
            <input type="text" name="qq" id="qq" class="form-control"  placeholder="请输入qq"/>
        </div>

        <div class="form-group">
            <label for="email">邮箱:</label>
            <input type="email" name="email" id="email" class="form-control"  placeholder="请输入邮箱"/>
        </div>


        <%--<div class="form-inline">--%>
            <%--<label for="vcode">验证码:</label>--%>
            <%--<input type="text" name="verifycode" class="form-control" id="verifycode" placeholder="请输入验证码"/>--%>
            <%--<a href="javascript:refreshCode()">--%>
                <%--<img src="${pageContext.request.contextPath}/checkServlet" title="看不清" id="vcode">--%>
            <%--</a>--%>
        <%--</div>--%>
              <div class="form-group">
                  <input class="btn btn-primary" type="submit" value="提交">
                  <input class="btn btn-default" type="reset" value="重置">
                  <input class="btn btn-default" type="button" value="返回">
              </div>

    </form>



<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>