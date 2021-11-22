<%--
  Created by IntelliJ IDEA.
  User: dyfive
  Date: 2021/10/8
  Time: 8:43 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>success</h2>
<c:if test="${user != null}">
    <h3>用户信息如下：</h3>
    用户编号：${user.id}
    <br>
    用户名：${user.username}
    <br>
    姓名：${user.name}
</c:if>

</body>
</html>
