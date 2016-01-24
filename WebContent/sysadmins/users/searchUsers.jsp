<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"
	import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<title>查找用户</title>
<link rel="stylesheet" href="layout.css" type="text/css" />
<style type="text/css">
body {
	background-color: #b9d8f3;
	width: 100%;
}
#Content {
	margin-left: 80px;
	float: left;
}
table {
	margin-top: 100px;
	width: 800px;
	margin-left: 0px;
	border-top: 1px;
	border-right: 0px;
	border-bottom: 0px;
	border-left: 1px;
	border-style: solid;
	border-color: #ffffff;
	cellpadding: 0;
	cellspacing: 0;
}
th {
	height: 30px;
	border: solid #ffffff;
	border-width: 0px 1px 1px 0px;
}
td {
	height: 30px;
	border: solid #ffffff;
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
#search {
	margin-top: 0px;
	color: blue;
	width: 1200px;;
	height: 30px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
</style>
<script type="text/javascript">
	function new_window() {
		//window.open("","_blank","height=200,width=300");

		//alert("您已经是团队成员，不能重复添加！");
	}
</script>
<script type="text/javascript">
	function dela(s) {
		//alert("您是团队管理员，确认将解散团队，是否确认?");
		if (confirm("您将要删除用户，是否确认?")) {//如果是true ，那么就把页面转向
			location.href = s;
		}
	}
</script>
</head>
<body>
	<div id="Content">
		<table align="center">
			<th>
				<%
					out.print("id号");
				%>
			</th>
			<th>
				<%
					out.print("用户名");
				%>
			</th>
			<th>
				<%
					out.print("真实姓名");
				%>
			</th>
			<th>
				<%
					out.print("邮件");
				%>
			</th>
			<th>
				<%
					out.print("操作");
				%>
			</th>
			</tr>
			<%
				String sql = "select * from user ";
				ResultSet rs = con.executeQuery(sql);
				while (rs.next()) {
			%>
			<tr align="center">
				<td>
					<%
						String ID = rs.getString("ID");
							out.print(ID);
					%>
				</td>
				<td>
					<%
						String username = rs.getString("username");
							out.print(username);
					%>
				</td>
				<td>
					<%
						out.print(rs.getString("truename"));
					%>
				</td>
				<td>
					<%
						String name = rs.getString("mail");
							out.print(name);
					%>
				</td>
				<td><a href="javascript:void(0);"
					onclick='dela("DeleteUser?user_ID=<%=ID%>")'>删除用户</a></td>
			</tr>
			<%
				}
				rs.close();
				test.Conn.close();
			%>
		</table>
	</div>
</body>
</html>