<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+ "/";
%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=path%>" >
<title>案例网</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="油储火灾案例，油气火灾案例，应急事故，化学品事故，应急救援" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<link href="images/main.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="js/jquery.min.js" ></script>
<%
	String title = (String)request.getAttribute("title");
	String site = (String)request.getAttribute("site");
	String date = (String)request.getAttribute("date");
	String brief = (String)request.getAttribute("brief");
	String losses = (String)request.getAttribute("losses");
	String info = (String)request.getAttribute("info");
	String secondary = (String)request.getAttribute("secondary");
	String ISM = (String)request.getAttribute("ISM");
	String ISM_figure = (String)request.getAttribute("ISM_figure");
	String faulttree = (String)request.getAttribute("faulttree");
	String faulttree_figure = (String)request.getAttribute("faulttree_figure");
%>
</head>
<body>

<div class="mainpage" >
<!--header:Start-->
<div class="wrapper" id="header">
 <div class="inner">
  <div class="logo"></div> 
  <div class="search">
    <div class="white">
      <span><a href="#" class="white">联系我们</a></span>|<a href="#" class="white">管理员入口</a>
    </div>
  </div> 
</div>
</div>
<!--//header:End-->

<div class="clear"></div>

<!--contenter:Start-->
<div class="wrapper" id="contenter">
 <div class="inner">
 <div class="nav"></div>
<!--    <div class="lay1"><img src="images/image_07.jpg" /></div>  
  <div style="margin-top:5px;"></div> -->
   <div class="listmenu" style="width:208px; text-align:center;">
     <div class="listtt" id="newsALL" ><span>新闻要点 </span></div>
     <div class="lists">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr><td class="list">事故简介</td></tr>
          <tr><td class="list">事故损失</td></tr>
          <tr><td class="list">事故信息</td></tr>
          <tr><td class="list">二次事故</td></tr>
          </table>
     </div>
     <div class="listtt" id="analysislist" ><span>案例分析 </span></div>
     <div class="lists">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr><td class="list">二次事故</td></tr>
          <tr><td class="list">ISM分析</td></tr>
          <tr><td class="list" id="faulttreeAnalysis">故障树分析</td></tr>
          <tr><td class="list" id="bayesianAnalysis">贝叶斯分析</td></tr>
          </table>
     </div>
   </div>
            <!-- ***************右侧正文****************** -->
   <div class="listcol">     
     <h1 class="artitle"><%=title %></h1>
  <div class="infobox">
   <div class="pagediv">
   <table class="pagetable" id="pagetable">
          <tr><td class="pagetableleft">时间</td><td class="" width="35%" style="text-align:center;"><%=date %></td><td class="pagetableleft">地点</td><td class="" width="35%" style="text-align:center;"><%=site %></td></tr>
          <tr><td class="pagetableleft" >事故简介</td><td class="" colspan ="3"><%=brief %></td></tr>
          <tr><td class="pagetableleft" >事故损失</td><td class="" colspan ="3"><%=losses %></td></tr>
          <tr><td class="pagetableleft" >事故信息</td><td class="" colspan ="3"><%=info %></td></tr>
          <tr><td class="pagetableleft" >二次事故</td><td class="" colspan ="3"><%=secondary %></td></tr>
          </table>
   </div>
  </div>
  <div style="text-align:center;"><a href="javascript:window.opener=null;window.open('','_self');window.close();">【关闭页面】</a></div>
  </div><!--end listcol-->
            <!-- ***************右侧正文****************** -->
   </div>
   
   <div class="clear"></div> 
</div>
</div>
<!--//contenter:End-->

<div id="footer" >  
	<p>版权所有：大连海事大学　地址：辽宁省大连市甘井子区凌水路一号 </p>
</div>
<!--//footer:End-->
</body>
<script language="javascript" src="js/script.js" ></script>
<script language="javascript">
$("#analysislist").click(function(){
   var pagetable="";
   pagetable = "<tr><td class='pagetableleft' >ISM结构</td><td><%=ISM %></td></tr>";
   pagetable+="<tr><td class='pagetableleft' >ISM模型</td><td><img src='<%=ISM_figure %>'></td></tr>";
    document.getElementById("pagetable").innerHTML=pagetable;
 });
$("#faulttreeAnalysis").click(function(){
	   var pagetable="";
	   pagetable+="<tr><td class='pagetableleft' >故障树分析</td><td><%=faulttree %></td></tr>";
	   pagetable+="<tr><td class='pagetableleft' >故障树模型</td><td><img src='<%=faulttree_figure %>'></td></tr>"; 
	    document.getElementById("pagetable").innerHTML=pagetable;
	 });

$("#bayesianAnalysis").click(function(){
	   var pagetable="";
	   pagetable+="<tr><td class='pagetableleft' >贝叶斯分析</td><td><%=faulttree %></td></tr>";
	   pagetable+="<tr><td class='pagetableleft' >故障树模型</td><td><img src='<%=faulttree_figure %>'></td></tr>"; 
	    document.getElementById("pagetable").innerHTML=pagetable;
	 });
$("#newsALL").click(function(){
	   var newsALL;
	   newsALL="<tr><td class='pagetableleft'>时间</td><td width='35%' style='text-align:center;'><%=date%></td>";
	   newsALL+="<td class='pagetableleft'>地点</td><td width='35%' style='text-align:center;'><%=site %></td></tr>";
	   newsALL+="<tr><td class='pagetableleft' >事故简介</td><td class='' colspan ='3'><%=brief %></td></tr>";
	   newsALL+="<tr><td class='pagetableleft' >事故损失</td><td colspan ='3'><%=losses %></td></tr>";
	   newsALL+="<tr><td class='pagetableleft' >事故信息</td><td colspan ='3'><%=info %></td></tr>";
	   newsALL+="<tr><td class='pagetableleft' >二次事故</td><td colspan ='3'><%=secondary %></td></tr>";
	   
	    document.getElementById("pagetable").innerHTML=newsALL;
	 });
</script>
</html>