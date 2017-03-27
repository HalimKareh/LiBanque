package packModel;

import java.util.UUID;

public class Currency {
	
	private String id;
	private String name;
	private String code;
	private double rateInDollar;
	
	public Currency() {
		// TODO Auto-generated constructor stub
		this.id = UUID.randomUUID().toString();
	}

	public Currency(String id, String name, String code, double rateInDollar) {
		super();
		this.id = id;
		this.name = name;
		this.code = code;
		this.rateInDollar = rateInDollar;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name.trim();
	}

	public double getRateInDollar() {
		return rateInDollar;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code.trim();
	}

	public void setRateInDollar(double rateInDollar) {
		this.rateInDollar = rateInDollar;
	}

	public String getInsertQuery(){
		
		String query = "INSERT INTO currency VALUES "
				+ "('" + this.id +  "','" + this.name.replace("'", "''") +  "',"
				+ this.rateInDollar + ",'" + this.code.replace("'", "''") + "');" ;
		return query;
	}

	public String getUpdateQuery(){

		String query = "UPDATE currency SET name = '" + this.name.replace("'", "''") + "', "
				+ "rate_in_dollar = " + this.rateInDollar + ", code = '" + this.code.replace("'", "''") + "'"
				+ " WHERE id='" + this.id + "';";
		
		return query;
	}
	
	public String getRemoveQuery(){
		String query = "DELETE FROM currency WHERE id='" + this.id + "';";
		
		return query;	
	}
	
	public static String getSelectQuery(){
		String query = "SELECT * FROM currency;";
		return query;
	}

}
