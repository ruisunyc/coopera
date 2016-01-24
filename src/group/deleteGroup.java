package group;
import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import test.Conn;
/**
 * Servlet implementation class deleteGroup
 */
@WebServlet("/group/deleteGroup")
public class deleteGroup extends HttpServlet {//删除团队
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public deleteGroup() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String Group_role = request.getParameter("Group_role");
		String group_ID = request.getParameter("group_ID");
		String id = request.getParameter("id");
		// System.out.println("Group_role:"+Group_role);
		// System.out.println("group_ID:"+group_ID);
		// System.out.println("id:"+id);
		Conn conn = new Conn();
		ResultSet set = null;
		if (Group_role.equals("管理员")) {
			String sql = "select * from `group` where group_ID='" + group_ID + "'";
			try {
				set = conn.executeQuery(sql);
				while (set.next()) {
					sql = "delete from `group` where group_ID='" + group_ID + "'";
					conn.Exec(sql);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
			}

		} else {
			String sql = "delete from `group_user` where id='" + id + "'";
			conn.Exec(sql);
		}
		response.sendRedirect("Mygroup.jsp");
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

}
