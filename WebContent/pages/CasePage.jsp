<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+ "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=path%>" >
<title>油储系统火灾爆炸信息网</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="images/main.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="js/jquery.min.js" ></script>
<script language="javascript" src="js/bootstrap.min.js"></script>
<script language="javascript" src="js/bootstrap-paginator.min.js"></script>
</head>
<body>
<div class="mainpage" >

<!--header:Start-->
<div class="wrapper" id="header">
 <div class="inner">
  <div class="logo"><img src="images/image_02.jpg" width="571" /></div> 
  <div class="search">
      <span><a href="#" class="white">登录后台</a></span>|<a href="#" class="white">联系我们</a></td>
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
    <div class="listtt" id="caseALL"><span>经典案例 </span></div>
     <div class="lists">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr><td class="list" id="caseChina">国内案例</td></tr>
          <tr><td class="list" id="caseOther">国外案例</td></tr>
          </table>
     </div>
   </div><!--end listmenu-->
   <div class="listcol">     
     <div class="name" id="casepagetitle">国内外案例</div>   
     <div class="listbox">
      <div class="entry" id="entry">
        <table id="casepagelist" class="nplist">
         </table>
      </div>
   </div>  
      <div class="container">
      <ul id="pageTab" style="margin: auto 10px"></ul>
	  </div>
        
   </div><!--end listcol-->
   <div class="clear"></div> 
</div>
</div>
<!--//contenter:End-->
<div id="footer" >  
  <p>版权所有：大连海事大学　地址：辽宁省大连市甘井子区凌水路一号 </p>
</div>
<!--//footer:End-->
</div>
</body>
<script language="javascript" src="js/script.js" ></script>
<script>
//渲染完就执行
$(function(){
	//生成底部分页栏
  $("#pageTab").bootstrapPaginator(options);     
	buildTable(1,PAGESIZE,"caseALL");//默认空白查全部
 });
var PAGESIZE = 8;
var options = {  
  currentPage: 1,  //当前页数
  numberOfPages:10,//是分页按钮可见的最多数
  totalPages: 20,  //总页数，这里只是暂时的，后头会根据查出来的条件进行更改
  size:"normal",  
  alignment:"center",  
  itemTexts: function (type, page, current) {  
      switch (type) {  
          case "first":  
              return "第一页";  
          case "prev":  
              return "上一页";  
          case "next":  
              return "下一页";  
          case "last":  
              return "最后页";  
          case "page":  
              return  page;  
      }                 
  },  
  onPageClicked: function (e, originalEvent, type, page) { 
  	buildTable(page,PAGESIZE,"caseALL"); //默认每页最多10条
  }  
}  

//生成表格
function buildTable(pageNumber,pageSize,country) {
   var reqParams = {'pageNumber':pageNumber,'pageSize':pageSize,"casecountry":country};//请求数据
   $(function () {   
   	  $.ajax({
   	        type:"POST",
   	        url:"<%=request.getContextPath()%>/casePageServlet",
   	        data:reqParams,
   	        dataType:"json",
   	        success: function(data){
   	        	//alert(data.pageNo);
   	        	//alert(data.dataList.length);
   	            /* if(data.isError == false) { */
   	           // options.totalPages = data.pages;
   	       var dataList = data.dataList;
   // $("#newspagelist").empty();//清空表格内容
    if (dataList.length > 0 ) {
  	  var str;
  	  for(var i=0; i < dataList.length; i++) {  
        	   var id = dataList[i].id;
        	   //alert(id);
        	   var title = dataList[i].title;
        	   var date = dataList[i].date;
        	   str += "<tr><td><a target='_blank' href='<%=request.getContextPath()%>/pageServlet?news_id="+id+"' style='font-size:14px;'>"+title+"</a></td><td>"+date+"</td></tr>";
           }  
  	  $("#casepagelist").html(str);  
     }else {  // dataList.length > 0 不成立          	            	
	          $("#casepagelist").html('<tr><td><center>查询无数据</center></td></tr>');
	      }
       
   	        var newoptions = {  
              currentPage: data.pageNo==1?1:data.pageNo,  //当前页数	
              totalPages: data.pages==0?1:data.pages,  //总页数
              size:"normal",  
              alignment:"center",  
              itemTexts: function (type, page, current) {  
              switch (type) {  
                  case "first":  
                  return "第一页";  
                  case "prev":  
                  return "上一页";  
                  case "next":  
                  return "下一页";  
                  case "last":  
                  return "最后页";  
              case "page":  
              return  page;  
                 }                 
                }, //itemTexts结束 
               onPageClicked: function (e, originalEvent, type, page) {  
  	          buildTable(page,PAGESIZE,country); //默认每页最多10条
                 }  
           }  //newoptions结束            	           
         $('#pageTab').bootstrapPaginator("setOptions",newoptions); //重新设置总页面数目
    
     		/*}
   	      else{//if(data.isError == true)
   	          alert(data.errorMsg);
   	          alert("hi");
   	            } */
   	      },   // success结束
   	        error: function(e){
   	           alert("查询失败:" + e);
   	        }
   	    });// ajax结束
     }); //  $(function)结束
} //buildtable结束
$(".list,.listtt").click(function(){
  var casecountry=$(this).attr("id");
  var casetitle=$(this).html();
  $("#casepagetitle").html(casetitle);
//生成底部分页栏
  $("#pageTab").bootstrapPaginator(options);     
	buildTable(1,PAGESIZE,casecountry);//默认空白查全部
});  
</script>
</html>