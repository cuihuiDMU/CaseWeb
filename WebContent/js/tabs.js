// JavaScript Document
function tabs(rt,ct)
{
var tnum=1;//�����л�ģ�����
var tags=4;//�����л���ǩ��Ŀ
document.getElementById("contag"+rt+ct).style.display="block";
document.getElementById("more"+rt+ct).style.display="block";
document.getElementById("tab"+rt+ct).className="ctag"+rt;
for(i=1;i<=tnum;i++){
	for(j=1;j<=tags;j++){
		if(i==rt && j!=ct){
			document.getElementById("contag"+i+j).style.display="none";
			document.getElementById("more"+i+j).style.display="none";
            document.getElementById("tab"+i+j).className="otag"+i;
			}
		}
	}
}

function tabs2(rt,ct)
{
var tnum=2;//�����л�ģ�����
var tags=2;//�����л���ǩ��Ŀ
document.getElementById("contag"+rt+ct).style.display="block";
document.getElementById("more"+rt+ct).style.display="block";
document.getElementById("tab"+rt+ct).className="ctag"+rt;
for(i=2;i<=tnum;i++){
	for(j=1;j<=tags;j++){
		if(i==rt && j!=ct){
			document.getElementById("contag"+i+j).style.display="none";
			document.getElementById("more"+i+j).style.display="none";
            document.getElementById("tab"+i+j).className="otag"+i;
			}
		}
	}
}