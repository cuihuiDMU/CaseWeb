package com.Service.Impl;
import java.util.ArrayList;
import java.util.List;

import com.Service.LoginService;
import com.pojo.Administrator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.UserMapper;
import com.pojo.User;
@Service("LoginServiceImpl")
public class LoginServiceImpl implements LoginService {

    @Autowired
    UserMapper userMapper;


    public User getPass(String user_name) {
        User user = userMapper.getPass(user_name);
        if(user!=null){
            return user;
        }else{
            return null;
        }
    }

    public Administrator adminLogin(String admin_name) {
        Administrator admin = userMapper.adminLogin(admin_name);
        if(admin!=null){
            return admin;
        }else{
            return null;
        }
    }



}
