package sysadmins.group;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import test.Conn;
/**
 * Servlet implementation class AddGroup
 */
@WebServlet("/sysadmins/group/AddGroup")
public class AddGroup extends HttpServlet {//后台添加团队
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGroup() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
	       PrintWriter out=response.getWriter();
	       request.setCharacterEncoding("utf-8");
	       String teamName=request.getParameter("teamName");
	       String teamId=request.getParameter("teamUnit");
	       String teamDescription=request.getParameter("teamDescription");
	       HttpSession session=request.getSession(false);
	       String name=(String)session.getAttribute("currentusername"); 
	       System.out.println("team:"+ name);
	       if(name!=null){
	      try{
	          Conn conn=new Conn(); 
	          String sql="insert into `group` (Group_name,Gp_unit,Group_manager,Gp_label) values('"+teamName+"','"+teamId+"','"+name+"','"+teamDescription+"')"; 
	          conn.Exec(sql);
	          System.out.println("\n创建团队成功");
	          sql = "select Group_ID from `group` where Group_manager='"+name+"' && Gp_unit='"+teamId +"' && Gp_label='"+teamDescription +"' ";
	         ResultSet set=  conn.executeQuery(sql);
	          while(set.next()){
	        	   int gp_id =set.getInt("Group_ID");
	        	   System.out.println(gp_id);
	        	   sql="insert into `group_user` (group_ID,userName,role) values('"+gp_id+"','"+name+"','管理员')"; 
	        	   conn.Exec(sql);
	        	 
	           }
	           response.sendRedirect("searchGroup.jsp");
	         }
	       catch(Exception e){
	              out.print(e);
	           }
	       }
	}

}
