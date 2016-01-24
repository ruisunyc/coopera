<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*"%>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%!
  public String getS(String str){
       try{
              byte b[]=str.getBytes("ISO-8859-1");
              str=new String(b,"UTF-8");
               return str;
          }
         catch(Exception e){
             return "error";
         }
  }
%>
<%
String name=(String)session.getAttribute("name");
String status=request.getParameter("status");
status=getS(status);
String sql="update oa_user set status='"+status+"' where zhangh='"+name+"'";
con.Exec(sql);
out.print("1");
%>