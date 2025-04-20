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
    <title>首页</title>
    <link rel="stylesheet" href="element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <%--
        <el-container>：外层容器。当子元素中包含 <el-header> 或 <el-footer> 时，全部子元素会垂直上下排列，否则会水平左右排列。
        <el-header>：顶栏容器。
        <el-aside>：侧边栏容器。
        <el-main>：主要区域容器。
        <el-footer>：底栏容器。
    --%>
    <header>
        <ul class="outul">
            <li><a class="active" href="#">主页</a></li>
            <li><a href="#course">推荐课程</a></li>
            <li><a href="#teachline">教学计划</a></li>
            <div class="dropdown">
                <a href="#" class="dropbtn">课程</a>
                <div class="dropdown-content">
                    <a href="#">思政课程</a>
                    <a href="#">职业规划</a>
                    <a href="#">求职就业</a>
                </div>
            </div>
            <div class="login">
                <li><a href="login.jsp">登录</a></li>
                <li><a href="register.jsp">注册</a></li>
                <li><a href="user_info.jsp">设置</a></li>
            </div>

        </ul>
    </header>
    <div id="app">

<%--        首页轮播图--%>
        <div>
            <el-carousel :interval="1600" height="30em">
                <el-carousel-item v-for="item in imgwrap">
                    <img class="imgcover" v-bind:src="item" alt="无图片" />
                </el-carousel-item>
            </el-carousel>
        </div>

<%--        推荐按钮部分--%>
        <div class="recommend">
            <div class="mukeOutter">
                <img src="imgs/muke.png" alt="无图片" class="muke">
                <img src="imgs/poli.png" alt="无图片" class="muke">
            </div>
            <div class="recommendBtn">
                <el-row>
                    <el-button icon="el-icon-edit" type="primary" plain round>职业教育课程</el-button>
                    <el-button icon="el-icon-success" type="success" round>大学生共享课</el-button>
                    <el-button type="info" round plain>社会实践课</el-button>
                    <el-button type="warning" round>职业专业</el-button>
                    <el-button type="danger" round plain>人工智能+</el-button>
                    <el-button icon="el-icon-edit" type="primary" round>数据结构</el-button>
                    <el-button type="info" round plain>写作专项</el-button>
                </el-row>
                <br>
                <el-row>
                    <el-button type="danger" round plain>互联网生活</el-button>
                    <el-button icon="el-icon-edit" type="primary" round>高等数学</el-button>
                    <el-button type="danger" round>大数据</el-button>
                    <el-button icon="el-icon-success" type="success" round>线性代数</el-button>
                    <el-button type="info" round>考研教学</el-button>
                    <el-button type="warning" round>文言文写作</el-button>
                    <el-button icon="el-icon-success" type="success" round>音乐鉴赏</el-button>
                </el-row>
            </div>
        </div>
    <div class="floatClear"></div>
    <el-divider>学期选修课程</el-divider>
    <%--推荐课程部分--%>
    <h2 style="text-align:center">推 荐 课 程</h2>
        <div id="course">
            <div class="course_inner">
                <el-card :body-style="{ padding: '0px' }">
                    <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png" class="image">
                    <div style="padding: 14px;">
                        <span>高等数学</span>
                        <div class="bottom clearfix">
                            <el-button type="text" class="button" v-on:click="onSubmit()">查看详情</el-button>
                        </div>
                    </div>
                </el-card>
            </div>
            <div class="course_inner">
                <el-card :body-style="{ padding: '0px' }">
                    <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png" class="image">
                    <div style="padding: 14px;">
                        <span>线性代数</span>
                        <div class="bottom clearfix">
                            <el-button type="text" class="button">查看详情</el-button>
                        </div>
                    </div>
                </el-card>
            </div>
            <div class="course_inner">
                <el-card :body-style="{ padding: '0px' }">
                    <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png" class="image">
                    <div style="padding: 14px;">
                        <span>数据结构</span>
                        <div class="bottom clearfix">
                            <el-button type="text" class="button">查看详情</el-button>
                        </div>
                    </div>
                </el-card>
            </div>
            <div class="course_inner">
                <el-card :body-style="{ padding: '0px' }">
                    <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png" class="image">
                    <div style="padding: 14px;">
                        <span>Vue</span>
                        <div class="bottom clearfix">
                            <el-button type="text" class="button">查看详情</el-button>
                        </div>
                    </div>
                </el-card>
            </div>
        </div>
        <div class="floatClear"></div>
        <div id="course">
            <div class="course_inner">
                <el-card :body-style="{ padding: '0px' }">
                    <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png" class="image">
                    <div style="padding: 14px;">
                        <span>概率论</span>
                        <div class="bottom clearfix">
                            <el-button type="text" class="button">查看详情</el-button>
                        </div>
                    </div>
                </el-card>
            </div>
            <div class="course_inner">
                <el-card :body-style="{ padding: '0px' }">
                    <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png" class="image">
                    <div style="padding: 14px;">
                        <span>数理统计</span>
                        <div class="bottom clearfix">
                            <el-button type="text" class="button">查看详情</el-button>
                        </div>
                    </div>
                </el-card>
            </div>
            <div class="course_inner">
                <el-card :body-style="{ padding: '0px' }">
                    <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png" class="image">
                    <div style="padding: 14px;">
                        <span>大学物理</span>
                        <div class="bottom clearfix">
                            <el-button type="text" class="button">查看详情</el-button>
                        </div>
                    </div>
                </el-card>
            </div>
            <div class="course_inner">
                <el-card :body-style="{ padding: '0px' }">
                    <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png" class="image">
                    <div style="padding: 14px;">
                        <span>Java EE开发</span>
                        <div class="bottom clearfix">
                            <el-button type="text" class="button">查看详情</el-button>
                        </div>
                    </div>
                </el-card>
            </div>
        </div>
        <div class="floatClear"></div>
        <%--教学规划--%>
        <el-divider>学期教学计划</el-divider>
        <div class="timeline" id="teachline">
            <el-timeline>
                <el-timeline-item timestamp="2022/9/12" placement="top">
                    <el-card>
                        <h4>开课</h4>
                        <p>提交于 2022/4/12 20:46</p>
                    </el-card>
                </el-timeline-item>
                <el-timeline-item timestamp="2022/9/30" placement="top">
                    <el-card>
                        <h4>中期随堂考核</h4>
                        <p>提交于 2022/4/3 20:46</p>
                    </el-card>
                </el-timeline-item>
                <el-timeline-item timestamp="2022/10/1" placement="top">
                    <el-card>
                        <h4>毕业论文开题</h4>
                        <p>提交于 2022/10/21 20:46</p>
                    </el-card>
                </el-timeline-item>
                <el-timeline-item timestamp="2022/10/21" placement="top">
                    <el-card>
                        <h4>毕业论文开题</h4>
                        <p>提交于 2022/10/21 20:46</p>
                    </el-card>
                </el-timeline-item>
                <el-timeline-item timestamp="2022/10/21" placement="top">
                    <el-card>
                        <h4>期末考试</h4>
                        <p>提交于 2022/10/22 20:52</p>
                    </el-card>
                </el-timeline-item>

            </el-timeline>
        </div>
    </div>


    <footer class="foot">
        <h2>相 关 信 息</h2>
        <p>网上有害信息举报（涉未成年人）：网站 https://www.12377.cn 电话 010-58581010 邮箱（涉未成年人） youdao_jubao@rd.netease.com</p>
        <p>教育公共服务平台 | 关于我们 | 会员频道 | 版权说明 | 隐私政策 | 用户协议 | 服务中心 | 联系我们 | 不良信息举报</p>
        <p>Copyright © 2022-2023 Yxs. All rights reserved. 沪ICP备10007256号-5</p>
    </footer>

<%--引入文件--%>
    <script src="highcharts/highcharts.js"></script>
    <script src="highcharts/modules/exporting.js"></script>
    <script src="highcharts/modules/series-label.js"></script>
    <script src="highcharts/modules/oldie.js"></script>

    <script src="js/vue.js"></script>
    <script src="element-ui/lib/index.js"></script>

    <%--<script src="https://code.highcharts.com.cn/highcharts-plugins/highcharts-zh_CN.js"></script>--%>
    <%--<script src="highcharts/themes/gray.js"></script>--%>

<%--创建Vue对象--%>
    <script>
        new Vue({
            el:"#app",
            data:function () {
                return{
                    // addrs:[1,2,3,4,5,6],
                    imgwrap: ["imgs/1.png","imgs/2.png","imgs/3.png","imgs/4.png"],
                    currentDate: new Date(),
                    testtext:"刘老师",
                    // 时间线
                    reverse: true,
                    activities: [{
                        content: '活动按期开始',
                        timestamp: '2018-04-15'
                    }, {
                        content: '通过审核',
                        timestamp: '2018-04-13'
                    }, {
                        content: '创建成功',
                        timestamp: '2018-04-11'
                    }],
                };
            },
            methods:{
                show(){
                    alert("我被点击");
                },
                onSubmit(){
                    window.location.href="https://www.bilibili.com/video/BV1Eb411u7Fw/";
                }
            }
        });
    </script>


</body>
</html>
