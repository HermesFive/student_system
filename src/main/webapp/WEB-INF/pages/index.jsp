<%--
  Created by IntelliJ IDEA.
  User: dyfive
  Date: 2021/10/14
  Time: 4:42 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登陆</title>
    <!-- 引入css -->
    <link rel="stylesheet" type="text/css" href="../../static/css/auto.css">
    <link rel="stylesheet" type="text/css" href="../../static/css/login.css">
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
</head>
<body>
<h3>index</h3>

<c:if test="${user != null}">
    <h3>用户信息如下：</h3>
    用户编号：${user.id}
    <br>
    用户名：${user.username}
    <br>
    姓名：${user.name}
    <br>
    权限：${user.type}
    <br>
    邮箱：${user.email}
</c:if>
</body>
</html>
