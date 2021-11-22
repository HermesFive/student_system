<%--
  Created by IntelliJ IDEA.
  User: dyfive
  Date: 2021/10/25
  Time: 7:10 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>修改个人信息</title>

    <!-- Bootstrap core CSS -->
    <link href="../../static/css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="../../static/css/dashboard.css" rel="stylesheet">

</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            </button>
            <c:if test="${user != null}">
                <a class="navbar-brand" href="#">${user.username}的个人主页</a>
            </c:if>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">设置</a></li>
                <c:if test="${login}">
                    <li><a id="zx" href="/logout" >注销</a></li>
                </c:if>
                <c:if test="!${login}">
                    <li><a id="login" href="/login"  >登陆</a></li>
                </c:if>

            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar"  style="background-color: #f5f5f5">

        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">修改个人信息</h1>

            <div class="row placeholders">
                <form>
                    <div class="form-group"  class="col-md-6" style="float: left">
                        <c:if test="${user.type == '管理员'}">
                            <%--@declare id="exampleinputid"--%><label for="exampleInputId">工号</label>
                        </c:if>
                        <c:if test="${user.type == '学生'}">
                            <%--@declare id="exampleinputid"--%><label for="exampleInputId">学号</label>
                        </c:if>

                        <input style="width: 500px; margin: 0 auto;height: 40px" type="number" class="form-control" id="exampleInputId" value="${user.id}" readonly="readonly">
                    </div>
                    <div class="form-group" class="col-md-6" style="float: right">
                        <%--@declare id="exampleinputusername"--%><label for="exampleInputUsername">用户名</label>
                        <input style="width: 500px; margin: 0 auto;height: 40px" class="form-control" id="exampleInputUsername" value="${user.username}">
                    </div>
                    <div class="form-group" class="col-md-6" style="float: left">
                        <%--@declare id="exampleinputpassword"--%><label for="exampleInputPassword">密码</label>
                            <input style="width: 500px; margin: 0 auto;height: 40px" type="password" class="form-control" id="exampleInputPassword" placeholder="password" value="${user.password}">
                    </div>

                    <div class="form-group" class="col-md-6" style="float: right">
                        <%--@declare id="exampleinputname"--%><label for="exampleInputName">姓名</label>
                        <input style="width: 500px; margin: 0 auto;height: 40px" class="form-control" id="exampleInputName" value="${user.name}">
                    </div>
                    <div class="form-group" class="col-md-6" style="float: left">
                        <%--@declare id="exampleinputage"--%><label for="exampleInputAge">年龄</label>
                        <input style="width: 500px; margin: 0 auto;height: 40px" type="text" class="form-control" id="exampleInputAge" value="${user.age}">
                    </div>
                    <div class="form-group" class="col-md-6" style="float: right">
                        <%--@declare id="exampleinputsex"--%><label for="exampleInputSex">性别</label>
                        <input style="width: 500px; margin: 0 auto;height: 40px" type="text" class="form-control" id="exampleInputSex" value="${user.sex}">
                    </div>

                    <div class="form-group" class="col-md-6" style="float: left">
                        <%--@declare id="exampleinputtype"--%><label for="exampleInputType">权限</label>
                        <input style="width: 500px; margin: 0 auto;height: 40px" type="text" class="form-control" id="exampleInputType" value="${user.type}" readonly="readonly">
                    </div>
                    <div class="form-group" class="col-md-6" style="float: right">
                        <%--@declare id="exampleinputeamil"--%><label for="exampleInputEamil">邮箱</label>
                        <input style="width: 500px; margin: 0 auto;height: 40px" type="text" class="form-control" id="exampleInputEmail" value="${user.email}">
                    </div>
                    <div class="form-group" class="col-md-6" style="float: left">
                        <%--@declare id="exampleinputaddress"--%><label for="exampleInputAddress">地址</label>
                        <input style="width: 500px; margin: 0 auto;height: 40px" type="text" class="form-control" id="exampleInputAddress" value="${user.address}">
                    </div>

                    <div class="form-group" class="col-md-6" style="float: right">
                        <%--@declare id="exampleinputmajor"--%><label for="exampleInputMajor">院系</label>
                            <input style="width: 500px; margin: 0 auto;height: 40px" type="text" class="form-control" id="exampleInputMajor" value="${user.major}">
                    </div>
                </form>
                <div class="form-group" class="col-md-12" style="float: left">
                    <input type="submit" class="btn btn-default" onclick="change()" style=" width: 200px;"  value="提交"/>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<script src="../../static/js/bootstrap.min.js"></script>
<script>
    function change(){
        console.log("点击我了")
        var id = document.getElementById("exampleInputId").value;
        var username = document.getElementById("exampleInputUsername").value;
        var name = document.getElementById("exampleInputName").value;
        var age = document.getElementById("exampleInputAge").value;
        var sex = document.getElementById("exampleInputSex").value;
        var password = document.getElementById("exampleInputPassword").value;
        var  type = document.getElementById("exampleInputType").value;
        var email = document.getElementById("exampleInputEmail").value;
        var address = document.getElementById("exampleInputAddress").value;
        var major = document.getElementById("exampleInputMajor").value;

        console.log(id + " " + username + " " + major);

        $.ajax({
            url:"/user/change/" + id,
            type:"POST",
            dataType:"json",
            data:{userId:id,username:username,name:name,age:age,sex:sex,password:password,type:type,email:email,address:address,major:major},
            success (result){
                if (result.code == "1000"){
                    location.href = "/index/" + id;
                }else {
                    alert(result.msg);
                }
            }
        })
    }
</script>
</body>
</html>



