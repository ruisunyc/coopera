<%@ page language="java"%>
<%@ page contentType="text/html;charset=utf-8"%>
<jsp:useBean id="getInfos" class="com.lib.cons.Libscons" scope="page"/>
<%@ page import="java.lang.String" %>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>工作通告</title>
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
	text-decoration: none;color:#1C5EA3;font-weight: normal;
}
A.style2:visited {
	text-decoration: none;color: #1C5EA3;font-weight: normal;
}
A.style2:active {
	text-decoration: none;color: #0033ff;font-weight: normal;
}
A.style2:hover {
    text-decoration: underline;color: #0033ff;font-weight: normal;
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

</STYLE>

</head>
<% 
String username = request.getParameter("username");
//session.setAttribute("username",username); %>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">

<table border="0" cellpadding="0" cellspacing="0" height="100%" align="center">
	<tr>
		<td align="center" valign="top">
		<!-- <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100">
			<tr>
				<td><iframe frameBorder=0 name=menu scrolling="no" src="top.jsp" style="height:100px;visibility:inherit;width:100%;z-index:2"></iframe></td>
			</tr>
		</table> -->
		<table border="0" cellpadding="0" cellspacing="0" width="100%" height="500">
			<tr>
				<td width="200" align="center" valign="top">
				<table border="0" cellpadding="0" cellspacing="0" width="200" height="25">
					<tr>
						<td>　</td>
					</tr>
				</table>
				<table border="0" cellpadding="0" cellspacing="0" width="200" height="80" background="images/col_details.jpg">
					<tr>
						<td></td>
					</tr>
				</table>
				<%
				String getCons[][] = null;
				if (getInfos.getNew() != null)
				{
					getCons = getInfos.getNew();
					if (getCons.length > 10)
					{
					for (int i =0;i<10;i++)
					{
				%>
				<table border="0" cellpadding="0" cellspacing="0" width="200" height="30" background="images/col_03.jpg">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						 <a class="style1" title="<%= getCons[i][1]%>" target="_top" href="lib_news.jsp">
						<%
							if (getCons[i][1].length() > 9)
							{
								out.println("<a class=\"style1\" target=\"_self\" title=\""+getCons[i][1].trim()+"\" href=details.jsp?ID="+getCons[i][0]+">"+getCons[i][1].trim().substring(0,7)+"...</a>");
							}
							else
							{
								out.println("<a class=\"style1\" target=\"_self\" title=\""+getCons[i][1].trim()+"\" href=details.jsp?ID="+getCons[i][0]+">"+getCons[i][1].trim()+"</a>");
							}
						 %>
						</a></td>
					</tr>
				</table>
				<%
				}}
				else
				{
				for (int i =0;i<getCons.length;i++)
				{
				%>
				<table border="0" cellpadding="0" cellspacing="0" width="200" height="30" background="images/col_03.jpg">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<a class="style1" title="<%= getCons[i][1]%>" target="_top" href="lib_news.jsp">
						<%
							if (getCons[i][1].length() > 9)
							{
								out.println("<a class=\"style1\" target=\"_self\" title=\""+getCons[i][1].trim()+"\" href=details.jsp?ID="+getCons[i][0]+">"+getCons[i][1].trim().substring(0,7)+"...</a>");
							}
							else
							{
								out.println("<a class=\"style1\" target=\"_self\" title=\""+getCons[i][1].trim()+"\" href=details.jsp?ID="+getCons[i][0]+">"+getCons[i][1].trim()+"</a>");
							}
						 %>
						</a></td>
					</tr>
				</table>
				<%
				}}}%>
				<table border="0" cellpadding="0" cellspacing="0" width="200" height="30" background="images/col_04.jpg">
					<tr>
						<td>　</td>
					</tr>
				</table>
<!-- 				<table border="0" cellpadding="0" cellspacing="0" width="200" height="150" background="images/col_05.jpg"> -->
<!-- 					<tr> -->
<!-- 						<td height="63">　</td> -->
<!-- 					</tr> -->
<!-- 				</table> -->
				<!-- <table border="0" cellpadding="0" cellspacing="0" width="200" height="70" background="images/col_06.jpg">
					<tr>
						<td>　</td>
					</tr>
					<tr>
						<td height="36">&nbsp; 
						<a class="style2" title="读者来信" href="mailto:libzx@sxu.edu.cn?subject=读者来信">读者来信</a>&nbsp;&nbsp; 
						<a class="style2" title="读者咨询" target="_top" href="red_ask.jsp">
						读者咨询</a>&nbsp;&nbsp;
						<a class="style2" title="读者查询" target="_top" href="red_sea.jsp">
						读者查询</a></td>
					</tr>
				</table> -->
				</td>
				<td width="10">　</td>
				<td width="790" align="right" valign="top">
				<table border="0" cellpadding="0" cellspacing="0" width="790" height="10">
					<tr>
						<td>　</td>
					</tr>
				</table>
				<table border="0" cellpadding="0" cellspacing="0" width="790" height="30" background="images/main_01.jpg">
					<tr>
						<td width="450">
						<p style="margin-top: 2px; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<b><font color="#1C5EA3">查看通告</font></b></td>
						<td width="340">
						<p style="margin-top: 2px; margin-bottom: 0">
						<!-- <a class="style1" title="团队协作编辑平台" href="index.jsp"></a> <a class="style2" title="关于我们" href="lib_news.jsp">工作通告</a>―查看细节</td> -->
					</tr>
				</table>
				<%
				String ID = request.getParameter("ID");
				if(ID==null){
					
					ID="0";
				}
				getInfos.upRedTimes(ID);
				String getDets[][] = null;
				if (getInfos.getId(ID) != null)
				{
					getDets = getInfos.getId(ID);
					if (getDets.length > 0)
					{
				%>
				<table border="0" cellpadding="0" cellspacing="0" width="790" height="80">
					<tr>
						<td align="center"><font size="5"><%= getDets[0][1]%></font></td>
					</tr>
				</table>
				
				<table border="0" cellpadding="0" cellspacing="0" width="790" height="40">
					<tr>
						<td align="center" valign="top">
						<p style="margin-bottom: 6px">发布人：<%= getDets[0][4]%>，发布时间<%= getDets[0][6]%>，已经阅读 <b><%= getDets[0][7]%></b> 次。</p>
						<hr width="400"></td>
					</tr>
				</table>
				
				<table border="0" cellpadding="0" cellspacing="0" width="790">
					<tr>
						<td><%= getDets[0][3]%></td>
					</tr>
				</table>
				
				<%}}%>
				</td>
			</tr>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" width="1000" height="120">
			<tr>
<!-- 				<td><iframe frameBorder=0 name=menu scrolling="no" src="pubs_btm.jsp" style="height:100%;visibility:inherit;width:100%;z-index:2"></iframe></td> -->
			</tr>
		</table>
		</td>
	</tr>
</table>

</body>

</html>