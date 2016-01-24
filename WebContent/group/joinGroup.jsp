<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"
	import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:useBean id="groupCon" class="test.Conn" scope="page"></jsp:useBean>
<title>加入团队</title>
<link rel="stylesheet" href="layout.css" type="text/css" />
<style type="text/css">
table {
	width: 800px;
	border: solid #add9c0;
	border-width: 1px 0px 0px 1px;
}
th {
	height: 30px;
	border: solid #add9c0;
	border-width: 0px 1px 1px 0px;
}
td {
	height: 30px;
	border: solid #add9c0;
	border-width: 0px 1px 1px 0px;
}
tr {
	border: 1px #CCCCCC solid;
}
#menu {
	margin: 0 auto;
	margin-bottom: 10px;
	margin-top: 10px;
	width: 1000px;
}
#footer {
	margin-bottom: 0px;
}
#Content {
	height: 590px;
}
a {
	text-decoration: none;
}
</style>
<script type="text/javascript">
	function new_window() {
		//window.open("","_blank","height=200,width=300");

		alert("您已经是团队成员，不能重复添加！");
	}
</script>
</head>
<body>
	<div id="menu">团队列表</div>
	<div id="Content">
		<table align="center">
			<tr>
				<th>
					<%
						out.print("id号");
					%>
				</th>
				<th>
					<%
						out.print("团队名");
					%>
				</th>
				<th>
					<%
						out.print("团队单位");
					%>
				</th>
				<th>
					<%
						out.print("团队管理员");
					%>
				</th>
				<th>
					<%
						out.print("团队标签");
					%>
				</th>
				<th>
					<%
						out.print("申请加入");
					%>
				</th>
			</tr>
			<%
				String sql = "select * from `group`";
				ResultSet rs = groupCon.executeQuery(sql);
				;
				while (rs.next()) {
			%>
			<tr align="center">
				<td>
					<%
						String teamID = rs.getString("Group_ID");
							out.print(teamID);
							int i = -1;
							i++;
					%>
				</td>
				<td>
					<%
						out.print(rs.getString("Group_name"));
					%>
				</td>
				<td>
					<%
						out.print(rs.getString("Gp_unit"));
					%>
				</td>
				<td>
					<%
						String name = rs.getString("Group_manager");
							out.print(name);
					%>
				</td>
				<td>
					<%
						out.print(rs.getString("Gp_label"));
					%>
				</td>
				<td>
					<div id="status-button-70348" class="oper">
						<%
							String username = (String) session.getAttribute("username");
								// System.out.println( "teamID "+teamID+"username "+username);
								String sql2 = "select * from  `group_user` where group_ID ='" + teamID + "' && userName='" + username
										+ "'";
								ResultSet rsg2 = groupCon.executeQuery(sql2);
								if (name.equals(username) || rsg2.next()) {
						%>
						<a style="color: gray" href="javascript:void(0);"
							onclick="new_window()">加入团队</a>
						<%
							}
								else {
						%>
						<a class="joinToTeam btn-mini btn btn-success"
							href="joinGroup?teamId=<%=teamID%>">加入团队</a>
						<%
							}
						%>
					</div>
				</td>
			</tr>
			<%
				rsg2.close();
				}
				rs.close();
				test.Conn.close();
			%>
		</table>
	</div>
	<div id="footer" align="center">
		© 山西大学版权所有<br /> 计算机与信息技术学院 网络研究室
	</div>
</body>
</html>