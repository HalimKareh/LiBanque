package packController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import packModel.Account;
import packServices.Services;

/**
 * Servlet implementation class CreateAccount
 */
public class CreateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			String clientId = request.getParameter("clientId");
			String accountTypeId = request.getParameter("type");
			String currencyId = request.getParameter("currency");
			String amount = request.getParameter("amount");
			
			if ((clientId.equals("Select Client...")) 
					|| (accountTypeId.equals("Select Type...")) 
					|| (currencyId.equals("Select Currency..."))) {
				response.sendRedirect("create_account.jsp?success=0");
			}else if(Double.isNaN(Double.valueOf(amount)) ){
				response.sendRedirect("create_account.jsp?success=0");
			}else{
				Account account = new Account();
				account.setClientId(clientId);
				account.setTypeAccountId(accountTypeId);
				account.setCurrencyId(currencyId);
				account.setAmount(Double.valueOf(amount));
				
				Services.insertAccount(account);
				
				response.sendRedirect("create_account.jsp?success=1");
			}
		} catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect("create_account.jsp?success=0");
		}
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

}
