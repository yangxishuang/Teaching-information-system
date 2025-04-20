package com.yxs.mapper;

import com.yxs.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMapper {
    /**
     * 根据用户名和密码查询用户对象
     * @param id
     * @param password
     * @return
     */
    User selectStudent(@Param("id") String id, @Param("password") String password);

    User selectTeacher(@Param("id") String id, @Param("password") String password);

    /**
     * 添加用户
     * @param user
     */
    void addStudent(User user);

    /**
     * 根据用户名查询用户对象
     * @param id
     * @return
     */

    User selectById(String id);

    //查询所有学生
    List<User> selectAllStudent();

    List<User> selectStudentsByFaculty(String faculty);

    User selectTeacherById(String id);

}
