<%@ page language="java"%>
<%@ page contentType="text/html;charset=utf-8"%>
<jsp:useBean id="getUser" class="com.lib.sys.Userinfo" scope="page"/>
<jsp:useBean id='oMD5' class="com.lib.sys.MD5" scope='request'/>
<%@ page import="java.lang.String" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%
String curruser = (String) session.getAttribute("currentusername");
if (curruser == null)
{
out.println("<script language=\"JavaScript\" type=\"text/javascript\">window.location.href=\"removeSession.jsp\";</script>");
}
String username = new String(request.getParameter("T1").getBytes("iso-8859-1"),"utf-8");
String truename = new String(request.getParameter("T2").getBytes("iso-8859-1"),"utf-8");
String userpass = new String(request.getParameter("T3").getBytes("iso-8859-1"),"utf-8");
String suserpass = oMD5.getMD5ofStr(userpass);
String userface = new String(request.getParameter("T5").getBytes("iso-8859-1"),"utf-8");;
String usernumber = "0";
String userpower = "管理员";

String userChk[][] = null;
if (getUser.getCheck(username) != null)
{
	userChk = getUser.getCheck(username);
	if (userChk.length > 0)
	{
	out.println("<script language=\"JavaScript\" type=\"text/javascript\">window.alert(\"您输入的用户名称已经存在，请重新添加用户名！\"); window.location.href=\"add.jsp\";</script>");
	}
	else
	{
	getUser.addUser(username,suserpass,truename,userface,usernumber,userpower);
	}
}
out.println("<script language=\"JavaScript\" type=\"text/javascript\">window.alert(\"保存成功，谢谢您的工作！\"); window.location.href=\"add.jsp\";</script>");
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>无标题文档</title>
</head>

<body>

</body>

</html>



