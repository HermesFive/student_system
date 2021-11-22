package com.dyfive.dao;

import com.dyfive.entity.User;
import com.sun.javafx.collections.MappingChange;
import org.apache.ibatis.annotations.Param;

import java.util.*;

public interface UserDao {
    public int create(User user);

    public int delete(Map<String, Object> map);

    public User selectDetail(Map<String, Object> map);

    public User login (@Param("username") String username,@Param("password") String password,@Param("type") String type);

    public int register(Map<String,Object> map);

    public User selectByUsernameAndType(@Param("username") String username, @Param("type") String type);

    public int updateUser(Map<String,Object> map);

    public List<User> searchUsers(Map<String,Object> map);

    public int addUsers(Map<String,Object> map);

    public int deleteUsers(@Param("id") Integer id);

    public List<User> selectTeacherByDeptName(@Param("major") String major);




}
