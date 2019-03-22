package com.mapper;

import java.util.List;

import com.pojo.Administrator;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.pojo.User;

@Repository
public interface UserMapper {


    public User getPass(@Param("name")String user_name);

    public Administrator adminLogin(@Param("name")String admin_name);

    public int userAdd(User user);

    public User getPhone(@Param("phone")String user_phone);

}

