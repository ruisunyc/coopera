<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<HTML>
<HEAD>
<TITLE>用户基本/系统信息</TITLE>
<style type="text/css">
    #tableMain tr{
 background-color:#E4EAF4;
}
</style>
</HEAD>
<body topmargin="0">
<%
 String name=(String)session.getAttribute("username");
 String sql="select * from user where username='"+name+"'";
 ResultSet rs=con.getRs(sql);
 rs.next();
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr bgcolor="6C8ACC">
		<td ><img src="guide.gif" align="absmiddle">
		个人设置&gt;&gt;个人基本信息</td>
		<td align="right" >&nbsp;</td>
	</tr>
</table>
<table id="tableMain" width="100%" border="0" cellpadding="1" cellspacing="1">
    <tbody>
	<tr>
		<td colspan="10" >&nbsp;</td>
	</tr>
	<tr >
		<th width="11%" >账号</th>
		<td width="39%" ><%=rs.getString("username")%></td>
	</tr>
	<tr>	
		<th width="11%"> 姓名</th>
		<td width="39%" ><%=rs.getString("truename")%></td>
	</tr>
	<tr >
	    <th width="11%" >性别</th>
        <td width="39%" ><%=rs.getString("sex")%></td> 
	</tr>
	<tr >
		<th width="11%" >电子邮件</th>
		<td width="39%" ><%=rs.getString("mail")%></td>
		</tr>
		<tr>
		<th width="11%" >手机</th>
		<td width="39%" ><%=rs.getString("phone")%></td>
	</tr>
	<tr>
	<th>研究方向 </th>
    <td><%=rs.getString("direction")%></td>
	</tr>
<tr>
	<th>所在单位 </th>
    <td><%=rs.getString("unit")%></td>
	</tr>
<tr>
	<th>部门 </th>
    <td><%=rs.getString("dept")%></td>
	</tr>
<tr >
		<th width="11%" >地址</th>
		<td width="39%" ><%=rs.getString("address")%></td>
	</tr>	
	<tr >
		<th width="11%" >登录次数</th>
		<td width="39%" ><%=rs.getString("login_count")%>次</td>
		</tr>
		<tr>
		<th width="11%" >上一次登录时间</th>
		<td colspan="3" width="39%" ><%=rs.getString("login_time")%></td>
	</tr>
</tbody>
</table>
</BODY>
</HTML>
