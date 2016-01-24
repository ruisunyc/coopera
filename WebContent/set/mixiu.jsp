<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
  String oldpassword=request.getParameter("oldpassword");
  String newpassword=request.getParameter("newpassword");
  String name=(String)session.getAttribute("username");
  String sql="select * from user where username='"+name+"' and userpass='"+oldpassword+"'";
  ResultSet rs=con.getRs(sql);
  if(rs.next()){
          String sq="update user set userpass='"+newpassword+"' where username='"+name+"'";
          con.Exec(sq);
          out.print("1");
      }
  else{
          out.print("0");
    }
%>