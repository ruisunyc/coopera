<%@ page language="java"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.lang.String"%>
<%
	session.setMaxInactiveInterval(4800);
	String curruser = (String) session.getAttribute("currentusername");
	if (curruser == null) {
		out.println(
				"<script language=\"JavaScript\" type=\"text/javascript\">window.location.href=\"removeSession.jsp\";</script>");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>>团队协作编辑平台后台管理</title>
<style type="">
{
margin:0px;
 padding:0px;
}
</style>
</head>
<frameset rows="127,*,11" frameborder="no" border="0" framespacing="0">
	<frame src="top.jsp" name="topFrame" scrolling="no" noresize="noresize"
		id="topFrame" />
	<frame src="center.jsp" name="mainFrame" id="mainFrame" />
	<frame src="down.jsp" name="bottomFrame" scrolling="no"
		noresize="noresize" id="bottomFrame" />
</frameset>
<noframes>
	<body>
	</body>
</noframes>
</html>
