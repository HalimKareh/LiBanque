package packController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import packModel.Admin;
import packModel.Client;
import packServices.Services;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Client client = Services.clientFindByUsername(username);
		
		if (client!=null) {
			if (client.getPassword().equals(password)) {
				System.out.println("Login good");
				HttpSession session = request.getSession(true);
				session.setAttribute("client", client);
				Admin admin = Services.isAdmin(client);
				if (admin!=null) {
					session.setAttribute("admin", admin);
				}
				Services.updateClientLastConnection(client);
				response.sendRedirect("index.jsp");
			}else{
				//				System.out.println("Login bad");
				response.sendRedirect("login.jsp?Error_Message=1&username=" + username);
			}
		}else{
			//			System.out.println("Login bad");
			response.sendRedirect("login.jsp?Error_Message=1&username=" + username);
		}
	}

}
