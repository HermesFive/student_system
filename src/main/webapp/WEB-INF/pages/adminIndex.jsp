<%--
  Created by IntelliJ IDEA.
  User: dyfive
  Date: 2021/10/21
  Time: 1:49 下午
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

    <title>管理</title>

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
            <ul class="nav nav-sidebar">
                <c:forEach items="${operates}" var="keyword" varStatus="id">
                    <li>
                        <a href="/manage/${keyword.value}">${keyword.key}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">Dashboard</h1>

            <div class="row placeholders">
                <div class="jumbotron">
                    <h3>个人信息</h3>
                    <ul class="list-group">
                        <li class="list-group-item" style="background-color: #f6f6f6">用户名：${user.username}${unLoginUser.username}</li>
                        <li class="list-group-item" style="background-color: #f6f6f6">姓名：${user.name}${unLoginUser.name}</li>
                        <li class="list-group-item" style="background-color: #f6f6f6">邮箱：${user.email}${unLoginUser.email}</li>
                        <li class="list-group-item" style="background-color: #f6f6f6">身份：${user.type}${unLoginUser.type}</li>
                    </ul>
                    <c:if test="${login}">
                       <p><a class="btn btn-primary btn-lg" href="/user/change/${user.id}" id="self" role="button" >编辑个人信息</a></p>
                    </c:if>
                </div>
            </div>

            <div id="main" style="width: 600px;height:400px;" class="col-md-12"></div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<script src="../../static/js/bootstrap.min.js"></script>
<%--引入echarts--%>
<script src="https://cdn.jsdelivr.net/npm/echarts@5.2.1/dist/echarts.js"></script>
<script>
    function MapTOJson(m) {
        var str = '{';
        var i = 1;
        m.forEach(function (item, key, mapObj) {
            if(mapObj.size == i){
                str += '"'+ key+'":"'+ item + '"';
            }else{
                str += '"'+ key+'":"'+ item + '",';
            }
            i++;
        });
        str +='}';
        //console.log(str);
        return str;
    }

    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    option = {
        title: {
            text: '用户类型分布',
            left: 'center'
        },
        tooltip: {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            left: 'left'
        },
        series: [
            {
                name: '用户类型',
                type: 'pie',
                radius: '50%',
                data:[
                    <c:forEach items="${userTypeCount}" var="type" varStatus="id">
                       ${type},
                    </c:forEach>
                ],
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>


