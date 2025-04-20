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
    <title>教师端-成绩查看</title>
    <link rel="stylesheet" href="element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="css/teacher.css">
</head>
<body>
<div id="app">
    <header>
        <el-menu
                :default-active="activeIndex2"
                class="el-menu-demo"
                mode="horizontal"
                @select="handleSelect"
                background-color="#545c64"
                text-color="#fff"
                active-text-color="#ffd04b">
            <el-menu-item index="1">处理中心</el-menu-item>
            <el-submenu index="2">
                <template slot="title">我的工作台</template>
                <el-menu-item index="2-1">选项1</el-menu-item>
                <el-menu-item index="2-2">选项2</el-menu-item>
                <el-menu-item index="2-3">选项3</el-menu-item>
                <el-submenu index="2-4">
                    <template slot="title">选项4</template>
                    <el-menu-item index="2-4-1">选项1</el-menu-item>
                    <el-menu-item index="2-4-2">选项2</el-menu-item>
                    <el-menu-item index="2-4-3">选项3</el-menu-item>
                </el-submenu>
            </el-submenu>
            <el-menu-item index="3" disabled>消息中心</el-menu-item>
        </el-menu>
    </header>
    <div>
        <el-button v-on:click="showZxt()" type="primary" plain>看平均成绩</el-button>
        <el-button v-on:click="showBt()" type="primary" plain>查看成绩分布</el-button>
    </div>

    <div id="view_score" style="max-width:800px;height:400px;margin: 0 auto"></div>
    <div id="view_stu" style="min-width:400px;height:400px;margin: 0 auto"></div>
</div>




<script src="highcharts/highcharts.js"></script>
<%--<script src="highcharts/modules/exporting.js"></script>--%>
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
            return{
                activeIndex: '1',
                activeIndex2: '1'
            };
        },
        methods:{
            showZxt(){
                viewScore();
            },
            showBt(){
                viewStu();
            },
            handleSelect(key, keyPath) {
                // console.log(key, keyPath);
            }
        }
    });

    window.onload=function () {
        viewScore();
    }


    // 折线图
    function viewScore() {
        document.getElementById("view_score").style.display="block";
        document.getElementById("view_stu").style.display="none";
        var chart = Highcharts.chart('view_score', {
            //标题
            title: {
                text: '2022 ~ 2023 学年编译原理平均成绩情况'
            },
            //副标题
            subtitle: {
                text: '数据来源：近半年统计数据'
            },
            //y标题
            yAxis: {
                title: {
                    text: '分数'
                }
            },
            //x标题
            xAxis: {
                categories: ['9月', '10月','11月', '12月','1月','2月','3月','4月',]
            },
            //版权信息
            credits:{
                enabled: false // 禁用版权信息
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle'
            },

            series: [{
                name: '编译原理',
                data: [72, 73, 87, 68, 71, 81, 73, 55]
            }],
            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 500
                    },
                    chartOptions: {
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom'
                        }
                    }
                }]
            }
        });
    }

    //饼图
    function viewStu() {
        document.getElementById("view_score").style.display="none";
        document.getElementById("view_stu").style.display="block";
        var chart2 = Highcharts.chart('view_stu', {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },

            //版权信息
            credits:{
                enabled: false // 禁用版权信息
            },
            title: {
                text: '2022 ~ 2023学年第一学期编译原理成绩分布'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.2f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.2f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    }
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: [{
                    name: '100-90',
                    y: 61.41,
                    sliced: true,
                    selected: true
                }, {
                    name: '90-80',
                    y: 11.84
                }, {
                    name: '80-70',
                    y: 10.85
                }, {
                    name: '70-60',
                    y: 4.67
                }, {
                    name: '60-50',
                    y: 4.18
                }, {
                    name: '<50',
                    y: 1.64
                }]
            }]
        });
    }

</script>
</body>
</html>
