package test;

import java.sql.*;

public class DBManager {
   public static void main(String[] args) {
	   String url = "jdbc:mysql://localhost/collocation";
	    String username = "root";
	    String password = "1234";

	    try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			 Connection conn = DriverManager.getConnection(url, username, password); 
			    Statement  stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			    String sql = "select * from `group`";
			    ResultSet  rs   = stmt.executeQuery(sql);
			    while(rs.next()){
			    	System.out.println(rs.getString(1));
			    }
			    rs.close();
			    stmt.close();
			    conn.close();
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	   
}
}
