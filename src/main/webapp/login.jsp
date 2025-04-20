<%--
  Created by IntelliJ IDEA.
  User: Wall-
  Date: 2022/11/5
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding ("UTF-8");%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <title>登入账户</title>
    <link rel="stylesheet" href="element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <%--
        <el-container>：外层容器。当子元素中包含 <el-header> 或 <el-footer> 时，全部子元素会垂直上下排列，否则会水平左右排列。
        <el-header>：顶栏容器。
        <el-aside>：侧边栏容器。
        <el-main>：主要区域容器。
        <el-footer>：底栏容器。
    --%>
    <div id="app">
        <h2 id="title">登录您的账户</h2>
        <div class="logInner">
            <el-form ref="form" :model="form" :rules="rules" label-width="0px" label-position="left" >
                <div id="formStyle">
                    <el-form-item label="" prop="id">
                        <el-input id="btn" v-model="form.id" placeholder="请输入学工号"></el-input>
                    </el-form-item>
                    <el-form-item label="" prop="pwd">
                        <el-input id="btn" v-model="form.pwd" show-password placeholder="请输入密码" ></el-input>
                    </el-form-item>
                    <el-form-item required="true" label="" prop="identify">
                        <el-radio-group v-model="form.identify">
                            <el-radio label="t">我是老师</el-radio>
                            <el-radio label="s">我是学生</el-radio>
                        </el-radio-group>
                    </el-form-item>
                    <el-form-item>
                        <el-button id="btn" type="primary" v-on:click="onSubmit()">登  录</el-button>
                    </el-form-item>
                    <el-form-item>
                        <el-button id="btn" @click="resetForm('form')">重  置</el-button>
                    </el-form-item>
                </div>
                <div id="thing">
                    <el-form-item>
                        <el-checkbox v-model="form.remember" true-label="1" false-label="0">记住我</el-checkbox>
                        <el-link v-on:click="showMsg()" id="forgive" type="primary" :underline="false">忘记密码</el-link>
                        <el-link href="register.jsp" id="forgive" type="primary" :underline="false">注册账户</el-link>
                    </el-form-item>
                </div>
            </el-form>
        </div>

    </div>

    <canvas id="cas"></canvas>

<%--引入文件--%>
    <script src="highcharts/highcharts.js"></script>
    <script src="highcharts/modules/exporting.js"></script>
    <script src="highcharts/modules/series-label.js"></script>
    <script src="highcharts/modules/oldie.js"></script>

    <script src="js/vue.js"></script>
    <script src="element-ui/lib/index.js"></script>
    <script src="js/axios-0.18.0.js"></script>

    <%--<script src="https://code.highcharts.com.cn/highcharts-plugins/highcharts-zh_CN.js"></script>--%>
    <%--<script src="highcharts/themes/gray.js"></script>--%>
<%--创建Vue对象--%>
    <script>
        // import { Notification } from 'element-ui';

        let vm = new Vue({
            el:"#app",
            data() {
                return {
                    form: {
                        id: "${cookie.id.value}",
                        pwd:"${cookie.pwd.value}",
                        identify:"",
                        remember: "",
                    },
                    rules: {
                        id:[
                            {required: true, message: '必须输入学工号', trigger: 'blur'},
                            { min: 2, message: '长度在 2 个字符以上', trigger: 'blur' }
                        ],
                        pwd:[
                            {required: true, message: '必须输入密码', trigger: 'change'}
                        ]
                    }
                };
            },
            methods: {
                onSubmit() {
                    let param={
                        id:this.form.id,
                        pwd:this.form.pwd,
                        identify: this.form.identify,
                        remember: this.form.remember,
                    };

                    axios({
                        method:"post",
                        url:"http://localhost:8080/Teaching-information-system/loginServlet",
                        data:JSON.stringify(param),
                    }).then(function (resp) {
                        if (resp.data=="t"){
                            window.location.href="/Teaching-information-system/selectAllStuServlet";
                        } else if (resp.data=="s"){
                            window.location.href="stu_index.jsp";
                        } else if(resp.data=="0"){
                            vm.$notify.error({
                                title: '错误',
                                message: '登入数据有误'
                            });
                        }
                    });
                },
                resetForm(formName) {
                    this.$refs[formName].resetFields();
                },
                showMsg() {
                    alert("请联系你的主管");
                },
                login() {
                    window.location.href="index.jsp";
                }
            }
        });
    </script>
<%--    引入页面动效--%>
    <script src="js/animate.js"></script>
</body>
</html>
