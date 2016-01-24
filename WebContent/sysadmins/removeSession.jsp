<%@ page language="java"%>
<%@ page contentType="text/html;charset=utf-8"%>

<%@ page import="java.lang.String" %>
<%
String curruser = (String) session.getAttribute("currentusername");
if (curruser != null)
{
	curruser = null;
	session.setAttribute("currentusername",curruser);
}

session.invalidate();
out.println("<script language=\"JavaScript\" type=\"text/javascript\">window.location.href=\"login.html\";</script>");
%>
