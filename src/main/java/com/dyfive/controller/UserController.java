package com.dyfive.controller;

import com.dyfive.entity.User;
import com.dyfive.services.UserService;
import com.dyfive.utils.MapControll;
import com.sun.javafx.collections.MappingChange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/create")
//    @RequestMapping("/create")
    public String create(User user){

        System.out.println("执行了controller");
        System.out.println(user);
        userService.create(user);
        return "success";
    }

    @PostMapping("/delete")
    public String create(Model model,int id,String username,String name,String remark){
        System.out.println("执行了deleteController");
        Map<String, Object> map = new HashMap<>();
        map.put("id",id);
        map.put("username",username);
        map.put("name",name);
        map.put("remark",remark);

        Set<String> keys = map.keySet();
        for (String key : keys){
            System.out.println(key + " " + map.get(key));
        }
        userService.delete(map);
        return "success";
    }


    @RequestMapping(value="/select" , method= RequestMethod.GET)
    public String select(Map<String, Object> map,Model model){
        Set<String> keys = map.keySet();
        for (String key : keys){
            System.out.println(key + " " + map.get(key));
        }
        User user = userService.selectDetail(map);
        model.addAttribute("user", user);
        return "success";
    }

    @RequestMapping(value="/change/{id}",method = RequestMethod.GET)
    public String changeInformation(@PathVariable(value="id") int id,HttpSession session){
        User loginUser = (User)session.getAttribute("user");
        if (loginUser!=null &&  id == loginUser.getId()){
            return "change";
        }else {
            return "error";
        }

    }

    @RequestMapping(value="/change/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> changeInformation(@PathVariable(value="id") int id, Integer userId,String username,String password,
                                                String email,int age,String sex,String address,String major, String type, String name,
                                                HttpSession session){

        Map<String,Object> map = new HashMap<>();
        map.put("id",userId);
        map.put("username",username);
        map.put("password",password);
        map.put("name",name);
        map.put("age",age);
        map.put("sex",sex);
        map.put("address",address);
        map.put("major",major);
        map.put("type",type);
        map.put("email",email);
        User loginUser = (User)session.getAttribute("user");
        if (loginUser !=null && id==loginUser.getId() && id==userId){
            int i = userService.updateUser(map);
            if (i==1){
                return MapControll.getInstance().success().getMap();
            }else {
                return MapControll.getInstance().error("更新信息失败").getMap();
            }
        }
        return MapControll.getInstance().error("服务器跑到火星去啦，请联系管理员%_%").getMap();
    }

}
