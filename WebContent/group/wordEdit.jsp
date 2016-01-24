<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
String Group_ID = request.getParameter("Group_ID");
if(Group_ID==null){
	Group_ID="0";
	
}

int id = Integer.parseInt(Group_ID);




%>
<body>
<iframe name='embed_readwrite' 
src='http://115.24.12.3:9001/p/"+<%=id%>+"?showControls=true&showChat=true&showLineNumbers=true&useMonospaceFont=false' 
width=100% height=600></iframe>

</body>
</html>