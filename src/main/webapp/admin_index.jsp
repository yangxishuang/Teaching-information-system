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
    <title>Title</title>
    <link rel="stylesheet" href="element-ui/lib/theme-chalk/index.css">
</head>
<body>

<div id="app">
    <input type="button" value="新增" />
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
            return{

            };
        },
        methods:{
        }
    })
</script>
</body>
</html>
