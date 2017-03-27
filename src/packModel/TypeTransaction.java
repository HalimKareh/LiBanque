package packModel;

import java.util.UUID;

public class TypeTransaction {

	private String id;
	private String name;
	
	public TypeTransaction() {
		// TODO Auto-generated constructor stub
		this.id = UUID.randomUUID().toString();
	}

	public TypeTransaction(String id, String name) {
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
		String query = "INSERT INTO type_transaction VALUES('"
				+ this.id + "','" + this.name.replace("'", "''") + "');";
		
		return query;
	}
	
	public String getUpdateQuery(){
		String query = "UPDATE type_transaction SET name = '" 
				+ this.name.replace("'", "''") + "' WHERE id='" + this.id + "';";

		return query;
	}

	public String getRemoveQuery(){
		String query = "DELETE FROM type_transaction WHERE id='" + this.id + "';";

		return query;

	}
	
	public static String getSelectQuery(){
		String query = "SELECT * FROM type_transaction;";
		return query;
	}
}
