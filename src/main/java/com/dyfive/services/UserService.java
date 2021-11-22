package com.dyfive.services;

import com.dyfive.dao.UserDao;
import com.dyfive.entity.User;
import com.dyfive.utils.Entity;
import com.dyfive.utils.MapParameter;
import com.github.pagehelper.PageHelper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.*;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    @Transactional
    public int create(User user){
        System.out.println("执行了service");
        System.out.println(user);
        return userDao.create(user);
    }

    public int delete(Map<String,Object> map){
        System.out.println("执行了deleteService");
        return userDao.delete(map);
    }

//    public User detail(Integer id){
//        return userDao.detail(MapParameter.getInstance().addId(id).getMap());
//    }

    public User selectDetail(Map<String, Object> map){
        System.out.println("执行了selectService");
        return userDao.selectDetail(map);
    }

    public User selectByUsernameAndType(String username,String type){
        return userDao.selectByUsernameAndType(username,type);
    }

    public User login(String username,String password,String type){
        return userDao.login(username,password,type);
    }

    public int register(Map<String,Object> map){
        return userDao.register(map);
    }

    public int updateUser(Map<String,Object> map){
        return userDao.updateUser(map);
    }

    public List<User> searchUsers(Map<String,Object> map){
        User user = new User();
        user.setId((Integer) map.get("id"));
        user.setAge((Integer) map.get("age"));
        user.setMajor((String)map.get("major"));
        user.setName((String)map.get("name"));
        user.setType((String)map.get("type"));

        return userDao.searchUsers(map);
    }

    public int addUsers(Map<String,Object> map){
        return userDao.addUsers(map);
    }

    public int deleteUsers(Integer id){
        return userDao.deleteUsers(id);
    }

    public List<User> selectTeacherByDeptName(String major){
        List<User> teachersByDept = userDao.selectTeacherByDeptName(major);
        return teachersByDept;
    }




}
