package com.yxs.web;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.yxs.pojo.User;
import com.yxs.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/loginServlet")
public class LoginServlet extends HttpServlet {
    UserService service=new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        //接收请求参数
        //先创建字符流来读取json
        BufferedReader reader = new BufferedReader(request.getReader());
        String json = reader.readLine();
        //这里用fastjson来解析
        JSONObject jo = JSON.parseObject(json);
        //获取对应的值
        String id = jo.getString("id");
        String pwd = jo.getString("pwd");
        String identify = jo.getString("identify");
        String remember = jo.getString("remember");

//        System.out.println(id+pwd+identify+remember);
        reader.close();
        //查询
        User user = service.login(id, pwd, identify);

        if (user!=null){
            //判断是否勾选记住密码
            if("1".equals(remember)){
                //创建Cookie对象
                Cookie c_id = new Cookie("id", id);
                Cookie c_pwd = new Cookie("pwd", pwd);
                //设置存活时间
                c_id.setMaxAge(60*60*24*7);
                c_pwd.setMaxAge(60*60*24*7);
                //发送数据
                response.addCookie(c_id);
                response.addCookie(c_pwd);
            }
            //将登录成功后的user对象存储到session中
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            //返回response数据
            if ("t".equals(identify)){
                response.getWriter().write("t");
            } else if ("s".equals(identify)) {
                response.getWriter().write("s");
            }

        }else {
            response.getWriter().write("0");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
