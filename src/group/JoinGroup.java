package group;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import test.Conn;
/**
 * Servlet implementation class JoinGroup
 */
@WebServlet("/group/joinGroup")
public class JoinGroup extends HttpServlet {//加入团队
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JoinGroup() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String teamId = request.getParameter("teamId");

		HttpSession session = request.getSession(false);
		String name = (String) session.getAttribute("username");
		System.out.println("team:" + name);
		try {
			Conn conn = new Conn();
			if (name != null) {
				String sql = "insert into `group_user` (group_ID,userName,role) values('" + teamId + "','" + name
						+ "','普通用户')";
				conn.Exec(sql);
				System.out.println("\n加入团队成功");
			}
			response.sendRedirect("Mygroup.jsp");
		} catch (Exception e) {
			out.print(e);
		}
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
