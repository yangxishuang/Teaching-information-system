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
    <title>学生-课程主页</title>
    <link rel="stylesheet" href="element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="css/stu.css">
</head>
<body>

<div id="app">
    <header>
        <div class="nav">

        </div>
        <div class="head">

        </div>
    </header>

    <div class="mid">
        <template>
            <el-tabs v-model="activeName" @tab-click="handleClick">
                <el-tab-pane label="学习任务" name="a">学习任务</el-tab-pane>
                <el-tab-pane label="问答讨论" name="b">问答讨论</el-tab-pane>
                <el-tab-pane label="成绩查询" name="c">成绩查询</el-tab-pane>
                <el-tab-pane label="学习资源" name="d">学习资源</el-tab-pane>
            </el-tabs>
        </template>

        <div id="content">
            <div id="study">
                学习任务
            </div>
            <div id="question">
                问答讨论
            </div>
            <div id="score">
                <a href="stu_score.jsp">查看成绩</a>
            </div>
            <div id="resource">
                学习资源
            </div>
        </div>
    </div>
</div>




<script src="highcharts/highcharts.js"></script>
<script src="highcharts/modules/exporting.js"></script>
<script src="highcharts/modules/series-label.js"></script>
<script src="highcharts/modules/oldie.js"></script>

<script src="js/vue.js"></script>
<script src="element-ui/lib/index.js"></script>

<%--<script src="https://code.highcharts.com.cn/highcharts-plugins/highcharts-zh_CN.js"></script>--%>
<%--<script src="highcharts/themes/gray.js"></script>--%>
<script>
    new Vue({
        el:"#app",
        data:function () {
            return{
                activeName: "a",
            };
        },
        methods:{
            handleClick(tab, event) {
                let divs = document.querySelectorAll("#content>div");
                for (let i = 0; i < divs.length; i++) {
                    divs[i].style.display = "none";
                }
                // alert(tab.name)
                if (tab.name=="a"){
                    document.getElementById("study").style.display="block";
                }else if (tab.name=="b"){
                    document.getElementById("question").style.display="block";
                }else if (tab.name=="c"){
                    document.getElementById("score").style.display="block";
                }else if (tab.name=="d"){
                    document.getElementById("resource").style.display="block";
                }
            }
        }
    })
</script>
</body>
</html>
