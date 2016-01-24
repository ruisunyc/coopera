<%@ page contentType="text/html; charset=utf-8"  %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>团队</title>


</head>

<body>
<div id="container">
  <div id="header">
<%
String Group_name= request.getParameter("Group_name");
out.print(Group_name);
%>
  </div>
  <br class="clearfloat" />
  <div id="menu">
  消息  
  </div>
  <br class="clearfloat" />
  <div id="mainContent">
    <div id="sidebar"> <br />
     
    </div>
    <div id="content">
    </div>
  </div>
  <br class="clearfloat" />
  <div id="footer"></div>
</div>
</body>
</html>
