<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<html  >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<!--<link rel="stylesheet" href="layout.css" type="text/css" />-->
<jsp:useBean id="groupCon" class="test.Conn" scope="page"></jsp:useBean>
<style type="text/css">
table {
	border: 0px #CCCCCC solid;
	width: 360px;
}
th{
	height: 30px;
	border: #CCCCCC 0px solid;
}
td {
	height: 30px;
	border: #CCCCCC 0px solid;
}
tr{

  border: 1px;
}
</style>
</head>

<body>
<div id="container">


  <div id="menu" style="margin-top:20px;">
    我的团队
  </div>

  <div id="mainContent">
   
    <div id="content">
	
	<div align="center">
		 <table align="center">
		<tr>
			<th >
				<%
					out.print("团队名");
				%>
			</th>
			<th>
				<%
					out.print("角色");
				%>
			</th>
			<th>
				<%
					out.print("操作");
				%>
			</th>
							
			
		</tr>

		<%
		  // HttpSession session=request.getSession(false);
	       String name=(String)session.getAttribute("username"); 
	      // out.print(name);
	     
		  String sql="select * from `group` WHERE Group_manager='"+name+"'";
		
		  ResultSet rs=groupCon.executeQuery(sql);;
		
			while (rs.next()) {
				 String Group_id=rs.getString("Group_ID");
		%>
		<tr align="center">
			<td >
				<%
				    String Group_name=rs.getString("Group_name");
					out.print(Group_name);
				%>
			</td>
			
			<td >
				<%
					out.print("管理员");
				%>
			</td>
			<td >
			<a href="groupCoop.jsp?Group_ID=<%=Group_id %>&Group_name=<%=Group_name %>">进入团队</a>
		  	 
				
			</td>
			
		<%
			}
			rs.close();
			
		
			
			//out.print(name);
			String sql2="select group_ID from `group_user` WHERE userName='"+name+"' ";
			ResultSet rs1=groupCon.executeQuery(sql2);
			while(rs1.next()){
				int group_ID= rs1.getInt("group_ID");
				//out.print(group_ID);
				sql2="select * from `group` WHERE Group_ID='"+group_ID+"' ";
				ResultSet rs2=groupCon.executeQuery(sql2);
				while (rs2.next()) {
					
			%>
							
			<tr align="center">
				<td >
					<%
					    String Group_name=rs2.getString("Group_name");
						out.print(Group_name);
					%>
				</td>
				
				<td >
					<%
						out.print("普通用户");
					%>
				</td>
				<td >
				<a href="groupCoop.jsp?Group_ID=<%=group_ID %>&Group_name=<%=Group_name %>">进入团队</a>
			  	   <%
					 //  out.print("||");
					%>
				<!-- <a href="">退出团队</a> -->
					
				</td>
				
			<%
				}
				rs2.close();
				
			}
			
			rs1.close();
			
			
	      
		%>
		</table>
	</div>


   
  </div>
 </div> </div>
  
</body>
</html>
