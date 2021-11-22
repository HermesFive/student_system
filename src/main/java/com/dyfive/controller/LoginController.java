package com.dyfive.controller;

import com.dyfive.entity.User;
import com.dyfive.services.UserService;
import com.dyfive.utils.MapControll;
import com.github.pagehelper.util.StringUtil;
import com.sun.deploy.net.HttpResponse;
import com.sun.javafx.collections.MappingChange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public Map<String, Object> login(String username, String password, String type, HttpServletRequest request, HttpServletResponse response){

        response.setCharacterEncoding("utf-8");

        if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password) || StringUtils.isEmpty(type)){
            return MapControll.getInstance().error("用户名和密码不能为空").getMap();
        }

        User user = userService.login(username,password,type);

        if(user == null){
            return MapControll.getInstance().error("用户名,密码或权限选择错误").getMap();
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            if ("管理员".equals(user.getType())){
                return MapControll.getInstance().success().add("id",user.getId()).getMap();
            }
            if ("老师".equals(type)){
                return MapControll.getInstance().success().add("id",user.getId()).getMap();
            }
            if("学生".equals(type)){
                return MapControll.getInstance().success().add("id",user.getId()).getMap();
            }
        }
        return MapControll.getInstance().error("登陆失败").getMap();
    }


    @GetMapping("/register")
    public String register(){
        return "register";
    }

    @PostMapping("/register")
    @ResponseBody
    public Map<String,Object> register(String username,String password, String type, String email,HttpServletRequest request, HttpServletResponse response){

        response.setCharacterEncoding("utf-8");

        User user = userService.selectByUsernameAndType(username,type);
        if (user != null){
            return MapControll.getInstance().error("用户名已存在").getMap();
        }else {
            Map<String,Object> map =new HashMap<>();
            map.put("username",username);
            map.put("password",password);
            map.put("type" ,type);
            map.put("email",email);
            int i = userService.register(map);
            if (i==1){
                return MapControll.getInstance().success().add("res","注册成功").getMap();
            }else {
                return MapControll.getInstance().error("注册失败").getMap();
            }
        }
    }

    @RequestMapping("/logout")
    @ResponseBody
    public ModelAndView logout(HttpSession session){
        session.invalidate();
        //登出之后，重定向到登陆页面
        return new ModelAndView("redirect:/login");
    }

}
