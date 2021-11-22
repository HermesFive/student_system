<%--
  Created by IntelliJ IDEA.
  User: dyfive
  Date: 2021/10/27
  Time: 10:36 上午
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

    <title>学生管理</title>

    <!-- Bootstrap core CSS -->
    <link href="../../static/css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="../../static/css/dashboard.css" rel="stylesheet">
    <link rel="stylesheet" href="../../static/css/pagination.css">

</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            </button>
            <c:if test="${user != null}">
                <a class="navbar-brand" href="/index/${user.id}">${user.username}的个人主页</a>
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
            <ul class="nav nav-sidebar">
                <c:forEach items="${operates}" var="keyword" varStatus="id">
                    <li>
                        <a href="/manage/${keyword.value}">${keyword.key}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">、
            <h1 class="page-header" >查询条件</h1>

            <div class="row placeholders">
                <div class="jumbotron">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon" >姓名：</span>
                                <input type="text" class="form-control" placeholder="Search for..." id="name">
                            </div>
                        </div>
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon" >年龄：</span>
                                <input type="number" class="form-control"placeholder="Search for..." id="age">
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon">学号：</span>
                                <input type="number" class="form-control"placeholder="Search for..." id="num">
                            </div>
                        </div>
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon" >专业：</span>
                                <input type="text" class="form-control"placeholder="Search for..." id="major">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <button type="button" class="btn btn-primary" id="btn" onclick="search()">查询</button>
                        </div>
                    </div>
                </div>
            </div>

            <c:if test="${users !=null }">
                <div class="row">
                    <div class="col-md-11">
                        <span class="sub-header" style="font-weight: 300;font-size: 30px;">学生列表</span>
                    </div>
                    <div class="col-md-1">
                        <a href="#addform" class="btn btn-primary" id="add" onclick="add()" data-toggle="collapse">添加学生</a>
                    </div>
                </div>
                <br>
                <br>
                <div class="row">
                    <div id="addform" class="collapse">
                        <div class="row">
                            <div class="col-md-6">
                                <span>姓名：</span>
                                <input type="text" class="form-control" id="addName">
                            </div>
                            <div class="col-md-6">
                                <span>学号：</span>
                                <input type="number" class="form-control" id="addNumber">
                            </div>
                        </div>

                        <br>
                        <br>
                        <div class="row">
                            <div class="col-md-6">
                                <span >院系：</span>
                                <select name="type" id="addMajor" class="form-control">
                                    <option value="">请选择</option>
                                    <c:forEach items="${depts}" var="dept">
                                        <option value="${dept}">${dept}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <span>年龄:</span>
                                <input type="number" class="form-control" id="addAge">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <button type="button" class="btn btn-primary" onclick="add()">添加</button>
                            </div>
                        </div>
                        <br><br>
                    </div>
                </div>

                <div class="table-responsive" >
                <div class="panel panel-default">


                    <!-- Table -->
                    <table class="table">
                        <tr>
                            <th>姓名</th>
                            <th>学号</th>
                            <th>院系</th>
                            <th>年龄</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${users}" var="user">
                            <tr>
                                <td>
                                    ${user.name}
                                </td>
                                <td>
                                        ${user.id}
                                </td>
                                <td>
                                        ${user.major}
                                </td>
                                <td>
                                        ${user.age}
                                </td>
                                <td>
                                    <button type="button" class="btn btn-success">详细</button>
                                    <button type="button" class="btn btn-primary">修改</button>
                                    <button type="button" class="btn btn-danger" onclick="del(${user.id})">删除</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>



                </div>
            </div>
            </c:if>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<script src="../../static/js/bootstrap.min.js"></script>
<script src="../../static/js/jquery.pagination.js"></script>
<script>
    function search() {
        var name = document.getElementById("name").value;
        var age = document.getElementById("age").value;
        var id = document.getElementById("num").value;
        var major = document.getElementById("major").value;
        console.log(name +" " + id +" " + age + " " + major);

        $.ajax({
            url:"/manage/user/search",
            type:"POST",
            dataType:"json",
            data:{id:id,name:name,age:age,major:major,type:"学生"},
            success(data){
                if(data.code=="1000"){
                    location.href = "/manage/student"
                }else {
                    alert(data.msg);
                }
            }
        })
    }
    
    function add() {
        var name = document.getElementById("addName").value;
        var age = document.getElementById("addAge").value;
        var major = document.getElementById("addMajor").value;
        var id = document.getElementById("addNumber").value;

        $.ajax({
            url:"/manage/user/add",
            type:"POST",
            dataType: "json",
            data:{id:id,name:name,age:age,major:major,type:"学生"},
            success(data){
                if (data.code == "1000"){
                    search();
                }else{
                    alert(data.msg);
                }
            }
        })
    }
    function del(id){
        $.ajax({
            url:"/manage/user/delete",
            type:"POST",
            dataType: "json",
            data:{id:id},
            success(data){
                if (data.code == "1000"){
                    search();
                }else{
                    alert(data.msg);
                }
            }
        })
    }
</script>
</body>
</html>
