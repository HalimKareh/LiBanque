package packController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import packModel.Account;
import packModel.Transaction;
import packModel.TypeTransaction;
import packServices.Services;

/**
 * Servlet implementation class CreateTransaction
 */
public class CreateTransaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTransaction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String typeTransactionId = request.getParameter("type");
		String amountStr = request.getParameter("amount");
		String details = request.getParameter("details");
		String accountId = request.getParameter("accountId");
		
		Account account = Services.findAccountById(accountId);
		
		double amount = Double.valueOf(amountStr);
		
		ArrayList<TypeTransaction> allTransactionTypes = Services.findAllTypeTransaction();
		
		Transaction transaction = new Transaction();
		transaction.setAccountId(accountId);
		transaction.setTypeTransactionId(typeTransactionId);
		transaction.setDateOfTransaction(new Date());
		transaction.setAmount(amount);
		transaction.setDetails(details);
		
		String success = "2";
		for(TypeTransaction tt : allTransactionTypes){
			if (tt.getId().equals(typeTransactionId)) {
				switch (tt.getName().toLowerCase().trim()) {
				case "deposit":
					account.setAmount(account.getAmount()+amount);
					success = "1";
					break;
				case "withdrawal":
					if (account.getAmount() < amount) {
						success = "0";
					}else{
						account.setAmount(account.getAmount()+amount);
						success = "1";
					}
					break;
				default:
					break;
				}
				break;
			}
		}
		Services.insertTransaction(transaction);
		Services.updateAccount(account);
		response.sendRedirect("transactions.jsp?accountId=" + accountId + "&success=" + success);
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
