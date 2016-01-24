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
out.println("<script language=\"JavaScript\" type=\"text/javascript\">window.location.href=..\"removeSession.jsp\";</script>");
}

String strtitle = new String(request.getParameter("strtitle").getBytes("iso-8859-1"),"utf-8");
String ID = request.getParameter("ID");
getCons.delCons(ID);
out.println("<script language=\"JavaScript\" type=\"text/javascript\">window.alert(\"删除成功，谢谢！\"); window.location.href=\"dels.jsp?strtitle="+strtitle+"\";</script>");
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>无标题文档</title>
</head>

<body>

</body>

</html>



