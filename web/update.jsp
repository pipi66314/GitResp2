<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>修改</title>
    <style>

    </style>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container" style="width: 40%">
    <h3 style="text-align: center">添加</h3>
    <form action="${pageContext.request.contextPath}/updateUserServlet" method="post">
        <div class="form-group">
            <label for="name">用户名:</label>
            <input type="text" name="name" id="name" class="form-control" value="${user.name}"/>
        </div>

        <div class="form-group">
            <label>性别:</label>
            <c:if test="${user.gender == '男'}">
                <input type="radio" name="gender" value="男" checked/>男
                <input type="radio" name="gender" value="女"/>女
            </c:if>
            <c:if test="${user.gender == '女'}">
                <input type="radio" name="gender" value="男"/>男
                <input type="radio" name="gender" value="女" checked/>女
            </c:if>
        </div>

        <div class="form-group">
            <label for="age">年龄:</label>
            <input type="text" name="age" class="form-control" id="age" value="${user.age}"/>
        </div>

        <div class="form-group">
            <label for="address">籍贯:</label>
            <select name="address" class="form-control" id="address">
                <c:if test="${user.address == '北京'}">
                    <option value="北京" selected>北京</option>
                    <option value="上海">上海</option>
                    <option value="深圳">深圳</option>
                </c:if>
                <c:if test="${user.address == '上海'}">
                    <option value="北京" >北京</option>
                    <option value="上海" selected>上海</option>
                    <option value="深圳">深圳</option>
                </c:if>
                <c:if test="${user.address == '深圳'}">
                    <option value="北京" >北京</option>
                    <option value="上海">上海</option>
                    <option value="深圳" selected>深圳</option>
                </c:if>
            </select>
        </div>

        <div class="form-group">
            <label for="qq">qq:</label>
            <input type="text" name="qq" id="qq" class="form-control" value="${user.qq}"/>
        </div>

        <div class="form-group">
            <label for="email">邮箱:</label>
            <input type="email" name="email" id="email" class="form-control" value="${user.email}"/>
        </div>

        <input type="hidden"  name="id" value="${user.id}">

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