<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>团队</title>
<style type="text/css">
font {
	color: #ff0000;
}
#footer {
	height: 40px;
	background: #0080c0;
}
#menu {
	height: 30px;
	background: #0080c0;;
	margin-bottom: 2px;
}
a:visited {
	color: yellow;
}
a:hover {
	color: red;
	text-decoration: NONE;
}
</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<%
				request.setCharacterEncoding("utf-8");
				String Group_name = request.getParameter("Group_name");
				String Group_ID = request.getParameter("Group_ID");
				int id = Integer.parseInt(Group_ID);
			%>
			<font> 欢迎您来到:<%=Group_name%>(id号：<%=id%>)
			</font>
		</div>
		<br class="clearfloat" />
		<div id="menu">
			<a
				href="http://115.24.12.3:9001/p/<%=id%>?showControls=true&showChat=true&showLineNumbers=flase&useMonospaceFont=false"
				target="_blank">全屏显示</a>
		</div>
		<br class="clearfloat" />
		<div id="mainContent">
			<div id="content">

				<iframe name='embed_readwrite'
					src='http://115.24.12.3:9001/p/<%=id%>?showControls=true&showChat=true&showLineNumbers=flase&useMonospaceFont=false'
					width=1220 height=500> </iframe>
			</div>
			<div>
				<a target="_blank"
					href="http://shang.qq.com/wpa/qunwpa?idkey=58d91f9c98dd40080161cf9efb52326ddf93302d6a32856f68bec53e4b064862"><img
					border="0" src="http://pub.idqqimg.com/wpa/images/group.png"
					alt="计算机硕士交流群" title="计算机硕士交流群"></a>
			</div>
		</div>
		<br class="clearfloat" />
		<div id="footer" align="center">
			© 山西大学版权所有<br /> 计算机与信息技术学院 网络研究室
		</div>
	</div>
</body>
</html>
