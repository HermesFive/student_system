package com.dyfive.services;

import com.dyfive.dao.UserDao;
import com.dyfive.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Service
public class IndexService {

    @Autowired
    private UserDao userDao;

    public Map<String,Object> adminIndex(int id, HttpServletRequest request, HttpSession session){
        Map<String,Object> map = new HashMap<>();

        User user = (User)session.getAttribute("user");
        //用户已登陆，可以看到自己的信息
        if (user != null && user.getId()==id){
            map.put("loginState",true);
        }else {
            //用户没有登陆，只能看到别人的信息
            map.put("loginState",false);
        }
        map.put("user",user);
        return map;
    }

}
