package com.dyfive.services;

import com.dyfive.dao.CourseDao;
import com.dyfive.entity.Course;
import com.dyfive.entity.CourseJoinDeptJoinTeacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class CourseService {

    @Autowired
    private CourseDao courseDao;

    @Transactional
    public List<CourseJoinDeptJoinTeacher> searchCourse(Map<String,Object> map){
        return courseDao.searchCourse(map);
    }


}
