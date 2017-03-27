package packModel;

import java.util.UUID;

public class Account {

	private String id;
	private String clientId;
	private String typeAccountId;
	private double amount;
	private String currencyId;
	
	public Account() {
		// TODO Auto-generated constructor stub
		this.id = UUID.randomUUID().toString();
	}

	public Account(String id, String clientId, String typeAccountId,
			double amount, String currencyId) {
		super();
		this.id = id;
		this.clientId = clientId;
		this.typeAccountId = typeAccountId;
		this.amount = (Math.round(amount*100)/100);
		this.currencyId = currencyId;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId.trim();
	}

	public String getTypeAccountId() {
		return typeAccountId;
	}

	public void setTypeAccountId(String typeAccountId) {
		this.typeAccountId = typeAccountId.trim();
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = (Math.round(amount*100)/100);
	}

	public String getCurrencyId() {
		return currencyId;
	}

	public void setCurrencyId(String currencyId) {
		this.currencyId = currencyId.trim();
	}
	
	public String getInsertQuery(){
		
		String query = "INSERT INTO account VALUES "
				+ "('" + this.id.replace("'", "''") +  "','" 
				+ this.clientId.replace("'", "''") +  "','"
				+ this.typeAccountId.replace("'", "''") 
				+ "'," + this.amount + ",'" 
				+ this.currencyId.replace("'", "''") + "');" ;
		return query;
	}

	public String getUpdateQuery(){

		String query = "UPDATE account SET client_id = '" + this.clientId + "', "
				+ "type_account_id = '" + this.typeAccountId.replace("'", "''")
				+ "', amount = " + this.amount + ", "
				+ "currency_id = '" + this.currencyId.replace("'", "''") + "'"
				+ " WHERE id='" + this.id.replace("'", "''") + "';";
		
		return query;
	}
	
	public String getRemoveQuery(){
		String query = "DELETE FROM account WHERE id='" + this.id + "';";
		
		return query;
		
	}

	public static String getSelectQuery(){
		String query = "SELECT * FROM account;";
		return query;
	}
	
}
