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

    <title>课程管理</title>

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
                                <span class="input-group-addon" >课程名：</span>
                                <input type="text" class="form-control" placeholder="Search for..." id="courseName">
                            </div>
                        </div>
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon" >教师:</span>
                                <input type="text" class="form-control"placeholder="Search for..." id="courseTeacher">
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon">学院：</span>
                                <select name="type" id="courseDept" class="form-control">
                                    <option value="">请选择</option>
                                    <c:forEach items="${depts}" var="dept">
                                        <option value="${dept}">${dept}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon" >学分：</span>
                                <input type="number" class="form-control"placeholder="Search for..." id="courseCredit">
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

            <c:if test="${courses !=null }">
                <div class="row">
                    <div class="col-md-11">
                        <span class="sub-header" style="font-weight: 300;font-size: 30px;">课程列表</span>
                    </div>
                    <div class="col-md-1">
                        <a href="#addform" class="btn btn-primary" id="add"  data-toggle="collapse">添加课程</a>
                    </div>
                </div>
                <br>
                <br>
                <div class="row">
                    <div id="addform" class="collapse">
                        <div class="row">
                            <div class="col-md-6">
                                <span>课程编号：</span>
                                <input type="text" class="form-control" id="addCourseId">
                            </div>
                            <div class="col-md-6">
                                <span>课程名称：</span>
                                <input type="text" class="form-control" id="addCourseName">
                            </div>
                        </div>

                        <br>
                        <br>
                        <div class="row">
                            <div class="col-md-6">
                                <span >院系：</span>
                                <select name="type" id="addCourseDept" class="form-control">
                                    <option value="">请选择</option>
                                    <c:forEach items="${depts}" var="dept">
                                        <option value="${dept}">${dept}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <span>上课地点:</span>
                                <input type="text" class="form-control" id="addCourseRoom">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-6">
                                <span >教师：</span>
                                <input type="text" class="form-control" id="addCourseTeacher">
                            </div>
                            <div class="col-md-6">
                                <span>学分:</span>
                                <input type="number" class="form-control" id="addCourseCredit">
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
                                <th>课程编号</th>
                                <th>课程名称</th>
                                <th>院系</th>
                                <th>教师</th>
                                <th>上课地点</th>
                                <th>学分</th>
                                <th>学生人数</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach items="${courses}" var="c">
                                <tr>
                                    <td>
                                            ${c.jCourseId}
                                    </td>
                                    <td>
                                            ${c.jCourseName}
                                    </td>
                                    <td>
                                            ${c.jCourseDeptName}
                                    </td>
                                    <td>
                                            ${c.jCourseTeacherName}
                                    </td>
                                    <td>
                                            ${c.jCourseRoom}
                                    </td>
                                    <td>
                                            ${c.jCourseCredit}
                                    </td>
                                    <td>
                                            ${c.jCourseStudentNum}
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-success">详细</button>
                                        <button type="button" class="btn btn-primary">修改</button>
                                        <button type="button" class="btn btn-danger" onclick="del(${c.jCourseId})">删除</button>
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
        var courseName = document.getElementById("courseName").value;
        var courseTeacher = document.getElementById("courseTeacher").value;
        var courseDept = document.getElementById("courseDept").value;
        var courseCredit = document.getElementById("courseCredit").value;

        console.log(courseName + " " + courseTeacher + " " + courseDept);

        $.ajax({
            url:"/manage/course/search",
            type:"POST",
            dataType:"json",
            data:{courseName:courseName,courseTeacher:courseTeacher,courseDept:courseDept,courseCredit:courseCredit},
            success(data){
                if(data.code=="1000"){
                     location.href = "/manage/course"
                }else {
                    alert(data.msg);
                }
            }
        })
    }

</script>
</body>
</html>
