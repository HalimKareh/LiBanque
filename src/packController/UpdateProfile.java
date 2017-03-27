package packController;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import packModel.Client;
import packServices.Services;

/**
 * Servlet implementation class UpdateProfile
 */
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
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
		// TODO Auto-generated method stub
		String firstName = request.getParameter("first");
		String lastName = request.getParameter("last");
		String fatherName = request.getParameter("father");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String street = request.getParameter("street");
		String city = request.getParameter("city");
		String building = request.getParameter("building");
		String dateOfBirthStr = request.getParameter("birthDate");
		Date dateOfBirth = null;
		try {
			dateOfBirth = new SimpleDateFormat("yyyy-MM-dd").parse(dateOfBirthStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession(true);
		Client client =  (Client) session.getAttribute("client");
		
		client.setFirstName(firstName);
		client.setLastName(lastName);
		client.setFatherName(fatherName);
		client.setPhone(phone);
		client.setGender(gender);
		client.setStreet(street);
		client.setCity(city);
		client.setBuilding(building);
		client.setDateOfBirth(dateOfBirth);
		client.setEmail(email);
		client.setLastConnexion(new Date());
		
		Services.updateClient(client);
		
		response.sendRedirect("edit_profile.jsp?success=1");
		
	}
	

}
