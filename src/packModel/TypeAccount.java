package packModel;

import java.util.UUID;

public class TypeAccount {

	private String id;
	private String name;
	
	public TypeAccount() {
		// TODO Auto-generated constructor stub
		this.id = UUID.randomUUID().toString();
	}

	public TypeAccount(String id, String name) {
		super();
		this.id = id;
		this.name = name;
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
	
	public String getInsertQuery(){
		String query = "INSERT INTO type_account VALUES('"
				+ this.id + "','" + this.name.replace("'", "''") + "');";
		
		return query;
	}
	
	public String getUpdateQuery(){
		String query = "UPDATE type_account SET name = '" 
				+ this.name.replace("'", "''") + "' WHERE id='" + this.id + "';";

		return query;
	}

	public String getRemoveQuery(){
		String query = "DELETE FROM type_account WHERE id='" + this.id + "';";

		return query;

	}

	public static String getSelectQuery(){
		String query = "SELECT * FROM type_account;";
		return query;
	}
	
}
