package com.dyfive.dao;

import com.dyfive.entity.Department;
import org.apache.ibatis.annotations.Param;

import java.util.*;

public interface DeptDao {

    public List<String> getDeptName();

    public Department selectByDeptName(@Param("deptName") String deptName);


}
