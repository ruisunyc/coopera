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
<title>查找团队</title>
<link rel="stylesheet" href="layout.css" type="text/css" />
<style type="text/css">
table {
	width: 800px;
	border: solid #ffffff border-width:1px 0px 0px 1px;
}
th {
	height: 30px;
	border: solid #ffffff;
	border-width: 1px 1px 1px 0px;
}
td {
	height: 30px;
	border: solid #ffffff;
	border-width: 0px 1px 1px 0px;
}
tr {
	border: 1px #ffffff solid;
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
	margin-top: 50px;
}
a {
	text-decoration: none;
}
body {
	background-color: #b9d8f3;
	width: 100%;
}
</style>
<script type="text/javascript">
	function new_window() {
		//window.open("","_blank","height=200,width=300");

		alert("您已经是团队成员，不能重复添加！");
	}
</script>
<script type="text/javascript">
	function dela(s) {
		//alert("您是团队管理员，确认将解散团队，是否确认?");
		if (confirm("您将要删除团队，是否确认?")) {//如果是true ，那么就把页面转向
			location.href = s;
		}
	}
</script>
</head>
<body>
	<div id="Content">
		<table align="center">
			<tr>
				<th style="border-left: solid #ffffff; border-left-width: 1px;">
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
						out.print("操作");
					%>
				</th>
			</tr>
			<%
				String sql = "select * from `group`";
				ResultSet rs = groupCon.executeQuery(sql);
				while (rs.next()) {
			%>
			<tr align="center">
				<td style="border-left: solid #ffffff; border-left-width: 1px;">
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

				<td><a href="javascript:void(0);"
					onclick='dela("DeleteGroup?group_ID=<%=teamID%>")'>删除团队</a></td>
			</tr>
			<%
				}
				rs.close();
				test.Conn.close();
			%>
		</table>
</body>
</html>