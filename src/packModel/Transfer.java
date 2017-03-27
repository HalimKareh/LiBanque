package packModel;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class Transfer {
	
	private String id;
	private String clientId;
	private String fromAccountId;
	private String toAccountId;
	private Date dateOfTransfare;
	private double amount;
	
	public Transfer() {
		// TODO Auto-generated constructor stub
		this.id = UUID.randomUUID().toString();
	}

	public Transfer(String id, String clientId, String fromAccountId, String toAccountId,
			Date dateOfTransfare, double amount) {
		super();
		this.id = id;
		this.clientId = clientId;
		this.fromAccountId = fromAccountId;
		this.toAccountId = toAccountId;
		this.dateOfTransfare = dateOfTransfare;
		this.amount = ( Math.round( amount * 100 ) / 100 );
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFromAccountId() {
		return fromAccountId;
	}

	public void setFromAccountId(String fromAccountId) {
		this.fromAccountId = fromAccountId;
	}

	public String getToAccountId() {
		return toAccountId;
	}

	public void setToAccountId(String toAccountId) {
		this.toAccountId = toAccountId;
	}

	public Date getDateOfTransfare() {
		return dateOfTransfare;
	}

	public void setDateOfTransfare(Date dateOfTransfare) {
		this.dateOfTransfare = dateOfTransfare;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = ( Math.round( amount * 100 ) / 100 );
	}

	public String getInsertQuery(){

		String dateOfTransferStr = null;

		SimpleDateFormat sdfDOB = new SimpleDateFormat("yyyy-MM-dd");

		try{
			dateOfTransferStr = sdfDOB.format( this.dateOfTransfare );
		}catch (Exception ex ){
			ex.printStackTrace();
		}

		String query = "INSERT INTO transfer VALUES "
				+ "('" + this.id +  "','" + this.fromAccountId +  "','"
				+ this.toAccountId + "','" + dateOfTransferStr +  "'," 
				+ this.amount + ",'" + this.clientId + "');" ;
		return query;
	}

	public String getUpdateQuery(){

		String dateOfTransferStr = null;

		SimpleDateFormat sdfDOB = new SimpleDateFormat("yyyy-MM-dd");

		try{
			dateOfTransferStr = sdfDOB.format( this.dateOfTransfare );
		}catch (Exception ex ){
			ex.printStackTrace();
		}
		
		String query = "UPDATE transfer SET from_account_id = '" + this.fromAccountId + "', "
				+ "to_account_id = '" + this.toAccountId + "', "
				+ "date_of_transfer = '" + dateOfTransferStr + "', "
				+ "amount = " + this.amount + ", client_id='" + this.clientId + "' "
				+ "WHERE id='" + this.id + "';";

		return query;
	}

	public String getRemoveQuery(){
		String query = "DELETE FROM transfer WHERE id='" + this.id + "';";

		return query;

	}
	
	public static String getSelectQuery(){
		String query = "SELECT * FROM transfer;";
		return query;
	}

	public String getClientId() {
		return clientId;
	}
	
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

}
