<%@ page language="java"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="getInfo" class="com.lib.sys.Userinfo" scope="page"/>
<jsp:useBean id='oMD5' class="com.lib.sys.MD5" scope='request'/>
<%@ page import="java.lang.String" %>

<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统登录</title>
</head>
<body>
<%
out.print("<STYLE type=text/css>A {");
out.print("	TEXT-DECORATION: none");
out.print("}");
out.print("A:link {");
out.print("	COLOR: #6AABF1; FONT-FAMILY: 宋体; TEXT-DECORATION: none");
out.print("}");
out.print("A:visited {");
out.print("	COLOR: #6AABF1; FONT-FAMILY: 宋体; TEXT-DECORATION: none");
out.print("}");
out.print("A:active {");
out.print("	FONT-FAMILY: 宋体; TEXT-DECORATION: none");
out.print("}");
out.print("A:hover {");
out.print("	BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; COLOR: #185DCB; BORDER-BOTTOM: 0px dotted; BORDER-RIGHT-WIDTH: 1px; TEXT-DECORATION: none");
out.print("}");

out.print("TABLE {");
out.print("	FONT-SIZE: 9pt; FONT-FAMILY: 宋体; BORDER-COLLAPSE: collapse");
out.print("}");
out.print(".button {");
out.print("	BORDER-RIGHT: #5589aa 1px solid; BORDER-TOP: #5589aa 1px solid; FONT-SIZE: 9pt; BACKGROUND: url(img/ButtonBg.gif) #f6f6f9; BORDER-LEFT: #5589aa 1px solid; WIDTH: 50px; COLOR: #000000; BORDER-BOTTOM: #5589aa 1px solid; HEIGHT: 18px");
out.print("}");
out.print(".lanyu {");
out.print("	BORDER-RIGHT: #5589aa 1px solid; BORDER-TOP: #5589aa 1px solid; FONT-SIZE: 12px; BORDER-LEFT: #5589aa 1px solid; COLOR: #000000; BORDER-BOTTOM: #5589aa 1px solid");
out.print("}");
out.print(".font {");
out.print("	FONT-SIZE: 9pt; FILTER: DropShadow(Color=#cccccc, OffX=2, OffY=1, Positive=2); TEXT-DECORATION: none");
out.print("}");
out.print("</STYLE>");

out.print("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" height=\"100%\">");
out.print("	<tr>");
out.print("		<td align=\"center\">");
out.print("		<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"357\" height=\"186\" background=\"images/usercheck_01.jpg\">");
out.print("			<tr>");
out.print("				<td>");
out.print("				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" height=\"100%\">");
out.print("					<tr>");
out.print("						<td width=\"137\">");
out.print("						<p align=\"center\">");
out.print("						<object classid=\"clsid:D27CDB6E-AE6D-11CF-96B8-444553540000\" id=\"obj1\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0\" border=\"0\" width=\"150\" height=\"150\">");
out.print("							<param name=\"movie\" value=\"images/userchek_01.swf\">");
out.print("							<param name=\"quality\" value=\"High\">");
out.print("							<param name=\"wmode\" value=\"transparent\">");
out.print("							<embed src=\"images/userchek_01.swf\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" name=\"obj1\" width=\"150\" height=\"150\" quality=\"High\" wmode=\"transparent\"></object>");
out.print("						</td>");
out.print("						<td>");
out.print("						<p style=\"margin-top: 6px; margin-bottom: 6px\">");
out.print("						<font color=\"#185DCB\">请稍后系统正在为您登录...</font></p>");
out.print("						<p style=\"margin-top: 12px; margin-bottom: 6px\">");
out.print("						<font color=\"#6AABF1\">无法转向请</font><a target=\"_top\" href=\"login.html\">单击此处</a></td>");
out.print("					</tr>");
out.print("				</table>");
out.print("				</td>");
out.print("			</tr>");
out.print("			<tr>");
out.print("				<td height=\"37\">");
out.print("				<p align=\"center\">　<img src=\"images/usercheck_01.gif\"></td>");
out.print("			</tr>");
out.print("		</table>");
out.print("		</td>");
out.print("	</tr>");
out.print("</table>");

%>
</body>
</html>
<%

String username = request.getParameter("textfield");
String userpass = request.getParameter("textfield2");
String inputs = request.getParameter("verifycode");
String suserpass = oMD5.getMD5ofStr(userpass);
String getUser[][] = null;
	if (getInfo.getMe(username) != null)
	    {
	    	getUser = getInfo.getMe(username);
	    	if (getUser.length > 0)
	    	{
	    		if (getUser[0][2].trim().equals(suserpass))
	    		{
	    		session.setAttribute("currentusername",username);
	    		int intTemp = Integer.parseInt(getUser[0][5].trim());
	    		intTemp = intTemp + 1;
	    		getInfo.upMynumber(""+intTemp,username);
	    		out.println("<script language=\"JavaScript\" type=\"text/javascript\">window.location.href=\"defaults.jsp\";</script>");
	    		}
	    		else
	    		{
	    		out.println("<script language=\"JavaScript\" type=\"text/javascript\">window.alert(\"用户密码错误，请重新输入密码！\"); window.location.href=\"login.html\";</script>");
	    		}
	    	}
	    	else
	    	{
	    	out.println("<script language=\"JavaScript\" type=\"text/javascript\">window.alert(\"该用户不存在，请核实后再输入！\"); window.location.href=\"login.html\";</script>");
	    	}
	    }
%>