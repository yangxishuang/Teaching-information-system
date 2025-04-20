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
    <title>用户管理</title>
    <link rel="stylesheet" href="element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="css/userInfo.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
<%--导航栏标记--%>
<header>
    <ul class="outul">
        <li><a class="active" href="index.jsp">主页</a></li>
        <div class="dropdown">
            <a href="#" class="dropbtn">课程</a>
            <div class="dropdown-content">
                <a href="#">思政课程</a>
                <a href="#">职业规划</a>
                <a href="#">求职就业</a>
            </div>
        </div>
        <div class="login">
            <li><a href="user_info.jsp">设置</a></li>
        </div>
    </ul>
</header>

<div id="app">
    <div class="left">
        <template>
            <el-tabs v-model="activeName" @tab-click="handleClick" type="border-card">
                <el-tab-pane label="基本信息" name="a">
                    <h3>基本信息</h3>
                    <el-form ref="form" :rules="rules1" :model="form_info" label-width="80px" label-position="left">
                        <el-form-item label="姓名" prop="name">
                            <el-input v-model="form_info.name" placeholder="请输入姓名"></el-input>
                        </el-form-item>
                        <el-form-item label="学工号" prop="id">
                            <el-input v-model="form_info.id" @blur="checkId()" placeholder="请输入学生学号或教师工号"></el-input>
                        </el-form-item>
                        <el-form-item label="院系" prop="faculty">
                            <template>
                                <el-select v-model="form_info.faculty" filterable placeholder="请选择">
                                    <el-option
                                            v-for="item in options"
                                            :key="item.value"
                                            :label="item.label"
                                            :value="item.value">
                                    </el-option>
                                </el-select>
                            </template>
                        </el-form-item>

                        <el-form-item label="入学年份" prop="grade">
                            <el-date-picker
                                    format="yyyy"
                                    value-format="yyyy"
                                    v-model="form_info.grade"
                                    type="year"
                                    placeholder="选择入学年份">
                            </el-date-picker>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" v-on:click="onSubmit()">修改</el-button>
                        </el-form-item>
                    </el-form>
                </el-tab-pane>

                <el-tab-pane label="账号安全管理" name="b">
                    <h3>账号安全</h3>
                    <el-form ref="form" :rules="rules2" :model="form_sec" label-width="80px" label-position="left">
                        <el-form-item required="true" label="密码" prop="pwd">
                            <el-input v-model="form_sec.pwd" show-password placeholder="请输入密码" ></el-input>
                        </el-form-item>
                        <el-form-item required="true" label="确认密码" prop="pwd_ck">
                            <el-input v-model="form_sec.pwd_ck" show-password placeholder="请再次输入密码" ></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" v-on:click="onSubmit()">修改</el-button>
                        </el-form-item>
                    </el-form>
                </el-tab-pane>
            </el-tabs>
        </template>
    </div>

    <div class="right">
        <h3>身份信息</h3>
        <el-empty :image-size="50"></el-empty>
    </div>

</div>
<div class="clear"></div>

<footer class="foot">
    <h2>相 关 信 息</h2>
    <p>网上有害信息举报（涉未成年人）：网站 https://www.12377.cn 电话 010-58581010 邮箱（涉未成年人） youdao_jubao@rd.netease.com</p>
    <p>教育公共服务平台 | 关于我们 | 会员频道 | 版权说明 | 隐私政策 | 用户协议 | 服务中心 | 联系我们 | 不良信息举报</p>
    <p>Copyright © 2022-2023 Yxs. All rights reserved. 沪ICP备10007256号-5</p>
</footer>




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

            var validatePass = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入密码'));
                } else {
                    if (this.form_sec.pwd !== '') {
                        this.$refs.form.validateField('pwd_ck');
                    }
                    callback();
                }
            };
            var validatePass2 = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请再次输入密码'));
                } else if (value !== this.form_sec.pwd) {
                    callback(new Error('两次输入密码不一致!'));
                } else {
                    callback();
                }
            };
            var yearCheck = (rule, value, callback) => {
                if (value > "2023") {
                    callback(new Error('入学年份不得大于2023'));
                }
                callback();
            };

            return{
                activeName: 'a',
                form_info: {
                    name: "",
                    id: "",
                    grade: "",
                    identify:""
                },
                form_sec: {
                    pwd:"",
                    pwd_ck: ""
                },
                rules1: {
                    grade:[
                        { validator: yearCheck, trigger: 'blur' }
                    ],
                },
                rules2: {
                    pwd: [
                        { validator: validatePass, trigger: 'blur' }
                    ],
                    pwd_ck: [
                        { validator: validatePass2, trigger: 'blur' }
                    ],
                },
                // 院系选择
                options: [{
                    value: '建筑工程学院',
                    label: '建筑工程学院'
                }, {
                    value: '信息工程学院',
                    label: '信息工程学院'
                }, {
                    value: '教育科学学院',
                    label: '教育科学学院'
                }, {
                    value: '经济管理学院',
                    label: '经济管理学院'
                }, {
                    value: '数学院',
                    label: '数学院'
                }, {
                    value: '马克思主义学院',
                    label: '马克思主义学院'
                }],

            };
        },
        methods:{
            handleClick(tab, event) {
                // console.log(tab, event);
            }
        }
    })
</script>
</body>
</html>
