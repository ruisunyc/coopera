<%@ page language="java"%>
<%@ page contentType="text/html;charset=utf-8"%>
<jsp:useBean id="getInfo" class="com.lib.sys.Userinfo" scope="page"/>
<%@ page import="java.lang.String" %>
<%
String curruser = (String) session.getAttribute("currentusername");
if (curruser == null)
{
out.println("<script language=\"JavaScript\" type=\"text/javascript\">window.location.href=\"removeSession.jsp\";</script>");
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
    text-decoration: underline;color: #ffffff;font-weight: normal;
  }

TABLE {
	FONT-SIZE: 9pt; FONT-FAMILY: 宋体; BORDER-COLLAPSE: collapse
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
<!--
body {
	margin-left: 3px;
	margin-top: 3px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}

</style>

</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1">
				系统管理—我的信息</span></td>
              </tr>
            </table>
            </td>
            
          </tr>
        </table></td>
  </tr>
  <tr>
<%
		String getCons[][] = null;
		String strface = "";
		if (getInfo.getMe(curruser) != null)
		{
			getCons = getInfo.getMe(curruser);
			if (getCons.length > 0)
			{
		%>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="110" align="center" height="20">　</td>
				<td height="20">
				　</td>
			</tr>
			<tr>
				<td width="110" align="center" height="30">用户名称</td>
				<td height="30"><%= getCons[0][1]%></td>
			</tr>
			<tr>
				<td width="110" align="center" height="30">真实名称</td>
				<td height="30"><%= getCons[0][3]%></td>
			</tr>
			<tr>
				<td width="110" align="center" height="30">我的密码</td>
				<td height="30">已经加密，不在此处显示。</td>
			</tr>
			<tr>
				<td width="110" align="center" height="30">登录次数</td>
				<td height="30">您已经登录过<font color="#2578DB"><%= getCons[0][5].trim()%></font>次本系统。</td>
			</tr>
			<tr>
				<td width="110" align="center" height="30">我的权限</td>
				<td height="30"><%= getCons[0][6]%></td>
			</tr>
			<tr>
				<td width="110" align="center" height="30"></td>
				<td height="30">　<INPUT onclick="window.history.back(-1);" style="cursor:hand;BORDER-RIGHT: 1px groove rgb(37,120,219); BORDER-TOP: 1px ridge rgb(190,217,252); BORDER-LEFT: 1px ridge rgb(190,217,252); COLOR: #FFFFFF; BORDER-BOTTOM: 1px groove rgb(37,120,219); BACKGROUND-COLOR: #4D8EE3; font-family:宋体; font-size:9pt; line-height:120%; margin-top:6; margin-bottom:0" type=button value=" 返回 " name=Submit1></td>
			</tr>
		</table>
		<%
		}
		}
		%>
	</td>
  </tr>
  <tr>
    <td height="30">&nbsp;</td>
  </tr>
</table>
</body>
</html>