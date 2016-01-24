<%@ page contentType="text/html; charset=gb2312" %>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
//驱动程序名
String driverName="com.mysql.jdbc.Driver";
//数据库用户名
String userName="root";
//密码
String userPasswd="111111";
//数据库名
String dbName="oa";
//表名
String tableName="oa_user";
//连接字符串
String url="jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd;
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn=DriverManager.getConnection(url);
Statement stmt=conn.createStatement();
out.print("连接成功");
//关闭连接、释放资源
stmt.close();
conn.close();
%>
