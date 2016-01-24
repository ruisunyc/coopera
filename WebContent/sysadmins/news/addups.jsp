<%@ page language="java"%>
<%@ page contentType="text/html;charset=utf-8"%>
<jsp:useBean id="getUser" class="com.lib.sys.Userinfo" scope="page"/>
<jsp:useBean id="getCons" class="com.lib.cons.Libscons" scope="page"/>
<%@ page import="java.lang.String" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%
String curruser = (String) session.getAttribute("currentusername");
if (curruser == null)
{
out.println("<script language=\"JavaScript\" type=\"text/javascript\">window.location.href=\"removeSession.jsp\";</script>");
}
String getCurr[][] = null;
String userface = "";
if (getUser.getMe(curruser) != null)
{
	getCurr = getUser.getMe(curruser);
	{
		if (getCurr.length > 0)
		{
			userface = getCurr[0][4];
		}
	}
}
Date date = new Date(); 
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String addtime=sdf.format(date);

String sContent = new String(request.getParameter("editor1").getBytes("iso-8859-1"),"utf-8");
String T1 = new String(request.getParameter("T1").getBytes("iso-8859-1"),"utf-8");
getCons.addCons(T1,"工作通告",sContent,curruser,userface,addtime,"0");
out.println("<script language=\"JavaScript\" type=\"text/javascript\">window.alert(\"保存成功！\"); window.location.href=\"new.jsp\";</script>");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>无标题文档</title>
</head>
<body>
</body>
</html>



