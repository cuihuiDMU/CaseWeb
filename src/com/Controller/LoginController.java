package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.Administrator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.User;
import com.Service.LoginService;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("")
public class LoginController {
    @Autowired
    @Qualifier("LoginServiceImpl")
    LoginService loginService;

    @RequestMapping("login")
    public void loginTest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String loginName=request.getParameter("loginName");
        String loginPassword=request.getParameter("loginPassword");
        System.out.println(loginName+" "+loginPassword);
        User user = null;
        String userpass = "";

        String status = "";
        if(loginName != null && !loginName.equals(""))
        {
            if(loginPassword != null && !loginName.equals("")){
                user = loginService.getPass(loginName);
                if(user == null)
                {
                    status = "用户名不存在";
                }else{
                    userpass = user.getUser_password();
                    //String loginPass = com.controller.MD5Util.getCryptogram(loginPassword);
                    System.out.println(loginPassword);
                    status = LoginController.isSame(userpass, loginPassword);
                    if(status.equals("success")){
                        request.getSession().setAttribute("loginUser",user.getUser_name());
                    }
                }
            }else{
                status = "请输入密码";
            }
        }else{
            status = "请输入用户名";
        }
        JSONObject jsonobj = new JSONObject();
        jsonobj.put("status",status);
        response.setContentType("application/x-json");
        PrintWriter out = response.getWriter();
        out.write(jsonobj.toString());

    }

    public static String isSame(String pass, String loginPass){
        if(pass.equals(loginPass)){
            return "success";
        }
        return "用户名密码不一致";

    }
    @RequestMapping("adminiLogin")
    public void adminiLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String loginName=request.getParameter("loginName");
        String loginPassword=request.getParameter("loginPassword");
        Administrator admin = null;
        String adminpass = "";
        String status = "";
        if(loginName != null && !loginName.equals(""))
        {
            if(loginPassword != null && !loginName.equals("")){
                admin = loginService.adminLogin(loginName);
                if(admin == null)
                {
                    status = "请确认管理员账号是否正确！";
                }else{
                    adminpass = admin.getAdmin_password();
                    //String loginPass = com.controller.MD5Util.getCryptogram(loginPassword);
                    System.out.println(loginPassword);
                    status = LoginController.isSame(adminpass, loginPassword);
                    if(status.equals("success")){
                        request.getSession().setAttribute("loginUser",admin.getAdmin_name());
                    }
                }
            }else{
                status = "请输入密码";
            }
        }else{
            status = "请输入用户名";
        }
        JSONObject jsonobj = new JSONObject();
        jsonobj.put("status",status);
        response.setContentType("application/x-json");
        PrintWriter out = response.getWriter();
        out.write(jsonobj.toString());

    }


    @RequestMapping("OutServlet")
    public void outSession(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //false代表：不创建session对象，只是从request中获取。
        HttpSession session = request.getSession(false);
        if(session==null){
            return;
        }
        session.removeAttribute("loginUser");
        String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/main.jsp";
        System.out.println(url);
        response.sendRedirect(url);
    }
}

