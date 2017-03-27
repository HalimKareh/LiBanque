package packController;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import packModel.Account;
import packModel.Currency;
import packModel.Transaction;
import packModel.Transfer;
import packModel.TypeTransaction;
import packServices.Services;

/**
 * Servlet implementation class CreateTransfer
 */
public class CreateTransfer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateTransfer() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String fromAccountId = request.getParameter("source");
		String toAccountId = request.getParameter("destination");
		String amountStr = request.getParameter("amount");
		double amount;
		String clientId = request.getParameter("clientId");
		String details = request.getParameter("details");
		
		int success = 0;
		
		if (fromAccountId.equals(toAccountId)) {
			success = 0;
		}else{
			if ((fromAccountId!=null) && (toAccountId!=null) && (amountStr!=null) && (clientId!=null)) {
				amount = Double.valueOf(amountStr);

				Account fromAccount = Services.findAccountById(fromAccountId);
				Account toAccount = Services.findAccountById(toAccountId);

				if (fromAccount.getAmount()>= amount) {

					Currency fromCurrency = Services.findCurrencyById(fromAccount.getCurrencyId());
					Currency toCurrency = Services.findCurrencyById(toAccount.getCurrencyId());

					double rateFromCurrency = fromCurrency.getRateInDollar();
					double rateToCurrency = toCurrency.getRateInDollar();

					double toAccountAmountInUSD = toAccount.getAmount() * rateToCurrency;
					double transferAmountInUSD = amount * rateFromCurrency;

					double result = toAccountAmountInUSD + transferAmountInUSD;
					result = result / rateToCurrency;
					
					double addedSum = (Math.round(((amount*rateFromCurrency) / rateToCurrency)*100))/100;
					
					result = Math.round(result * 100);
					result = result/100;

					fromAccount.setAmount(fromAccount.getAmount()-amount);

					toAccount.setAmount(result);

					Services.updateAccount(fromAccount);
					Services.updateAccount(toAccount);
					
					Transfer transfer = new Transfer();
					transfer.setFromAccountId(fromAccountId);
					transfer.setToAccountId(toAccountId);
					transfer.setDateOfTransfare(new Date());
					transfer.setAmount(amount);
					transfer.setClientId(clientId);

					Services.insertTransfer(transfer);

					TypeTransaction deposit = null, withdrawal = null;

					for(TypeTransaction tt: Services.findAllTypeTransaction()){
						if (tt.getName().trim().toLowerCase().equals("deposit")) {
							deposit = tt;
						}else if(tt.getName().trim().toLowerCase().equals("withdrawal")){
							withdrawal = tt;
						}
					}

					Transaction transactionFromAccount = new Transaction();
					Transaction transactionToAccount = new Transaction();

					transactionFromAccount.setAccountId(fromAccountId);
					transactionFromAccount.setAmount(amount);
					transactionFromAccount.setDateOfTransaction(transfer.getDateOfTransfare());
					transactionFromAccount.setDetails(details==null?"Transfer":details.trim().equals("")?"Transfer":"Transfer - " + details);
					transactionFromAccount.setTypeTransactionId(withdrawal.getId());

					transactionToAccount.setAccountId(toAccountId);
					transactionToAccount.setAmount(addedSum);
					transactionToAccount.setDateOfTransaction(transfer.getDateOfTransfare());
					transactionToAccount.setDetails(details==null?"Transfer":details.trim().equals("")?"Transfer":"Transfer - " + details);
					transactionToAccount.setTypeTransactionId(deposit.getId());
					
					Services.insertTransaction(transactionToAccount);
					Services.insertTransaction(transactionFromAccount);
					
					//Transfer Made
					success = 1;
				}else{
					//Insufficient funds
					success = 3;
				}
			}else{
				//Null values in inputs
				success = 2;
			}
		}
		response.sendRedirect("transfers.jsp?success=" + success);
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
