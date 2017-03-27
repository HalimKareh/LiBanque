package packModel;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class Transaction {
	
	private String id;
	private String accountId;
	private String typeTransactionId;
	private double amount;
	private String details;
	private Date dateOfTransaction;
	
 	public Transaction() {
		// TODO Auto-generated constructor stub
		this.id = UUID.randomUUID().toString();
	}

	public Transaction(String id, String accountId, String typeTransactionId,
			double amount, String details, Date dateOfTransaction) {
		super();
		this.id = id;
		this.accountId = accountId;
		this.typeTransactionId = typeTransactionId;
		this.amount = ( Math.round( amount * 100 ) / 100 );
		this.details = details;
		this.dateOfTransaction = dateOfTransaction;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getTypeTransactionId() {
		return typeTransactionId;
	}

	public void setTypeTransactionId(String typeTransactionId) {
		this.typeTransactionId = typeTransactionId;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = ( Math.round( amount * 100 ) / 100 );
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details.trim();
	}

	public Date getDateOfTransaction() {
		return dateOfTransaction;
	}

	public void setDateOfTransaction(Date dateOfTransaction) {
		this.dateOfTransaction = dateOfTransaction;
	}

	public String getInsertQuery(){

		String dateOfTransactionStr = null;

		SimpleDateFormat sdfDOB = new SimpleDateFormat("yyyy-MM-dd");

		try{
			dateOfTransactionStr = sdfDOB.format( this.dateOfTransaction );
		}catch (Exception ex ){
			ex.printStackTrace();
		}

		String query = "INSERT INTO transaction VALUES "
				+ "('" + this.id +  "','" + this.accountId.replace("'", "''") +  "','"
				+ this.typeTransactionId.replace("'", "''") + "','" + dateOfTransactionStr +  "'," 
				+ this.amount +  ",'" + this.details.replace("'", "''") + "');" ;
		return query;
	}

	public String getUpdateQuery(){

		String dateOfTransactionStr = null;

		SimpleDateFormat sdfDOB = new SimpleDateFormat("yyyy-MM-dd");

		try{
			dateOfTransactionStr = sdfDOB.format( this.dateOfTransaction );
		}catch (Exception ex ){
			ex.printStackTrace();
		}
		
		String query = "UPDATE transaction SET account_id = '" + this.accountId + "', "
				+ "type_transaction_id = '" + this.typeTransactionId + "', "
				+ "date_of_transaction = '" + dateOfTransactionStr + "', "
				+ "amount = " + this.amount + ", "
				+ "details = '" + this.details.replace("'", "''") + "'"
				+ " WHERE id='" + this.id + "';";

		return query;
	}

	public String getRemoveQuery(){
		String query = "DELETE FROM transaction WHERE id='" + this.id + "';";

		return query;
	}

	public static String getSelectQuery(){
		String query = "SELECT * FROM transaction;";
		return query;
	}

}
