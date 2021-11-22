package com.dyfive.controller;

import com.dyfive.entity.Course;
import com.dyfive.entity.CourseJoinDeptJoinTeacher;
import com.dyfive.entity.Department;
import com.dyfive.entity.User;
import com.dyfive.services.CourseService;
import com.dyfive.services.DeptServices;
import com.dyfive.services.UserService;
import com.dyfive.utils.MapControll;
import com.github.pagehelper.PageInfo;
import com.sun.javafx.collections.MappingChange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/manage")
public class AdminController {
    @Autowired
    private UserService userService;

    @Autowired
    private CourseService courseService;


    @Autowired
    private DeptServices deptServices;

    @GetMapping("/student")
    public String StudentManage(HttpSession session){
        User loginUser = (User)session.getAttribute("user");
        //只有当管理员登陆的时候才会显示该页面
        if (loginUser != null && "管理员".equals(loginUser.getType())){
            List<String> depts = deptServices.getDeptName();
            session.setAttribute("depts",depts);
            return "studentManage";
        }else {
            return "error";
        }
    }
    @PostMapping("/user/search")
    @ResponseBody
    public Map<String,Object> UserSearch(Integer id, Integer age, String major, String name, String type, HttpServletRequest request, HttpSession session){
        User loginUser = (User)session.getAttribute("user");
        //只有当管理员登陆的时候才会显示该页面
        if (loginUser != null && "管理员".equals(loginUser.getType())){
            Map<String,Object> map = new HashMap<>();
            map.put("id",id);
            map.put("age",age);
            map.put("name",name);
            map.put("major",major);
            map.put("type",type);

            List<User> list = userService.searchUsers(map);
            if (list.size() == 0){
                return MapControll.getInstance().error("不存在该查询条件的学生QAQ").getMap();
            }
            session.setAttribute("users",list);

            return MapControll.getInstance().success().getMap();

        }else {
            return MapControll.getInstance().error("您没有权限访问QAQ，请联系管理员").getMap();
        }

    }

    @PostMapping("/user/add")
    @ResponseBody
    public Map<String,Object> UserAdd(Integer id, Integer age, String major, String name, String type, HttpServletRequest request, HttpSession session){
        User loginUser = (User)session.getAttribute("user");
        //只有当管理员登陆的时候才会显示该页面
        if (loginUser != null && "管理员".equals(loginUser.getType())){

            Department department = deptServices.selectByDeptName(major);
            Map<String,Object> map = new HashMap<>();
            map.put("id",id);
            map.put("age",age);
            map.put("name",name);
            map.put("major",department.getDeptId());
            map.put("type",type);
            map.put("username",Integer.toString(id));
            map.put("password","123456");
            map.put("email",Integer.toString(id) + "@stu.ecnu.edu.cn");


            int i = userService.addUsers(map);
            if (i != 1){
                return MapControll.getInstance().error("添加失败QAQ").getMap();
            }else {
                return MapControll.getInstance().success().getMap();
            }



        }else {
            return MapControll.getInstance().error("您没有权限访问QAQ，请联系管理员").getMap();
        }
    }

    @PostMapping("user/delete")
    @ResponseBody
    public Map<String,Object> UserDelete(Integer id,HttpSession session){
        User loginUser = (User)session.getAttribute("user");
        if (loginUser !=null && "管理员".equals(loginUser.getType())){
            userService.deleteUsers(id);
            return MapControll.getInstance().success().getMap();
        }
        return MapControll.getInstance().error().getMap();
    }

    @GetMapping("/teacher")
    public String TeacherManage(){
        return "teacherManage";
    }

    @PostMapping("/teacher/search")
    @ResponseBody
    public Map<String,Object> TeacherSearch(HttpSession session, String dept){
        User loginUser = (User)session.getAttribute("user");
        if (loginUser != null && "管理员".equals(loginUser.getType())) {
            List<User> teachersByDept = userService.selectTeacherByDeptName(dept);
            session.setAttribute("teachers",teachersByDept);
            return MapControll.getInstance().success().getMap();

        }else {
            return MapControll.getInstance().error("没有权限访问").getMap();
        }
    }

    @GetMapping("/course")
    public String CourseManage(HttpSession session){
        User loginUser = (User)session.getAttribute("user");
        if (loginUser != null && "管理员".equals(loginUser.getType())){
            List<String> depts = deptServices.getDeptName();
            session.setAttribute("depts",depts);
            return "courseManage";
        }
        return "error";
    }

    @PostMapping("/course/search")
    @ResponseBody
    public Map<String,Object> CourseSearch(String courseName,String courseTeacher,String courseDept, Integer CourseCredit, HttpSession session){
        User loginUser = (User)session.getAttribute("user");
        if (loginUser != null && "管理员".equals(loginUser.getType())){

//            Department department = deptServices.selectByDeptName(courseDept);

            Map<String,Object> map = new HashMap<>();
            map.put("courseTeacher",courseTeacher);
            map.put("courseName",courseName);
            map.put("courseDept", courseDept);
            map.put("CourseCredit",CourseCredit);

            List<CourseJoinDeptJoinTeacher> list = courseService.searchCourse(map);
            System.out.println("list");

            if (list.size() == 0){
                return MapControll.getInstance().error("不存在该查询条件的课程QAQ").getMap();
            }

            for (CourseJoinDeptJoinTeacher t :list){
                System.out.println(t);
            }

            session.setAttribute("courses",list);

            return MapControll.getInstance().success().getMap();

        }else {
            return MapControll.getInstance().error("您没有权限访问QAQ，请联系管理员").getMap();
        }
    }




}
