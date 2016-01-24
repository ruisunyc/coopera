<%@ page language="java"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="getUser" class="com.lib.sys.Userinfo" scope="page"/>
<%@ page import="java.lang.String" %>
<%
String getIp = request.getRemoteAddr();

String curruser = (String) session.getAttribute("currentusername");
String getCurr[][] = null;
String username = "";
String truename = "";
String userface = "";
if (getUser.getMe(curruser) != null)
{
	getCurr = getUser.getMe(curruser);
	{
		if (getCurr.length > 0)
		{
			username = getCurr[0][1];
			truename = getCurr[0][3];
			userface = getCurr[0][4];
		}
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<STYLE type=text/css>A {
	TEXT-DECORATION: none
}
A.style1:link {
    text-decoration: none;color: #000000;font-weight: normal;
}
A.style1:visited {
    text-decoration: none;color: #000000;font-weight: normal;
}
A.style1:active {
	text-decoration: none;color: #000000;font-weight: normal;
}
A.style1:hover {
	text-decoration: underline;color: #000000;font-weight: normal;
}
A.style2:link {
	text-decoration: none;color:#ffffff;font-weight: normal;
}
A.style2:visited {
	text-decoration: none;color: #ffffff;font-weight: normal;
}
A.style2:active {
	text-decoration: none;color: #ffffff;font-weight: normal;
}
A.style2:hover {
    text-decoration: none;color: #ffffff;font-weight: normal;
  }

TABLE {
	FONT-SIZE: 10pt; FONT-FAMILY: 宋体; BORDER-COLLAPSE: collapse
}
.button {
	BORDER-RIGHT: #5589aa 1px solid; BORDER-TOP: #5589aa 1px solid; FONT-SIZE: 9pt; BACKGROUND: url(img/ButtonBg.gif) #f6f6f9; BORDER-LEFT: #5589aa 1px solid; WIDTH: 50px; COLOR: #000000; BORDER-BOTTOM: #5589aa 1px solid; HEIGHT: 18px
}
.lanyu {
	BORDER-RIGHT: #5589aa 1px solid; BORDER-TOP: #5589aa 1px solid; FONT-SIZE: 12px; BORDER-LEFT: #5589aa 1px solid; COLOR: #000000; BORDER-BOTTOM: #5589aa 1px solid
}
.font {
	FONT-SIZE: 9pt; FILTER: DropShadow(Color=#cccccc, OffX=2, OffY=1, Positive=2); TEXT-DECORATION: none
}

</STYLE>
<base target="_top">
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="57" background="images/main_03.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="378" height="57" background="images/main_01.jpg">&nbsp;</td>
        <td>&nbsp;</td>
        <td width="281" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="33" height="27"><img src="images/main_05.gif" width="33" height="27" /></td>
            <td width="248" background="images/main_06.gif"><table width="225" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="17"><div align="right">
					<a title="点击此处修改我的密码" class="style1" target="main" href="mys/edits.jsp"><img src="images/pass.gif" border="0" width="69" height="17" /></a></div></td>
                <td><div align="right">
					<a title="点击此处查看我的信息" class="style1" target="main" href="mys/myinfo.jsp"><img src="images/user.gif" border="0" width="69" height="17" /></a></div></td>
                <td><div align="right">
					<a title="点击此处退出网站管理系统" onclick="if (confirm('确定要退出吗？')) return true; else return false;" target="_top" class="style1" href="removeSession.jsp">
					<img src="images/quit.gif" width="69" height="17" border="0" /></a></div></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="40" background="images/main_10.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="194" height="40" background="images/main_07.jpg">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="21"><img src="images/main_13.gif" width="19" height="14" /></td>
            <td width="35" class="STYLE7"><div align="center">
				<a class="style2" target="_blank" title="点击此处显示首页" href="../login.html">首页</a></div></td>
            <td width="21" class="STYLE7"><img src="images/main_15.gif" width="19" height="14" /></td>
            <td width="35" class="STYLE7"><div style="cursor:hand" align="center" onclick="history.go(-1)">
				<font color="#FFFFFF">后退</font></div></td>
            <td width="21" class="STYLE7"><img src="images/main_17.gif" width="19" height="14" /></td>
            <td width="35" class="STYLE7"><div style="cursor:hand" align="center" onclick="history.go(-0)">
				<font color="#FFFFFF">前进</font></div></td>
            <td width="21" class="STYLE7"><img src="images/main_19.gif" width="19" height="14" /></td>
            <td width="35" class="STYLE7"><div style="cursor:hand" align="center" onclick="history.go(+1)">
				<font color="#FFFFFF">刷新</font></div></td>
<!--             <td width="21" class="STYLE7"><img src="images/main_21.gif" width="19" height="14" /></td> -->
            <!-- <td width="35" class="STYLE7"><div align="center">
				<font color="#FFFFFF">
				<a class="style2" target="_blank" title="点击此处显示帮助" href="adminhelp.jsp">帮助</a></font></div></td> -->
            <td>&nbsp;</td>
          </tr>
        </table></td>
        <td width="248" background="images/main_11.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="16%"><span class="STYLE5"></span></td>
            <td width="75%"><div align="center"><span id="datetime" style="COLOR: #FFFFFF;font-family:宋体; font-size:9pt;">time</span>
				<script>
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
				  setTime();
				</script>
            </div></td>
            <td width="9%">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr style="height: 30" align="justify">
    <td height="30" background="images/main_31.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" height="30"><img src="images/main_28.gif" width="8" height="30" /></td>
        <td width="147" background="images/main_29.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="24%">&nbsp;</td>
            <td width="43%" height="20" valign="bottom" class="STYLE1">管理菜单</td>
            <td width="33%">&nbsp;</td>
          </tr>
        </table></td>
        <td width="39"><img src="images/main_30.gif" width="39" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="20" valign="bottom"><span class="STYLE1">当前登录用户：<%= username%> &nbsp;真实姓名：<%= truename%></span></td>
            <td valign="bottom" class="STYLE1">


            <div align="right"><img src="images/sj.gif" width="6" height="7" />

 IP：<%= getIp%>     &nbsp; &nbsp;&nbsp;<img src="images/sj.gif" width="6" height="7" /> &nbsp;
                                          
                                             部门：<%= userface%> &nbsp; &nbsp; <img src="images/sj.gif" width="6" height="7" /> &nbsp;
				单位：计算机与信息技术学院</div></td>
          </tr>
        </table></td>
        <td width="17"><img src="images/main_32.gif" width="17" height="30" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
