package com.Controller;

import com.Service.LogisterService;
import com.alibaba.fastjson.JSONObject;
import com.pojo.User;
import jdk.nashorn.internal.ir.RuntimeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@Controller
@RequestMapping("")
public class LogisterController {

    @Autowired
    @Qualifier("logisterService")
    LogisterService logisterService;

    @RequestMapping("logister")
    public void logisterTest(HttpServletRequest request, HttpServletResponse response) throws Exception{

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String userName=request.getParameter("userName");
        String userPhone=request.getParameter("userPhone");
        String loginPassword=request.getParameter("userPassword");

        User newUser = new User(userName,userPhone,loginPassword);
        String result = logisterService.logisterCheck(newUser);
        if (result.equals("success")){
            request.getSession().setAttribute("loginUser",newUser.getUser_name());
        }
        JSONObject jsonobj = new JSONObject();
        jsonobj.put("status",result);
        response.setContentType("application/x-json");
        PrintWriter out = response.getWriter();
        out.write(jsonobj.toString());
    }

}
