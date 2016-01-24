<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%
    

    // 连接字符串，格式： "jdbc:数据库驱动名称://数据库服务器ip/数据库名称?user=用户名&password=密码&使用Unicode=布尔值&字符编码=编码"
    String url = "jdbc:mysql://localhost/collocation";
    String username = "root";
    String password = "1234";

    Class.forName("com.mysql.jdbc.Driver").newInstance();

    Connection conn = DriverManager.getConnection(url, username, password); 
    Statement  stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    String sql = "select * from group";
    ResultSet  rs   = stmt.executeQuery(sql);
    while(rs.next()){
    	out.print(rs.getString(1));
    }
    rs.close();
    stmt.close();
    conn.close();
%>