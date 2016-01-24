package test;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;

public class login extends HttpServlet { // 登陆类
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("username");
		String pws = request.getParameter("password");
		try {
			Conn conn = new Conn();
			System.out.println("name:" + name);
			System.out.println("pws:" + pws);
			String sql = "select * from user where username='" + name + "' and userpass='" + pws + "'";
			ResultSet rs = conn.executeQuery(sql);
			if (rs.next()) {
				rs.first();
				String num = rs.getString("login_count");
				System.out.println("输出测试次数：" + num);
				if (num.equals("")) {
					num = "0";
					System.out.println("输出测试次数：" + num);
				}
				int number = Integer.parseInt(num);
				number = number + 1;
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String Add_time = formatter.format(new java.util.Date());
				String sq = "update user set login_count='" + number + "',login_time='" + Add_time
						+ "' where username='" + name + "'";
				conn.Exec(sq);
				HttpSession session = request.getSession(true);
				session.setAttribute("username", name);
				response.sendRedirect("index.jsp");
			} else {
				System.out.println("用户名密码错误");
				response.sendRedirect("login.html");
			}
		} catch (Exception e) {
			out.print(e);
		}
	}
	public void destroy() {
	}
}