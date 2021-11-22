package com.dyfive.services;

import com.dyfive.dao.DeptDao;
import com.dyfive.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServices {

    @Autowired
    private DeptDao deptDao;

    public List<String> getDeptName(){
        return deptDao.getDeptName();
    }

    public Department selectByDeptName(String name){
        return deptDao.selectByDeptName(name);
    }

}
