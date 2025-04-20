package com.yxs.service;

import com.yxs.mapper.UserMapper;
import com.yxs.pojo.User;
import com.yxs.util.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class UserService {
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();

    //根据id查询老师
    public User selectTeacherById(String id){
        //获取SqlSession
        SqlSession sqlSession = factory.openSession();
        //获取UserMapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //调用方法
        User user = mapper.selectTeacherById(id);
        //释放资源
        sqlSession.close();
        return user;
    }

    //根据学院查询学生
    public List<User> selectStudentsByFaculty(String faculty){
        //获取SqlSession
        SqlSession sqlSession = factory.openSession();
        //获取BrandMapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //调用方法
        List<User> students = mapper.selectStudentsByFaculty(faculty);
        //释放资源
        sqlSession.close();

        return students;
    }

    //查询所有学生
    public List<User> selectAllStudent(){

        //获取SqlSession
        SqlSession sqlSession = factory.openSession();
        //获取BrandMapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //调用方法
        List<User> students = mapper.selectAllStudent();
        //释放资源
        sqlSession.close();

        return students;

    }

    //登入检查
    public User login(String id, String password, String identify){

        //获取SqlSession
        SqlSession sqlSession = factory.openSession();
        //获取UserMapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //调用方法
        User user = null;
        if ("t".equals(identify)){
            user = mapper.selectTeacher(id, password);
        } else if ("s".equals(identify)) {
            user = mapper.selectStudent(id, password);
        }
        //释放资源
        sqlSession.close();
        System.out.println(user);
        return user;
    }

    public boolean register(User user){
        //调用BrandMapper.selectAll()

        //获取SqlSession
        SqlSession sqlSession = factory.openSession();
        //获取UserMapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //判断用户名存在
        User u = mapper.selectById(user.getId());
        if (u==null){
            System.out.println("正在添加学生");
            mapper.addStudent(user);
            sqlSession.commit();
        }

        sqlSession.close();
        return u==null;

    }

    public int selectById(String id){
        //获取SqlSession
        SqlSession sqlSession = factory.openSession();
        //获取UserMapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//        System.out.println("service获取到当前输入id是"+id);
        //调用方法
        User user = mapper.selectById(id);
//        System.out.println(user);
        //释放资源
        sqlSession.close();

        if (user!=null){
            return 1;
        }else {
            return 0;
        }
    }
}
