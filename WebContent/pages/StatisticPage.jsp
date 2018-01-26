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
<meta name="keywords" content="油储火灾案例，油气火灾案例，应急事故，化学品事故，应急救援" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="images/main.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="js/jquery.min.js" ></script>
<script language="javascript" src="js/echarts.min.js" ></script>
<script language="javascript" src="js/macarons.js" ></script>
<script type="text/javascript" src="js/china.js"></script>
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
     <div class="listtt"><span>事故统计分析</span></div>
     <div class="lists">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr><td class="list">重特大事件比例图</td></tr>
          <tr><td class="list">事故伤亡人数分布</td></tr>
          <tr><td class="list">各省市事故起数分布</td></tr>
          <tr><td class="list">年典型事故起数分布</td></tr>
          </table>
     </div>
   </div><!--end listmenu-->
   <div class="listcol">     
     <div class="map"></div>
     <div class="name" id="statistictitle">事故统计分析</div>   
     
     <div class="listbox">
      <div class="entry" id="ent">
		<div id="ratiofig" class="fig" style="width:80%; height:350px; float:left; margin-left:5%; border-bottom:30px solid #ffffff;"></div>
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
$(".listtt,.list").click(function(){
    var statistictitle=$(this).html();
    $("#statistictitle").html(statistictitle);
    $.ajax({
        success: function(){
        	var id;
        	switch(statistictitle)
            {
            case "重特大事件比例图": id="ratiofig"; break;
            case "事故伤亡人数分布": id="casualtyfig"; break;
            case "各省市事故起数分布": id="cityfig"; break;
            case "年典型事故起数分布": id="yearfig"; break;
            }
        	var str = "<div id="+id+" class='fig' style='width:80%; height:350px; float:left; margin-left:5%; border-bottom:30px solid #ffffff;'></div>";
        	var ent = document.getElementById("ent");
        	ent.innerHTML=str;
        	switch(id)
            {
            case "ratiofig": 
            	var ratiofig = echarts.init(document.getElementById('ratiofig'));
            	ratiofig.setOption(option1);
            	break;
            case "casualtyfig": 
            	var casualtyfig = echarts.init(document.getElementById('casualtyfig'));
            	casualtyfig.setOption(option2);
            	break;
            case "cityfig": 
            	var cityfig = echarts.init(document.getElementById('cityfig'));
            	cityfig.setOption(option3);
            	break;
            case "yearfig": 
            	var yearfig = echarts.init(document.getElementById('yearfig'));
            	yearfig.setOption(option4);
            	break;
            }
        }
    });
    //$("#entry").html(str);
});
var ratiofig = echarts.init(document.getElementById('ratiofig'));	
option1 = {
	    title : {
	        text: '重大事件比例',
	        subtext: '1971-2017',
	        x:'center'
	    },
	    tooltip : {
	        trigger: 'item',
	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    },
	    legend: {
	        orient : 'vertical',
	        x : 'left',
	        data:['重特大事故','重大事故','一般事故']
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            mark : {show: true},
	            dataView : {show: true, readOnly: false},
	            magicType : {
	                show: true, 
	                type: ['pie', 'funnel'],
	                option: {
	                    funnel: {
	                        x: '80%',
	                        width: '80%',
	                        funnelAlign: 'left',
	                        max: 1548
	                    }
	                }
	            },
	            restore : {show: true},
	            saveAsImage : {show: true}
	        }
	    },
	    calculable : true,
	    series : [
	        {
	            name:'访问来源',
	            type:'pie',
	            radius : '65%',
	            center: ['50%', '50%'],
	            data:[
	                {value:15, name:'重特大事故'},
	                {value:35, name:'重大事故'},
	                {value:65, name:'一般事故'}
	            ]
	        }
	    ]
	};
	 ratiofig.setOption(option1);
	</script>
	<script>
	// var casualtyfig = echarts.init(document.getElementById('casualtyfig'));
	option2 = {
			title : {
		        text: '事故伤亡人数分布',
		        subtext: '1971-2017',
		        x:'left',
		        y:'top'
		    },
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		    	x:'center',
		        data:['重特大事故','重大事故','一般事故']
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : ['1971','1981','1991','2001','2011','2017']
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'重特大事故',
		            type:'line',
		            stack: '总量',
		            data:[120, 132, 101, 134, 90, 230]
		        },
		        {
		            name:'重大事故',
		            type:'line',
		            stack: '总量',
		            data:[220, 182, 191, 234, 290, 330]
		        },
		        {
		            name:'一般事故',
		            type:'line',
		            stack: '总量',
		            data:[820, 932, 901, 934, 1290, 1330]
		        }
		    ]
		};
	option3 = {
		    title: {
		        text: '各地区事故分布',
		        left: 'center'
		    },
		    tooltip: {
		        trigger: 'item'
		    },
		    visualMap: {
		        min: 0,
		        max: 100,
		        left: 'left',
		        top: 'bottom',
		        text: ['高','低'],           // 文本，默认为数值文本
		        calculable: true
		    },
		    toolbox: {
		        show: true,
		        orient: 'vertical',
		        left: 'right',
		        top: 'center',
		        feature: {
		            dataView: {readOnly: false},
		            restore: {},
		            saveAsImage: {}
		        }
		   	 },
			    series: [
					{
		            name: '数量',
		            type: 'map',
		            mapType: 'china',
		            zoom:1.1,
		            roam: false,
		            label: {
		                normal: {
		                    show: true
		                },
		                emphasis: {
		                    show: true
		                }
		            },
		            data:[
						{name: '北京',value: 2},
						{name: '天津',value: 2},
						{name: '河北',value: 3},
						{name: '山西',value: 4},
						{name: '内蒙古',value: 9},
						{name: '辽宁',value: 27},
						{name: '吉林',value: 16},
						{name: '黑龙江',value: 10},
						{name: '上海',value: 9},
						{name: '江苏',value: 15},
						{name: '浙江',value: 9},
						{name: '安徽',value: 15},
						{name: '福建',value: 10},
						{name: '江西',value: 12},
						{name: '山东',value: 35},
						{name: '河南',value: 13},
						{name: '湖北',value: 11},
						{name: '湖南',value: 11},
						{name: '广东',value: 1},
						{name: '广西',value: 1},
						{name: '海南',value: 3},
						{name: '重庆',value: 1},
						{name: '四川',value: 3},
						{name: '贵州',value: 4},
						{name: '云南',value: 3},
						{name: '西藏',value: 2},
						{name: '陕西',value: 4},
						{name: '甘肃',value: 8},
						{name: '青海',value: 5},
						{name: '宁夏',value: 7},
						{name: '新疆',value: 14},
						{name: '台湾',value: 1},
						{name: '香港',value: 1},
						{name: '澳门',value: 8}
		            ]
		        }
		    ]
		};
		option4 = {
			    title : {
			        text: '年典型事故起数',
			        subtext: '1971-2017'
			    },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['重特大事故','重大事故','一般事故']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			            data : ['1971','1976','1981','1986','1991','1996','2001','2006','2011','2015','2017']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'重特大事故',
			            type:'bar',
			            data:[4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'重大事故',
			            type:'bar',
			            data:[4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'一般事故',
			            type:'bar',
			            data:[5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
			            markPoint : {
			                data : [
			                    {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183, symbolSize:18},
			                    {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name : '平均值'}
			                ]
			            }
			        }
			    ]
			};
	</script>
</html>
