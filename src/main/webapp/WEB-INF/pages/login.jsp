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
<body class="login">
<div class="login_header">
    <div class="logo">
        <img src="../../static/images/logo.png" alt="logo">
    </div>
    <a href="" class="help">帮助</a>
</div>
<div class="login_body">
    <div class="loginTitle">
        <b>账户登录</b>
    </div>
    <div class="loginContent">
        <div id="tip">
            <br>
            <h3 style="padding-left: 30px;">用户登录</h3>
        </div>
        <div class="textitem1">
            <input type="text" name="username" id="username" placeholder="用户名" style="width: 320px;height: 30px; background-color: #f3f3f3; height: 100%;">
        </div>
        <div class="textitem2">
            <input type="password" name="password" id="password" placeholder="密码" style="width: 320px;height: 30px; background-color: #f3f3f3; height: 100%; ">
        </div>
        <div class="textitem3" style="position: absolute; left: 30px; top: 180px; width: 320px;">
            <select name="type" id="select">
                <option value="">请选择用户类型</option>
                <option value="管理员">管理员</option>
                <option value="老师">老师</option>
                <option value="学生">学生</option>
            </select>
        </div>
        <div class="loginButton" style="position: absolute; left: 30px; top: 220px; width: 320px;">
            <input type="submit" id="loginBtn" class="btn" value="登录" style="float: right; background: url(../../static/images/login_btn.jpg);" onclick="fnLogin()">
        </div>
        <div class="reg" style="position: absolute;top: 230px;left: 30px;">
            <a href="/register" style="font-size: 14px;">还没有账号，去注册</a>
        </div>
    </div>
</div>
<div class="login_footer">
    @dyfive
</div>

<script>
    function fnLogin(){
        var username = document.getElementById("username");
        var password = document.getElementById("password");
        var type = document.getElementById("select");
        var tip = document.getElementById("tip");
        console.log(username.value + " " + type.value);


        if (username.value.length ==0 || password.value.length == 0){
            tip.innerHTML = '请输入用户名和密码';
        }else {
            $.ajax({
                url: "/login",
                type: "POST",
                dataType: "json",
                data: {username: username.value, password: password.value, type: type.value},
                success: function (data) {
                    if(data.code == "1000"){
                        location.href = "index/" + data.id;
                    }else {
                        alert(data.msg);
                    }
                }
            })
        }

    }
</script>
</body>
</html>
