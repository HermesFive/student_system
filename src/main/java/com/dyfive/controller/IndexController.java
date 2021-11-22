package com.dyfive.controller;

import com.dyfive.entity.User;
import com.dyfive.services.CountService;
import com.dyfive.services.IndexService;
import com.dyfive.services.UserService;
import com.dyfive.utils.MapControll;
import com.sun.javafx.collections.MappingChange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.ClientInfoStatus;
import java.util.*;

@Controller
public class IndexController {

    @Autowired
    IndexService indexService;
    @Autowired
    UserService userService;
    @Autowired
    CountService countService;

    @GetMapping("/index/{id}")
    public String adminIndex(@PathVariable(value="id") int id,HttpServletRequest request,HttpSession session){

        Map<String,Object> map = new HashMap<>();
        map.put("id",id);

        User user = (User)session.getAttribute("user");
        //用户已登陆，可以看到自己的信息
        if (user != null && user.getId()==id){
            session.setAttribute("unLoginUser",null);
            session.setAttribute("login",true);
            if ("管理员".equals(user.getType())){

                Map<String,Object> operates = new HashMap<>();
                operates.put("学籍管理","studentStatus");
                operates.put("学生管理","student");
                operates.put("老师管理","teacher");
                operates.put("课程管理","course");
                session.setAttribute("operates",operates);


                String[] userTypeCount = countService.userTypeCount();
                session.setAttribute("userTypeCount",userTypeCount);
            }
            if("学生".equals(user.getType())){
                Map<String,Object> operates = new HashMap<>();
                operates.put("我的课表","class");
                session.setAttribute("operates",operates);
            }
            if("老师".equals(user.getType())){
                List<String> operates = new LinkedList<>();
                operates.add("学籍管理");
                operates.add("用户管理");
                session.setAttribute("operates",operates);
            }

        }else {
            //用户没有登陆，只能看到别人的信息
            session.setAttribute("login",false);
            session.setAttribute("user",null);
            session.setAttribute("operates",null);
            User unLoginUser = userService.selectDetail(map);
            if (unLoginUser != null){
                session.setAttribute("unLoginUser",unLoginUser);
            }else {
                return "error";
            }

        }
        return "adminIndex";
    }

}
