package packController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import packModel.Account;
import packModel.Client;
import packModel.Transaction;
import packModel.Transfer;
import packServices.Services;

/**
 * Servlet implementation class DeleteClient
 */
public class DeleteClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteClient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String clientId = request.getParameter("clientId");
		
		Client client = Services.clientFindById(clientId);
		
		for(Transfer t : Services.findTransferByClientId(clientId)){
			Services.removeTransfer(t);
		}
		
		ArrayList<Account> accounts = Services.findAccountByClient(client);
		
		for (Account account : accounts){
			for(Transaction t : Services.findTransactionByAccountId(account.getId())){
				Services.removeTransaction(t);
			}
			Services.removeAccount(account);
		}
		
		Services.removeClient(client);
		response.sendRedirect("edit_delete.jsp?success=1");
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
