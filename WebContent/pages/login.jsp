<%--
  Created by IntelliJ IDEA.
  User: HG
  Date: 2019/3/19
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="<%=basePath%>">
    <title>欢迎登陆录入系统</title>
    <link type="text/css" href="css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="css/bootstrap-responsive.min.css" rel="stylesheet">
    <link type="text/css" href="css/theme.css" rel="stylesheet">
    <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
    <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery.form.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                <i class="icon-reorder shaded"></i>
            </a>

            <p class="brand">欢迎登陆</p>

            <div class="nav-collapse collapse navbar-inverse-collapse">

            </div><!-- /.nav-collapse -->
        </div>
    </div><!-- /navbar-inner -->
</div><!-- /navbar -->



<div class="wrapper">
    <div class="container">
        <div class="row">
            <div class="module module-login span4 offset4">
                <form class="form-vertical" id="loginform">
                    <div class="module-head">
                        <h3>登陆</h3>
                    </div>
                    <div class="module-body">
                        <div class="control-group">
                            <div class="controls row-fluid">
                                <input class="span12" name="loginName" type="text" id="inputEmail" placeholder="用户名">
                            </div>
                        </div>

                        <div class="control-group" style="width:100%">
                            <div class="controls row-fluid">
                                <input class="span12" name="loginPassword" type="password" id="inputPassword" placeholder="密码 ">
                            </div>
                        </div>
                    </div>
                    <div class="module-foot">
                        <div class="control-group">
                            <div class="controls clearfix">
                                <button type="submit" class="btn btn-primary pull-right">登录</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div><!--/.wrapper-->

<div class="footer">
    <div class="container">
        <b class="copyright">&copy; 2018 CUIHUI</b> All rights reserved.
    </div>
</div>
<script>
    $(document).ready(function(){
        $("#loginform").submit(function() {
            formdata = $(this).serialize();
            console.log("in ");
            $(this).ajaxSubmit({
                type: "post",
                url:"<%=request.getContextPath()%>/login",
                data:formdata,
                dataType: "json",
                success: function(data){
                    if(data.status!="success"){
                        alert(data.status);
                    }else{
                        console.log("success is success");
                        window.location.href = "<%=request.getContextPath()%>/main.jsp";
                    }
                },   // success结束
                error: function(e){
                    alert("查询失败:" + e);
                }
            }); //ajaxsubmit结束
            return false;
        });  //submit结束

    });
</script>
</body>
</html>