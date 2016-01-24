package sysadmins.users;
import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import test.Conn;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/sysadmins/users/DeleteUser")
public class DeleteUser extends HttpServlet {//管理用户
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.service(request, response);
		request.setCharacterEncoding("utf-8");
		String user_ID = request.getParameter("user_ID");
		Conn conn = new Conn();
		ResultSet set = null;
		String sql = "select * from `user` where ID='" + user_ID + "'";
		try {
			set = conn.executeQuery(sql);
			while (set.next()) {
				sql = "delete from `user` where ID='" + user_ID + "'";
				conn.Exec(sql);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			response.sendRedirect("searchUsers.jsp");
		}

	}

}
