
$(document).ready(function(){
	var navstr = "<ul><li><a href='pages/main.jsp' target='_blank'>首页</a></li><li><a href='pages/NewsPage.jsp' target='_blank'>新闻动态</a></li><li><a href='pages/CasePage.jsp' target='_blank'>经典案例</a></li><li><a href='pages/SearchPage.jsp'  target='_blank'>案例搜索</a></li><li><a href='pages/StatisticPage.jsp'  target='_blank'>统计数据</a></li></ul></div>"	
		$(".nav").html(navstr);


	//banner幻灯
 var slidestyle=1;   //0：显隐变换，1：左右轮换，2：上下轮换
 var ITimes=5000;  //轮换时间
 var $banner_slide_inner=$("#banner_slide_inner");
 if($banner_slide_inner.size()=="0"){return;}
 var $li=$banner_slide_inner.children("li");
 var nums=$li.size();
 if(nums==0){return;}
 var ItemWidth=0,ItemHeight=0;
 var screenwidth=parseInt($(document).width());
 var startleft=0;
 var panelhtml="";
 for(i=0;i<nums;i++)
  {
    panelhtml+="<span></span>";
  }
 panelhtml="<div class='panel' id='banner_panel'>"+panelhtml+"</div>";
 $banner_slide_inner.before(panelhtml);
 var $panel=$("#banner_panel");
 var $baritem=$panel.children("span");
 var currentnum=0;
 $baritem.eq(0).addClass("current");
 if(slidestyle==0)
  {  
   $li.eq(0).siblings("li").hide();
  }
 else if(slidestyle==1)
  {
    $li.addClass("zy_move");
    ItemWidth=parseInt($li.eq(0).css("width").replace("px",""));
    $banner_slide_inner.css({"width":ItemWidth*nums+"px"});
    startleft=-1*parseInt((ItemWidth-screenwidth)/2);
    if(startleft>0){startleft=0;}
    $banner_slide_inner.css({"margin-left":startleft+"px"});
  }
 else
  {
    ItemHeight=parseInt($li.eq(0).css("height").replace("px",""));
    $banner_slide_inner.css({"position":"absolute","height":"auto"});
    $li.addClass("sx_move");
  }

  function ShowNum(num) 
    {
      if(num<0){num=nums-1;}
      if(num>(nums-1)){num=0;}
      $baritem.eq(currentnum).removeClass("current");
      if(slidestyle==0)
      { 
       $li.eq(currentnum).removeClass("current");
       $li.eq(num).addClass("current");
       $li.eq(num).fadeIn(1000,function(){$(this).siblings("li").hide();});
      }
     else if(slidestyle==1)
      {
       $banner_slide_inner.animate({marginLeft:(-1*num*ItemWidth)+startleft+'px'});
      }
     else
      {
       $banner_slide_inner.animate({top:(-1*num*ItemHeight)+'px'});
      }
     $baritem.eq(num).addClass("current");
     currentnum=num;
    };
  
  $baritem.each(function(i){
    $(this).click(function(){
       $li.eq(currentnum).stop(true,true);
       ShowNum(i);
    });
  });

   var it=setInterval(function(){ShowNum(currentnum+1)},ITimes);
   $("#banner_slide").mouseenter(function(){
        clearInterval(it);
    });
   $("#banner_slide").mouseleave(function(){
       it=setInterval(function(){ShowNum(currentnum+1)},ITimes);
    });

  $(window).resize(function(){
    screenwidth=parseInt($(document).width());
    startleft=-1*parseInt((ItemWidth-screenwidth)/2);
  });



function AddFavorite(sURL, sTitle) 
 {
   sURL = encodeURI(sURL);
        try{
        window.external.addFavorite(sURL, sTitle);  
         }
       catch(e) 
         {  
           try{  
               window.sidebar.addPanel(sTitle, sURL, "");  
 
            }
          catch (e) 
            {  
             alert("加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置.");
            }  
         }
    }

function SetHome(url)
{
 if(document.all)
  {
    document.body.style.behavior='url(#default#homepage)';
    document.body.setHomePage(url);
  }
 else
  {
   alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
  }
 }

});

