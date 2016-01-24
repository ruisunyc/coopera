<%@ page language="java"%>
<%@ page contentType="text/html;charset=utf-8"%>
<jsp:useBean id="userinfo" class="com.lib.sys.Userinfo" scope="page"/>
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
String T1 = new String(request.getParameter("T1").getBytes("iso-8859-1"),"utf-8");
String T2 = new String(request.getParameter("T2").getBytes("iso-8859-1"),"utf-8");

String oldpass = oMD5.getMD5ofStr(T1.trim());
String newpass = oMD5.getMD5ofStr(T2.trim());

String userChk[][] = null;
if (userinfo.getMe(curruser) != null)
{
	userChk = userinfo.getMe(curruser);
	if (userChk.length > 0)
	{
		if (!oldpass.equals(userChk[0][2].trim()))
		{
			out.println("<script language=\"JavaScript\" type=\"text/javascript\">window.alert(\"您输入的就密码错误，请返回重新更改密码！\"); window.location.href=\"editmypass.jsp\";</script>");
		}
		else
		{
			userinfo.upMepass(newpass,curruser);
		}
	}
}
out.println("<script language=\"JavaScript\" type=\"text/javascript\">window.alert(\"保存成功，谢谢您的工作！\"); window.location.href=\"edits.jsp\";</script>");
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>无标题文档</title>
</head>

<body>

</body>

</html>



