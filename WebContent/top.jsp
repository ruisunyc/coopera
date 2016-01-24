<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>
<%
	String path = request.getContextPath();
%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>top</title>
<style type="text/css">
span {
	font-size: 19px;
}
.top_nav {
	height: 25px;
	backgroundcolor: #191970;
	margin-bottom: 10px;
}
#secondNav {
}
a {
	color: #000000;
	text-decoration: none
}
a:hover {
	color: #ffff00;
	text-decoration: underline;
}
#topMenu a {
	color: #ffffff;
	text-decoration: none
}
#topMenu a:hover{
color: #ffff00;
	text-decoration: underline;
}
#topMenu span {
	font-size: 24;
	cursor: hand;
	color: #FFFFe0;
}
#top_table {
	width: 420px;
	border: 0;
	cellpadding: 0;
	cellspacing: 0;
	height: 25;
}
#top_table tr {
	align: center;
	valign: bottom;
	height: 25;
}
#logo {
}
body {
 	background: #0080c0; 
 	margin:0px auto;
 	width:100%;
}
.topright
{
no-repeat;
float:right;
font-size: 16; text-align: center; color: white;
width:60px;
}
</style>
 <script type="text/javascript">
				  function setTime(){
				     var day="";
				      var month="";
				      var ampm="";
				      var ampmhour="";
				      var myweekday="";
				      var year="";
				   var myHours="";
				   var myMinutes="";
				   var mySeconds="";
				      mydate=new Date();
				      myweekday=mydate.getDay();
				      mymonth=parseInt(mydate.getMonth()+1)<10?"0"+(mydate.getMonth()+1):mydate.getMonth()+1;
				      myday= parseInt(mydate.getDate())<10?"0"+(mydate.getDate()):mydate.getDate();//mydate.getDate();
				      myyear= mydate.getYear();
				   myHours = mydate.getHours();
				      myMinutes = parseInt(mydate.getMinutes())<10?"0"+mydate.getMinutes():mydate.getMinutes();
				      mySeconds = parseInt(mydate.getSeconds())<10?"0"+mydate.getSeconds():mydate.getSeconds();
				      year=(myyear > 200) ? myyear : 1900 + myyear;
				      if(myweekday == 0)
				      weekday=" 星期日 ";
				      else if(myweekday == 1)
				      weekday=" 星期一 ";
				      else if(myweekday == 2)
				      weekday=" 星期二 ";
				      else if(myweekday == 3)
				      weekday=" 星期三 ";
				      else if(myweekday == 4)
				      weekday=" 星期四 ";
				      else if(myweekday == 5)
				      weekday=" 星期五 ";
				      else if(myweekday == 6)
				      weekday=" 星期六 ";
				     datetime.innerText=year+"年"+mymonth+"月"+myday+"日 "+myHours+":"+myMinutes+":"+mySeconds+" "+weekday;
				  setTimeout("setTime()",1000);
				  }
					</script>

</head>
<body>
	<%
	String str = (String) session.getAttribute("username");
	String sql = "select * from user where username='" + str + "'";
	ResultSet rs = con.getRs(sql);
	rs.next();
	String name = rs.getString("username");
%>
	<div style="width:100%;">
	    <div style="width:100%;;">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
    <td height="57" background="sysadmins/images/main_03.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="378" height="57" background="images/top/main_03.jif">&nbsp;<font style="font-size: 20px; FONT-FAMILY: 华文行楷;color: #66ffff">团队协作编辑平台</font></td>
        <td>&nbsp;</td>
        <td width="281" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="33" height="27"><img src="sysadmins/images/main_05.gif" width="33" height="27" /></td>
            <td width="248" background="sysadmins/images/main_06.gif"><table width="225" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="17"><div align="right">
					<a title="点击此处修改我的密码" class="style1" target="content" href="set/mix.jsp"><img src="sysadmins/images/pass.gif" border="0" width="69" height="17" /></a></div></td>
                <td><div align="right">
					<a title="点击此处查看我的信息" class="style1" target="content" href="set/personal.jsp"><img src="sysadmins/images/user.gif" border="0" width="69" height="17" /></a></div></td>
                <td><div align="right">
					<a title="点击此处退出网站管理系统" onclick="if (confirm('确定要退出吗？')) return true; else return false;" target="_top" class="style1" href="set/removeSession.jsp">
					<img src="sysadmins/images/quit.gif" width="69" height="17" border="0" /></a></div></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
	   </table> 
	   <div style="float: left;"></div>
		<div id="top_nav" style="" width="1300px;" >
			<div id="left_wel" style="float: left;margin-left:40px;">
				<table border="0" cellpadding="3" cellspacing="0">
					<tr  >
						<td><span style='font-size: 16; text-align: center; color: white'>
								欢迎您:<%=name%></span>
						</<></td>
						<td>
						    <div class="topright">    
      <a href="set/removeSession.jsp" target="_parent" onclick="return confirm('确定要退出吗？')"><span style='font-size: 16; text-align: center; color: white;'>退出</span></a>
     </div>
						</td>
					</tr>
				</table>
			</div>
			<div id="right" >
			<div id="right_main" align="left" style="float:left;margin-left:250px;">
				<table id="top_table">
					<tr id="topMenu">
						<td><a href="details.jsp" target="middle">
						<span>首页</span>|</td>
						<td><a href="details.jsp?" target="middle">
								<span>公告中心</span>|
						</a></td>
						<td><a href="wordCoop.html" target="middle">
								<span>文档协作</span>|
						</a></td>
<!--                          <td><a href="knowledge.html" target="middle"><span>文档共享</span></a> -->
                       <td><a href="teamManage.html" target="middle">
								<span>团队中心</span>|
						</a></td>
						<td><a href="set/setIndex.html" target="middle"><span>个人设置</span></a>
						</td>
					</tr>
				</table>
			</div>
			<div align="right"  style="width:300px;float:right;margin-right:100px;" >
			       <span id="datetime"	style=" color: #FFFFe0;font-family: 宋体; font-size: 13pt;">
					<script type="text/javascript">setTime();</script>
					</span>
		 </div>
		 </div>
		</div>
	</div>
</body>
</html>