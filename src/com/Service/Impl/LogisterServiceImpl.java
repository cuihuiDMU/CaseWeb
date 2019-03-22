package com.Service.Impl;

import com.Service.LogisterService;
import com.mapper.UserMapper;
import com.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("logisterService")
public class LogisterServiceImpl implements LogisterService{

    @Autowired
    UserMapper userMapper;

    @Override
    public String logisterCheck(User user) {
        User isUser = userMapper.getPass(user.getUser_name());
        if (isUser!=null){
            return "用户名已注册";
        }
        User isPhone = userMapper.getPhone(user.getPhone());
        if (isPhone!=null){
            return "手机号已经注册";
        }
        try {
            int isSuccess = userMapper.userAdd(user);
            if (isSuccess>0){
                return "success";
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("logisterCheck error!");
        }
        return "系统错误，请联系管理员";
    }

}
