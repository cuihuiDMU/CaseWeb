package com.Service;

import java.util.List;

import com.pojo.Administrator;
import org.springframework.stereotype.Service;

import com.pojo.User;

@Service
public interface LoginService {

    User getPass(String user_name);
    Administrator adminLogin(String admin_name);

}
