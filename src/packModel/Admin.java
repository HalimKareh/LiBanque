package packModel;

import java.util.UUID;

public class Admin {

	private String id;
	private String clientId;
	
	public Admin() {
		// TODO Auto-generated constructor stub
		this.id = UUID.randomUUID().toString();
	}
	
	public Admin(String id, String clientId) {
		this.id = id;
		this.clientId = clientId;
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
		this.clientId = clientId;
	}

	public String getInsertQuery(){
		String query = "INSERT INTO admins VALUES('"
				+ this.id.replace("'", "''") + "','" + this.clientId.replace("'", "''") + "');";
		
		return query;
	}
	
	public String getUpdateQuery(){
		String query = "UPDATE admins SET client_id = '" 
				+ this.clientId.replace("'", "''") + "' WHERE id='" + this.id.replace("'", "''") + "';";

		return query;
	}

	public String getRemoveQuery(){
		String query = "DELETE FROM admins WHERE id='" + this.id + "';";

		return query;

	}
	
	public static String getSelectQuery(){
		String query = "SELECT * FROM admins;";
		return query;
	}
	
}
