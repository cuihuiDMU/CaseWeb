<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+ "/";

    String sess = (String)request.getSession().getAttribute("loginUser");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=path%>" >
<title>油储系统火灾爆炸信息网</title>
<meta name="keywords" content="油储火灾案例，油气火灾案例，应急事故，化学品事故，应急救援" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="images/main.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="js/jquery.min.js" ></script>
</head>
<body>
<div class="mainpage" >

<!--header:Start-->
<div class="wrapper" id="header">
 <div class="inner">
  <div class="logo"></div> 
  <div class="search">
  </div>
</div>
</div>
<!--//header:End-->
<div class="clear"></div>

<!--contenter:Start-->
<div class="wrapper" id="contenter">
 <div class="inner">
 <div class="nav"></div>
 <div class="lay1"> 
 <div id="banner_slide">
    <ul id="banner_slide_inner" >
    <li style="background-image:url(images/f.jpg)"><a href="#"></a></li>
    <li style="background-image:url(images/ff.jpg)"><a href="#"></a></li>
    <li style="background-image:url(images/fff.jpg)"><a href="#"></a></li>
    <li style="background-image:url(images/ffff.jpg)"><a href="#"></a></li>
    <li style="background-image:url(images/6.jpg)"><a href="#"></a></li>   
    </ul>
 </div> 
 <div class="solid-hover"><img src="images/hover.png"></div>
 <div class="solid-hover2"><div class="tit"><span>2017山东临沂金誉石化有限公司爆炸着火事故</span></div></div>
 </div><!--//lay1:End-->
 <div class="lay3">
    <div class="lf">
     <div class="pd11">
      <div class="tt">
      <div class="tit"><span>
      		<a href="#" class="newslist" id="newsALL">新闻动态 ></a>
			<a href="#" class="newslist" id="newsChina">国内动态 |</a>
			<a href="#" class="newslist" id="newsOther">国外动态</a></span>
	  </div><div class="more"></div></div>
      <div class="con">
      <table id="newsTable" width="100%" border="0" cellspacing="0" cellpadding="0">      
      </table>
      </div>
     </div>
    </div>
    <div class="rt">
     <div class="pd11">
      <div class="tt">
      <div class="tit"><span>
		<a href="#" class="caselist" id="caseALL">经典案例 ></a>
		<a href="#" class="caselist" id="caseChina">国内案例 |</a>
		<a href="#" class="caselist" id="caseOther">国外案例</a></span>
	  </div><div class="more"></div></div>
      <div class="con">
		 <table id="caseTable" width="100%" border="0" cellspacing="0" cellpadding="0"></table>
	  </div>
     </div>
    </div>
    <div class="clear"></div>
 </div><!--// lay3:End -->

 </div>
</div>
<!--//contenter:End-->
</div>
<!--end mainpage-->
<div id="footer" >  
  <p>版权所有：大连海事大学　地址：辽宁省大连市甘井子区凌水路一号 </p>
</div>
<!--//footer:End-->
</body>
<script language="javascript" src="js/script.js" ></script>
<script>
$(document).ready(function(){
    //var userLogin = "<%=sess %>";
    if("<%=sess %>" == "null"){
        $(".search").html("<span><a href='pages/login.jsp' class='white'>登录</a></span>|<a href='pages/userLogister.jsp' class='white'>注册</a>|<a href='pages/administrator.jsp' class='white'>管理员登录</a>");
    }else {
        $(".search").html("<span>欢迎你，<%=sess %></span>|<a href='OutServlet' class='white'>退出登录</a>");
    }
    //首页动态加载统计结果和分析结果




$.get("<%=request.getContextPath()%>/loadServlet",function back(json){
	var jsonleft = json[0];
	var jsonright = json[1];
	var strleft = "";
	var strright = "";
  	  for(var a=0; a < jsonleft.length; a++)
     	{
     	 var id = jsonleft[a].id;
       	 var title = jsonleft[a].title;
       	 var date = jsonleft[a].date;
       	  strleft += "<tr><td><a target='_blank' href='<%=request.getContextPath()%>/pageServlet?news_id="+id+"'>"+title+"</a></td><td>"+date+"</td></tr>";
     	 }
  	  for(var b=0; b < jsonright.length; b++)
 	    {
 	     var id = jsonright[b].id;
   	     var title = jsonright[b].title;
   	  	 var date = jsonright[b].date;
   	  		strright += "<tr><td><a target='_blank' href='<%=request.getContextPath()%>/pageServlet?news_id="+id+"'>"+title+"</a></td><td>"+date+"</td></tr>";
 	     }
	 $("#newsTable").html(strleft);
	 $("#caseTable").html(strright);
	});

});

$(".newslist").mouseover(function(){
    var newsTable = document.getElementById("newsTable");
    var newscountry=$(this).attr("id");
    $.ajax({
        type: "GET",
        dataType: "json",
        url: "<%=request.getContextPath()%>/newsServlet?newscountry="+newscountry,
        success: function(json){
              var str = "";
              for(var i=0; i < json.length; i++) {  
           	   var id = json[i].id;
           	   var title = json[i].title;
           	   var date = json[i].date;
           	   str += "<tr><td><a target='_blank' href='<%=request.getContextPath()%>/pageServlet?news_id="+id+"'>"+title+"</a></td><td>"+date+"</td></tr>";
              }  
              newsTable.innerHTML=str;  
        }
    });
 }); 
 $(".caselist").mouseover(function(){
     var caseTable = document.getElementById("caseTable");
     var casecountry=$(this).attr("id");
     $.ajax({
         type: "GET",
         dataType: "json",
         url: "<%=request.getContextPath()%>/caseServlet?casecountry="+casecountry,
         success: function(json){
               var str = "";
               for(var i=0; i < json.length; i++) {
            	   var id = json[i].id;
            	   var title = json[i].title;
               	   var date = json[i].date;
				   str += "<tr><td><a target='_blank' href='<%=request.getContextPath()%>/pageServlet?news_id="+id+"'>"+title+"</a></td><td>"+date+"</td></tr>";
               }  
               caseTable.innerHTML=str;  
         }
     });
  });

</script>
</html>