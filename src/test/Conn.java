package test;
import java.sql.*;
public class Conn {//数据库连接类
	static Connection conn = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	public static synchronized Connection get() throws Exception {
		String driverName = "com.mysql.jdbc.Driver";
		String userName = "root";// 用户名
		String userPasswd = "1234";// 密码
		String dbName = "collocation";// 数据库名
		String url = "jdbc:mysql://115.24.12.3:3306/" + dbName;// 连接字符串
		Class.forName(driverName);
		conn = DriverManager.getConnection(url, userName, userPasswd);
		return conn;
	}
	public void Exec(String sql) {
		try {
			Connection conn = get();
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			System.out.print(e.toString());
		}
	}
	public ResultSet getRs(String sql) throws SQLException {
		try {
			Connection conn = get();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			return rs;
		} catch (Exception e) {
			System.out.print(e);
			return null;
		}
	}
	public ResultSet executeQuery(String sql) throws Exception {
		try {
			stmt = get().createStatement();
			rs = stmt.executeQuery(sql);
			return rs;
		} catch (SQLException ex) {
			System.out.println("sql.executeQuery:" + ex.getMessage());

			return rs;
		}
	}
	public static void close() {
		if (conn != null) {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
