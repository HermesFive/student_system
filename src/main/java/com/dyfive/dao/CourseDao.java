package com.dyfive.dao;

import com.dyfive.entity.Course;
import com.dyfive.entity.CourseJoinDeptJoinTeacher;

import java.util.*;

public interface CourseDao {

    public List<CourseJoinDeptJoinTeacher> searchCourse(Map<String,Object> map);

    public List<CourseJoinDeptJoinTeacher> searchJoinedCourse(Map<String,Object> map);

}
