<%@page import="test.Conn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="groupCon" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
a:link {color:#Ffff00;text-decoration: none;} /* 未访问的链接 */
a:visited {color: #00F000} /* 已访问的链接 */
a:hover {color: #FF00FF;text-decoration:underline;} /* 鼠标移动到链接上 */
a:active {color: #0000FF} /* 选定的链接 */
a{height: 30px;}
</style>
</head>
<body leftmargin="0" topmargin="0" bgcolor="6492CC">
<table width="100%" border="0" cellpadding="0" cellspacing="0" height="100%"  class="left_bg1">
   <tr> 
    <td height="30" valign="top"><table width="164" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="36" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="20%">&nbsp;</td>
              <td width="5%">&nbsp;</td>
              <td width="67%" valign="middle" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="9"></td>
                  </tr>
                  <tr>
                    <td height="14" class="menutitle">文档协作</td>
                  </tr>
              </table></td>
              <td width="8%">&nbsp;</td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
  <td height="2px;" style="border:2px ;color:white;">
  <hr>
  </td>
  </tr>
  <tr style="margin-top: 5px;">
      <td valign="top">
      <table width="164" border="0" cellpadding="0" cellspacing="0" background="../images/menu/left_bg2.gif" class="T_song12bk1">
       <%
	       String name=(String)session.getAttribute("username"); 
			String sql1="select * from `group_user` WHERE userName='"+name+"' ";
			ResultSet rs1=groupCon.executeQuery(sql1);
			while(rs1.next()){
				String Group_role=rs1.getString("role");
				int id= rs1.getInt("id");
				int group_ID= rs1.getInt("group_ID");
				//out.print(group_ID);
				String sql2="select * from `group` WHERE Group_ID='"+group_ID+"' ";
				ResultSet rs2=groupCon.executeQuery(sql2);
				while (rs2.next()) {
			%>
			<tr align="center" style="height:30px;">
				<td >
					<%
					    String Group_name=rs2.getString("Group_name");
						//out.print(Group_name);
					%>
					<a  href="group/groupCoop.jsp?Group_ID=<%=group_ID %>&Group_name=<%=Group_name %>" target="content"><%=Group_name %>文档</a>
				</td>
			<%
				}
				rs2.close();
				test.Conn.close();
			}
			rs1.close();
			test.Conn.close();
		%>
      </table>    </td>
  </tr>
</table>
</BODY>
</HTML>
