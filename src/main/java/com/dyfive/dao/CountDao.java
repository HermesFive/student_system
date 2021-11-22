package com.dyfive.dao;

import org.apache.ibatis.annotations.Param;

public interface CountDao {
    public int userTypeCount(@Param("type") String type);


}
