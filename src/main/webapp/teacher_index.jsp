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
    <title>教师主页</title>
    <link rel="stylesheet" href="element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="css/teacher.css">
</head>
<body>

<div id="app">
    <header class="head_index">
        <div class="head_index_inner">
            <div class="head_index_inner_left">
                <h2>Hi,${user.name}老师</h2>
            </div>
            <div class="head_index_inner_right">
                <p>本周课程：4</p>
                <p>学期课程：6</p>
            </div>
        </div>
    </header>

    <div class="mid">
        <div class="course">
            <template>
                <el-tabs v-model="activeName" @tab-click="handleClick">
                    <el-tab-pane label="课程管理" name="a">
                        <div id="course_first">
                            <h2>本周课程</h2>
                            <el-empty :image-size="200" description="暂无课程"></el-empty>
                        </div>
                    </el-tab-pane>
                    <el-tab-pane label="学生信息" name="b">
                        <div id="course_second">
                            <h2>学生信息</h2>
                            <template>
                                <el-table
                                        :data="tableData"
                                        border
                                        stripe
                                        style="width: 100%">
                                    <el-table-column
                                            prop="id"
                                            label="编号"
                                            width="180">
                                    </el-table-column>
                                    <el-table-column
                                            prop="name"
                                            label="姓名"
                                            width="180">
                                    </el-table-column>
                                    <el-table-column
                                            prop="grade"
                                            label="年级"
                                            width="180">
                                    </el-table-column>
                                    <el-table-column
                                            prop="faculty"
                                            label="所属学院">
                                    </el-table-column>
                                </el-table>
                            </template>
                        </div>
                    </el-tab-pane>
                    <el-tab-pane label="成绩管理" name="c">
                        <div id="course_third">
                            <el-button type="primary" v-on:click="turn()" plain>查看成绩详情</el-button>
                        </div>
                    </el-tab-pane>
                </el-tabs>
            </template>
        </div>

        <div>
            <div class="info">
                <p>学生提问</p>
                <el-empty :image-size="50" description="暂无内容"></el-empty>
            </div>
            <div class="info">
                <p>系统通知</p>
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

<%--<script src="https://code.highcharts.com.cn/highcharts-plugins/highcharts-zh_CN.js"></script>--%>
<%--<script src="highcharts/themes/gray.js"></script>--%>
<script>
    new Vue({
        el:"#app",
        data:function () {
            return {
                tableData: ${stu},
                activeName: "a",
            };
        },
        methods:{
            handleClick(tab, event) {

            },
            turn(){
                window.location.href="teacher_score.jsp";
            }
        }
    })

</script>
</body>
</html>
