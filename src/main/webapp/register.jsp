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
    <title>注册您的账户</title>
    <link rel="stylesheet" href="element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="css/register.css">
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
        <h2 id="title">注册账户</h2>
        <div class="logInner">
            <el-form ref="form" :rules="rules" :model="form" label-width="80px" label-position="left">
                <el-form-item required="true" label="姓名" prop="name">
                    <el-input v-model="form.name" placeholder="请输入姓名"></el-input>
                </el-form-item>
                <el-form-item required="true" label="学工号" prop="id">
                    <el-input v-model="form.id" @blur="checkId()" placeholder="请输入学生学号或教师工号"></el-input>
                </el-form-item>
                <el-form-item required="true" label="密码" prop="pwd">
                    <el-input v-model="form.pwd" show-password placeholder="请输入密码" ></el-input>
                </el-form-item>
                <el-form-item required="true" label="确认密码" prop="pwd_ck">
                    <el-input v-model="form.pwd_ck" show-password placeholder="请再次输入密码" ></el-input>
                </el-form-item>
                <el-form-item required="true" label="院系" prop="faculty">
                    <template>
                        <el-select v-model="form.faculty" filterable placeholder="请选择">
                            <el-option
                                    v-for="item in options"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                    </template>
                </el-form-item>

                <el-form-item required="true" label="入学年份" prop="grade">
                    <el-date-picker
                            format="yyyy"
                            value-format="yyyy"
                            v-model="form.grade"
                            type="year"
                            placeholder="选择入学年份">
                    </el-date-picker>
                </el-form-item>
                <el-form-item required="true" label="验证码" prop="checkCode">
                    <el-input id="ckCode" v-model="form.checkCode" placeholder="请输入验证码"></el-input>
                    <a href="#" id="changeImg"><img id="checkCodeImg" src="/Teaching-information-system/checkCodeServlet"></a>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" v-on:click="onSubmit()">立即注册</el-button>
                    <el-button v-on:click="turn()" type="success" plain>登入已有账户</el-button>
                </el-form-item>
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
        let vm = new Vue({
            el:"#app",
            data() {
                var validatePass = (rule, value, callback) => {
                    if (value === '') {
                        callback(new Error('请输入密码'));
                    } else {
                        if (this.form.pwd !== '') {
                            this.$refs.form.validateField('pwd_ck');
                        }
                        callback();
                    }
                };
                var validatePass2 = (rule, value, callback) => {
                    if (value === '') {
                        callback(new Error('请再次输入密码'));
                    } else if (value !== this.form.pwd) {
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

                return {
                    form: {
                        name: "",
                        id: "",
                        pwd:"",
                        pwd_ck: "",
                        faculty: "",
                        grade: "",
                        checkCode:""
                    },
                    rules: {
                        name:[
                            {required: true, message: '必须输入姓名', trigger: 'blur'}
                        ],
                        id:[
                            {required: true, message: '必须输入学工号', trigger: 'blur'},
                            {min: 2, message: '长度在 2 个数字以上', trigger: 'blur' }
                        ],
                        faculty:[
                            {required: true, message: '必须选择学院', trigger: 'blur'}
                        ],
                        grade:[
                            {required: true, message: '必须选择入校年份', trigger: 'blur'},
                            { validator: yearCheck, trigger: 'blur' }
                        ],
                        checkCode:[
                            {required: true, message: '未输入验证码', trigger: 'blur'}
                        ],
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
                }
            },
            methods: {
                // Vue.prototype.Notification = Notification;
                onSubmit() {
                    let param={
                        name: this.form.name,
                        id: this.form.id,
                        pwd:this.form.pwd,
                        faculty: this.form.faculty,
                        grade: this.form.grade,
                        checkCode:this.form.checkCode
                    };
                    if (param.name=="" || param.id=="" || param.pwd=="" || param.faculty=="" || param.grade=="" || param.identify=="" || param.checkCode==""){
                        this.$notify({
                            title: '警告',
                            message: '请将表单填写完整',
                            type: 'warning'
                        });
                        return;
                    }
                    axios({
                        method:"post",
                        url:"http://localhost:8080/Teaching-information-system/registerServlet",
                        // transfer:true,
                        data:JSON.stringify(param)
                    }).then(function (resp) {
                        if (resp.data=="checkCodeError"){
                            vm.$notify.error({
                                title: '错误',
                                message: '验证码错误'
                            });
                        }else if(resp.data=="registSuccess"){
                            // alert("注册成功");
                            vm.$notify({
                                title: '成功',
                                message: '注册成功',
                                type: 'success'
                            });
                        }else if(resp.data=="registFailed"){
                            vm.$notify.error({
                                title: '错误',
                                message: '注册失败'
                            });
                        }
                    });
                },
                turn() {
                    window.location.href="login.jsp";
                },
                checkId() {
                    // alert("执行了");
                    var id=this.form.id;
                    axios({
                        method:"post",
                        url:"http://localhost:8080/Teaching-information-system/selectUserServlet",
                        data:"id="+id,
                    }).then(function (resp) {
                        if (resp.data){
                            vm.$message({
                                message: '学工号已存在，可直接登入',
                                type: 'warning'
                            });
                        }
                    });
                }
            }
        });

        document.getElementById("changeImg").onclick=function () {
            document.getElementById("checkCodeImg").src="/Teaching-information-system/checkCodeServlet?"+new Date().getMilliseconds();
        }
    </script>
    <%--    引入页面动效--%>
    <script src="js/animate.js"></script>


</body>
</html>
