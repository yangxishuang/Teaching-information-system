package com.yxs.web;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.yxs.pojo.User;
import com.yxs.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
    private UserService service=new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");

        //接收请求参数
        //先创建字符流来读取json
        BufferedReader reader = new BufferedReader(request.getReader());
        String json = reader.readLine();
        //这里用fastjson来解析
        JSONObject jo = JSON.parseObject(json);
        //获取输入的值
        String name = jo.getString("name");
        String id = jo.getString("id");
        String pwd = jo.getString("pwd");
        String faculty = jo.getString("faculty");
        String grade = jo.getString("grade");

//        System.out.println(name+id+pwd+faculty+grade+identify);

        //验证码处理
        //获取用户输入的验证码
        String checkCode = jo.getString("checkCode");
        //session获取程序生成的验证码
        HttpSession session = request.getSession();
        String checkCodeGen = (String) session.getAttribute("checkCodeGen");
        System.out.println(checkCode+checkCodeGen);
        if (!checkCodeGen.equalsIgnoreCase(checkCode)){
            response.getWriter().write("checkCodeError");
            return;
        }

        //封装成user对象
        User user = new User();
        user.setName(name);
        user.setId(id);
        user.setPwd(pwd);
        user.setFaculty(faculty);
        user.setGrade(Integer.valueOf(grade));
//        user.setIdentify(identify);
        System.out.println(user);
        //调用service注册
        boolean flag = service.register(user);
        //判断注册是否成功
        if(flag){
            response.getWriter().write("registSuccess");
        }else {
            response.getWriter().write("registFailed");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
