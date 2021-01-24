<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户列表</title>
    <style>
        h3, tr > th, td {
            text-align: center;
        }
    </style>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h3 style="...">用户信息列表</h3>

    <div style="float: left">
        <form class="form-inline">
            <div class="form-group">
                <label for="name">姓名</label>
                <input type="text" class="form-control" id="name">
            </div>
            <div class="form-group">
                <label for="address">籍贯</label>
                <input type="text" class="form-control" id="address">
            </div>
            <div class="form-group">
                <label for="email">邮箱</label>
                <input type="email" class="form-control" id="email">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>
    </div>

    <div style="float: right;margin: 5px 10px">

        <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">添加联系人</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>
    </div>
    <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
        <table border="1" class="table table-borderhed table-hover">
            <tr class="success">
                <th><input type="checkbox" id="firstCb"></th>
                <th>编号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>籍贯</th>
                <th>qq</th>
                <th>邮箱</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${users}" var="user" varStatus="s">
                <tr>
                    <td><input type="checkbox" name="uid" value="${user.id}"></td>
                    <td>${s.count}</td>
                    <td>${user.name}</td>
                    <td>${user.gender}</td>
                    <td>${user.age}</td>
                    <td>${user.address}</td>
                    <td>${user.qq}</td>
                    <td>${user.email}</td>

                    <td><a class="btn btn-default btn-sm"
                           href="${pageContext.request.contextPath}/findUserServlet?id=${user.id}">修改</a>&nbsp;
                        <a class="btn btn-default btn-sm" href="javascript:deleteUser(${user.id})">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </form>

    <div>

        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <span style="font-size: 25px;margin-left: 5px">
                    共16条记录,共4页
                </span>
            </ul>
        </nav>
    </div>
</div>
<script>
    function deleteUser(id) {
        if (confirm("您确定要删除吗?")) {

            location.href = "${pageContext.request.contextPath}/deleteUserServlet?id=" + id;
        }
    }

    window.onload = function () {
        var delSelected = document.getElementById("delSelected");


        delSelected.onclick = function () {

            if (confirm("您确定要删除吗?")) {
                var flag = false;
                // 判断是否选择了
                var cds = document.getElementsByName("uid");
                for (var i = 0; i < cds.length; i++) {
                    if (cds[i].checked) {
                        flag = true;
                        break;
                    }
                }
                if (flag) {
                    document.getElementById("form").submit();
                }
            }

        }

        document.getElementById("firstCb").onclick = function () {

            // 根据name获取所有所有的CheckBox
            var cds = document.getElementsByName("uid");


            for (var i = 0; i < cds.length; i++) {
                cds[i].checked = this.checked;
            }
        }

    }
</script>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>