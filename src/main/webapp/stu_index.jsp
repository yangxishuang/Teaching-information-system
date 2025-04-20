<%--
  Created by IntelliJ IDEA.
  User: Wall-
  Date: 2022/11/11
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding ("UTF-8");%>
<html>
<head>
    <title>学生主页</title>
    <link rel="stylesheet" href="element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="css/stu.css">

</head>
<body>

<div id="app">
    <header class="head_index">
        <div class="head_index_inner">
            <div class="head_index_inner_left">
                <h2>Hi,${user.name}同学</h2>
            </div>
            <div class="head_index_inner_right">
                <p>本周课程：4</p>
                <p>学期课程：6</p>
            </div>
        </div>
    </header>
    <div class="mid">
        <div class="course">
            <div class="course_title"><h2>本周课程</h2></div>
            <div class="course_rate">
                <el-rate
                        v-model="value"
                        disabled
                        show-score
                        text-color="#ff9900"
                        score-template="{value}">
                </el-rate>
            </div>
            <div class="clear"></div>
            <el-button type="success" v-on:click="turn()" plain>成绩查询</el-button>
            <el-empty :image-size="200" description="暂无课程"></el-empty>
        </div>
        <div>
            <div class="info">
                <el-empty :image-size="50" description="暂无内容"></el-empty>
            </div>
            <div class="info">
                <el-empty :image-size="50" description="暂无消息"></el-empty>
            </div>

        </div>

        <div class="clear"></div>
    </div>

</div>




<script src="highcharts/highcharts.js"></script>
<script src="highcharts/modules/exporting.js"></script>
<script src="highcharts/modules/series-label.js"></script>
<script src="highcharts/modules/oldie.js"></script>

<script src="js/vue.js"></script>
<script src="element-ui/lib/index.js"></script>
<script src="js/axios-0.18.0.js"></script>

<script>
    new Vue({
        el:"#app",
        data:function () {
            return{
                value: 3.7,
            };
        },
        methods:{
            turn(){
                window.location.href="stu_score.jsp";
            },
        }
    })
</script>
</body>
</html>
