<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+ "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=path%>" >
<title>案例网</title>
<meta name="keywords" content="油储火灾案例，油气火灾案例，应急事故，化学品事故，应急救援" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="images/main.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="js/jquery.min.js" ></script>
<script language="javascript" src="js/jquery.form.js"></script>
<script language="javascript" src="My97DatePicker/WdatePicker.js" ></script>
<script language="javascript"> 
function createTime(){ 
	WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'2010-10-01',maxDate:'2012-10-01'}); }
</script> 
</head>
<body>
<div class="mainpage" >
<!--header:Start-->
<div class="wrapper" id="header">
 <div class="inner">
  <div class="logo"></div> 
  <div class="search">
    <span><a href="#" class="white">登录后台</a></span>|<a href="#" class="white">联系我们</a>
  </div> 
</div>
</div>
<!--//header:End-->
<div class="clear"></div>

<!--contenter:Start-->
<div class="wrapper" id="contenter">
 <div class="inner">
 <div class="nav"></div>
   
   <div class="listmenu">
     <div class="listtt"><span>案例搜索</span></div>
     <div class="lists">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr><td class="list">搜索框</td></tr>
          </table>
     </div>
   </div><!--end listmenu-->
   <div class="listcol">     
     <div class="map"></div>
     <div class="name">案例搜索</div>   
     <div class="listbox">
      <div class="entry">
      <div style="width: 800px; margin: 0 auto; font-family: '华文中宋'; font-size:20px;">  
      <form id="formSearch">  
             	<table width="660" align="center">
             	<tr><td width="218" height="50" align="center" valign="middle">事故地点</td>
             	<td style="width:100px;">
             	<select id="countrySelect" class="countrySelect" name="country"  style="width: auto;">
             		<option value="">———选择国内外———</option>
 					<option value="China">国内</option>
					<option value="Other">国外</option>
				</select>
             	</td>
             	<td>
             	<select id="citySelect" name="city">
             		<option value="">———选择国家/省份———</option>
				</select>
             	</td>
             	</tr>
             	<tr>
             	<td width="218" height="50" align="center" valign="middle">事故时间  </td>
             	<td>
             	<input type="text" id="caseTimefrom" style="width:234px" name="caseTimefrom" onFocus="WdatePicker({isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd'})"/></td>
             	
             	<td>
             	<label style="width:23px">到</label><input type="text" id="caseTimeto" style="width:234px" name="caseTimeto" onFocus="WdatePicker({isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd'})" /> 
             	</td></tr>
             	<tr>
             	<td width="218" height="50" align="center" >事故名称</td>
             	<td><input name="caseName" type="text" class="caseNameSearch" id="caseNameSearch" style="width:100%; "> 
             	  <br/> 
                     <table id="poptable" style="position:absolute;"></table></td>
             	</tr>
             	<tr align="center" valign="middle"><td width="218" height="50"><input type="submit" id="caseSearch" class="caseSearch" value="搜索" /><br/></td></tr>
             </table> 
          </form>  
          <table id="caseSearchShow" class="caseSearchShow">
   		  </table>           
       </div>
       
       
    </div>
   </div>     
   </div><!--end listcol-->
   <div class="clear"></div> 
</div>
</div>
</div>
<!--//contenter:End-->

<div id="footer" >  
	<p>版权所有：大连海事大学　地址：辽宁省大连市甘井子区凌水路一号 </p>
</div>
<!--//footer:End-->
</body>
<script language="javascript" src="js/script.js" ></script>
<script>
$(".caseNameSearch").on("keyup focus", function() {
    var txt = document.getElementById("caseNameSearch").value;
    var sobj=document.getElementById("poptable");
    //alert(txt);
    //var casecountry=$(this).attr("id");
    $.ajax({
        type: "GET",
        dataType: "json",
        url: "<%=request.getContextPath()%>/titlePop?caseNameSearch="+encodeURI(encodeURI(txt)),
        success: function(json){
            sobj.innerHTML="";  
            var suggest="";  
                for(i=0;i<json.length;i++){  
              	  var title = json[i].title;
                    suggest+="<tr><td onmouseover='mouseoverchange(this)' onmouseout='mouseoutchange(this)'>"+title+"</tr></td>";  
                }  
                sobj.innerHTML=suggest;  
        }
    });
 });
$(".caseNameSearch").blur(function() {
    document.getElementById("poptable").innerHTML="";
    
 });
function mouseoverchange(x)
{
	 x.style.backgroundColor="background-color";
}
function mouseoutchange(x)
{
	 x.style.backgroundColor="#000000";
}

$(".caseNameSearch").blur(function(){
	 document.getElementById("poptable").innerHTML="";
 });

$(".countrySelect").change(function(){
    var country = document.getElementById("countrySelect").value;
    var citySelect="<option value=''>———选择国家/省份———</option>";
    if (country=="China")
    {
  	  var citySelect="<option value=''>————选择省份————</option>";
  	  var city=new Array("北京","上海","天津","重庆","河北","山西","辽宁","吉林","黑龙江","江苏","浙江","安徽","福建","江西","山东","河南","湖北","湖南","广东","海南","四川","贵州","云南","陕西","甘肃","青海","台湾","内蒙古","广西","西藏","宁夏","新疆","香港","澳门");
  	  for (i=0;i<city.length;i++)
  	  {
  		  citySelect+='<option value="'+city[i]+'">'+city[i]+'</option>';
  	  }
  	  
  	  document.getElementById("citySelect").innerHTML=citySelect;
    }
      else if(country=="Other")
    {
    	var citySelect="<option value=''>————选择国家————</option>";
    	 $.ajax({
	          type: "GET",
	          dataType: "json",
	          url: "<%=request.getContextPath()%>/countryPop",
	          success: function(jsonCountry){
	                  for(i=0;i<jsonCountry.length;i++){  
	                	  var country = jsonCountry[i].country;
	                	  citySelect+="<option value='"+country+"'>"+country+"</option>"; 
	                     }
	                  //alert(citySelect);
	                document.getElementById("citySelect").innerHTML=citySelect;
	                }//success结束
	      });//ajax结束
     }//else if 结束
   // $("#citySelect").html(citySelect);
 });
$("#formSearch").submit(function() {
	 // alert($(this).serialize());
	 var caseSearchShow = document.getElementById("caseSearchShow");
	  $(this).ajaxSubmit({
         type: 'post', // 提交方式 get/post
         url: '<%=request.getContextPath()%>/search', // 需要提交的 url
         data:$(this).serialize(),
         dataType: "json",
         success: function(data) 
         {var str = "";
         for(var i=0; i < data.length; i++) {  
      	   var id = data[i].id;
      	   var title = data[i].title;
      	   str += "<tr><td><a target='_blank' href='<%=request.getContextPath()%>/pageServlet?news_id="+id+"'>"+title+"</a></td></tr>";
      	  
         $(this).resetForm();
         } // 提交后重置表单
         caseSearchShow.innerHTML=str;
         }
         });
	  return false;
	});
</script>
</html>