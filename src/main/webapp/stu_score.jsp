<%--
  Created by IntelliJ IDEA.
  User: Wall-
  Date: 2022/11/11
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding ("UTF-8");%>
<html>
<head>
    <title>学生信息</title>
    <link rel="stylesheet" href="element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="css/stu.css">
</head>
<body>
    <header>
        <ul class="outul">
            <li><a class="active" href="#home">主页</a></li>
            <li><a href="#news">新闻</a></li>
            <div class="dropdown">
                <a href="#" class="dropbtn">下拉菜单</a>
                <div class="dropdown-content">
                    <a href="#">链接 1</a>
                    <a href="#">链接 2</a>
                    <a href="#">链接 3</a>
                </div>
            </div>
        </ul>
    </header>
    <h2>${user.name},欢迎你</h2>
    <div id="app">
        <div id="container" style="max-width:800px;height:400px;margin: 0 auto"></div>
    </div>




<script src="highcharts/highcharts.js"></script>
<%--<script src="highcharts/modules/exporting.js"></script>--%>
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

                };
            },
            methods:{
            }
        });

        // 图表

        var chart = Highcharts.chart('container', {
            //标题
            title: {
                text: '2022 ~ 2023 学年你的各科成绩情况'
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
            // plotOptions: {
            //     series: {
            //         label: {
            //             connectorAllowed: false
            //         },
            //         pointStart: 9
            //     }
            // },
            series: [{
                name: '编译原理',
                data: [72, 73, 87, 68, 71, 81, 73, 55]
            }, {
                name: '计算机组成原理',
                data: [76, 84, 92, 71, 80, 72, 86, 80]
            }, {
                name: '计算机网络',
                data: [84, 62, 75, 71, 85, 77, 77, 98]
            }, {
                name: '数据库基础',
                data: [0, 0, 48, 59, 42, 52, 60, 67]
            }, {
                name: '大学英语',
                data: [100, 92, 100, 99, 97, 98, 100, 100]
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
    </script>
</body>
</html>
