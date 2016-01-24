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
request.setCharacterEncoding("UTF-8");
String name=(String)session.getAttribute("username");
String truename=request.getParameter("truename");
String sex=request.getParameter("sex");
String mail=request.getParameter("mail");
String phone=request.getParameter("phone");
String direction=request.getParameter("direction");
String unit = request.getParameter("unit");
String dept=request.getParameter("dept");
String address=request.getParameter("address");
String sql="update user set truename='"+truename+"',sex='"+sex+"',mail='"+mail+"',phone='"+phone+"',direction='"+direction+"',unit='"+unit+"',dept='"+dept+"',address='"+address+"' where username='"+name+"' ";
System.out.print(sql);
con.Exec(sql);
out.print("1");
%>