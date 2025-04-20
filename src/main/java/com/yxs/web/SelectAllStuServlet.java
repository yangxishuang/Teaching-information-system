package com.yxs.web;

import com.alibaba.fastjson.JSON;
import com.yxs.pojo.User;
import com.yxs.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "selectAllStuServlet", value = "/selectAllStuServlet")
public class SelectAllStuServlet extends HttpServlet {
    UserService service=new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

//        获取session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
//        获取教师id
        String id = user.getId();
//        获取教师学院
        User teacher = service.selectTeacherById(id);
        String teacherFaculty = teacher.getFaculty();

        List<User> students = service.selectStudentsByFaculty(teacherFaculty);
        String stu = JSON.toJSONString(students);
//        System.out.println(stu);

        //存入request
        request.setAttribute("stu",stu);
//        System.out.println("正在查询");
        //转发
        request.getRequestDispatcher("/teacher_index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
