package com.dyfive.services;

import com.dyfive.dao.CountDao;
import com.dyfive.utils.MapControll;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

@Service
public class CountService {

    @Autowired
    private CountDao countDao;

    public String[] userTypeCount(){
        int studentCount = countDao.userTypeCount("学生");
        int teacherCount = countDao.userTypeCount("老师");
        int adminCount = countDao.userTypeCount("管理员");
        String[] list = new String[3];
        list[0] = "{" + "name" + ":" + "'学生'" + ","+"value" + ":" +Integer.toString(studentCount) + "}";
        list[1] = "{" + "name" + ":" + "'老师'" + ","+"value" + ":" +Integer.toString(teacherCount) + "}";
        list[2] = "{" + "name" + ":" + "'管理员'" + ","+"value" + ":" +Integer.toString(adminCount) + "}";
        return list;
    }
}
