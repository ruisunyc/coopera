<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<html  >
<head>
<% HttpSession ses = request.getSession(); 
ses.setMaxInactiveInterval(-1); %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<jsp:useBean id="groupCon" class="test.Conn" scope="page"></jsp:useBean>
<style type="text/css">
a{
text-decoration:none;
}
table {
	width: 100%;
	border:solid #add9c0; border-width:1px 0px 0px 1px;
}
th{
	height: 30px;
	border:solid #add9c0; border-width:0px 1px 1px 0px;
}
td {
	height: 30px;
	border:solid #add9c0; border-width:0px 1px 1px 0px;
}
tr{

  border: 1px #CCCCCC solid;
}
#menu{
margin: 0 auto;
margin-bottom:10px;
margin-top:10px;
width:1000px;
height:30px; background:#0080c0;}
#footer{
height:40px; background:#0080c0 ;
 margin-bottom: 0px;
 
}
#content{
  height: 590px;
  width: 800px;
  margin: 0 auto;
}
</style>
<script type="text/javascript">
function dela(s){
	//alert("您是团队管理员，确认将解散团队，是否确认?");
	if(confirm("您是团队管理员，确认将解散团队，是否确认?")) 
	{//如果是true ，那么就把页面转向
		location.href=s;
	}
}
function delu(s){
	//alert("您是团队管理员，确认将解散团队，是否确认?");
	if(confirm("您确定退出团队?")) 
	{//如果是true ，那么就把页面转向
		location.href=s;
	}
}
</script>
</head>
<body>
  <div id="menu" style="margin-top:20px;">
    我的团队
  </div>
    <div id="content" align="center">
		 <table align="center">
		<tr>
		     <th >
				<%
					out.print("团队编号");
				%>
			</th>
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
			<tr align="center">
			<td >
					<%
					out.print(group_ID);
					%>
				</td>
				<td >
					<%
					    String Group_name=rs2.getString("Group_name");
						//out.print(Group_name);
					%>
					<a  href="groupCoop.jsp?Group_ID=<%=group_ID %>&Group_name=<%=Group_name %>"><%=Group_name %></a>
				</td>
				<td >
					<%
					out.print(Group_role);
					%>
				</td>
				<td >
				<%
			  	if(Group_role.equals("管理员")){%>
			  		<a href="javascript:void(0);" onclick='dela("deleteGroup?group_ID=<%= group_ID %>&Group_role=<%= Group_role%>")' >解散团队</a> 
			  <% }else{%>
				  <a href="#" onclick='delu("deleteGroup?id=<%= id %>&Group_role=<%= Group_role%>")'>退出团队</a>
			<%  }
					%>
				</td>
			<%
				}
				rs2.close();
				groupCon.close();
			}
			rs1.close();
			groupCon.close();
		%>
		</table>
  </div>
  <div id="footer" align="center">
  © 山西大学版权所有<br /> 
       计算机与信息技术学院  　网络研究室 
  </div>
</body>
</html>
