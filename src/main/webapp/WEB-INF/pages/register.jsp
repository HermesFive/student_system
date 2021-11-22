<%--
  Created by IntelliJ IDEA.
  User: dyfive
  Date: 2021/10/20
  Time: 4:58 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <!-- 引入css -->
    <link rel="stylesheet" type="text/css" href="../../static/css/auto.css">
    <link rel="stylesheet" type="text/css" href="../../static/css/register.css">
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
</head>
<body class="register">
<div class="register_header">
    <div class="logo">
        <img src="../../static/images/logo.png" alt="logo">
    </div>
    <a href="" class="help">帮助</a>
</div>

<div class="register_body">
    <div class="registerTitle">
        <b>账户注册</b>
    </div>

    <div class="registerContent">
        <div id="tip">
            <br>
            <h3 style="padding-left: 30px;">用户注册</h3>
        </div>
        <form action="register">
            <div class="textitem1">
                <input type="text" name="username" id="username" placeholder="用户名" style="width: 160px;height: 30px; background-color: #f3f3f3; height: 100%;">
            </div>
            <div class="textitem11">
                <input type="text" name="email" id="email" placeholder="邮箱" style="width: 160px;height: 30px; background-color: #f3f3f3; height: 100%;">
            </div>
            <div class="textitem2">
                <input type="password" name="password" id="password" placeholder="密码" style="width: 160px;height: 30px; background-color: #f3f3f3; height: 100%; ">
            </div>
            <div class="textitem21">
                <input type="password" name="password" id="password2" placeholder="确认密码" style="width: 160px;height: 30px; background-color: #f3f3f3; height: 100%; ">
            </div>
            <div class="textitem3" style="position: absolute; left: 30px; top: 180px; width: 320px;">
                <select name="type" id="select">
                    <option value="">请选择用户类型</option>
                    <option value="学生">学生</option>
                </select>
            </div>
            <div class="loginButton" style="position: absolute; left: 30px; top: 240px; width: 320px;">
                <input type="button" class="btn" value="注册" style="float: right;" onclick="btnRegister()">
            </div>
        </form>
    </div>

</div>
<div class="register_footer">
    @dyfive
</div>

<script>
    function btnRegister() {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var password2 = document.getElementById("password2").value;
        var tip = document.getElementById("tip");
        var email = document.getElementById("email").value;
        var pattern = /^[a-zA-Z]\w+[@]\w+[.][\w.]+$/;//
        var type = "学生";

        console.log(username + " " + password + " " + email + " " + type);
        if (username.length ==0 || password.length == 0){
            tip.innerHTML = '请输入用户名和密码';
        }else if(password !== password2){
            tip.innerHTML = '两次输入密码不一致'
        }else if(!pattern.test(email)){
            tip.innerHTML = '请输入正确的邮箱'
        }else{
            $.ajax({
                url:"/register",
                type:"POST",
                dataType:"json",
                data:{username:username,password:password,email:email,type:type},
                success: function (data) {
                    if(data.code == "1000"){
                        alert(data.res)
                        setTimeout(function(){
                            location.href = "login";
                        },1000);
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
