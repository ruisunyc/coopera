<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
body { font-family:Verdana; font-size:14px; margin:0; line-height:150%;width:1400px;}
#header { height:100px; background:#0080c0; margin-bottom:2px;scrolling:"no" ;noresize ;marginwidth:"0"; marginheight:"0";}
#container{margin:0 auto; width:100%;}
#content{right 0 repeat-y; overflow:auto;zoom:1; margin-bottom:5px;height:500px}
#sideMenu{float:right;width:20px;height:480px;scrolling:"no" ;noresize ;marginwidth:"0"; marginheight:"0";}
#maincontent{height:480px;float:left; width:675px; padding:10px;}
#footer { height:40px;;}

</style>

</head>
<frameset rows="90px,*" frameborder=no border="0" framespacing="0"  style="width: 100%;margin: 0px auto;">
<frame src="top.jsp"    frameborder=no marginwidth="0" marginheight="0" border=0 bordercolor="white"></frame>
<frame src="details.jsp" name=middle></frame>

</frameset>


</html>