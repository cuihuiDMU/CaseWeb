
var Image_14=new Array();
var Pics="1.jpg|2.jpg|../images/3.jpg|../images/4.jpg";
var Links="";
var Titles="";
var Alts="";
var Apic14=Pics.split('|');
var ALink14=Links.split('|');
var ATitle14=Titles.split('|');
var AAlts14=Alts.split('|');
var Show_Text=0;
var Total_Item=Apic14.length;
for(i=0;i<Total_Item;i++)
  {
   Image_14.src = Apic14[i]; 
  }




function LoadSlideBox_14()
{
var bcastr_config="&bcastr_config=0xffffff|2|0x000000|60|0xffffff|0xff6600|0x000033|7|1|1|_self";
//������ɫ|����λ��|���ֱ�����ɫ|���ֱ���͸����|����������ɫ|����Ĭ����ɫ|������ǰ��ɫ|�Զ�����ʱ��(��)|ͼƬ����Ч��|�Ƿ���ʾ��ť|��Ŀ�괰��
var swf_width=665;
var swf_height=313;
Links=escape(Links);
document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'">');
document.write('<param name="movie" value="bcastr3.swf"><param name="quality" value="high">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
document.write('<param name="FlashVars" value="bcastr_file='+Pics+'&bcastr_link='+Links+'&bcastr_title='+Titles+'&bcastr_config='+bcastr_config+'">');
document.write('<embed src="bcastr3.swf" wmode="opaque" FlashVars="bcastr_file='+Pics+'&bcastr_link='+Links+'&bcastr_title='+Titles+'&bcastr_config='+bcastr_config+'& menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); 
document.write('</object>'); 
}




LoadSlideBox_14();