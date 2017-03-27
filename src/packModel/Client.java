package packModel;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class Client {

	private String id;
	private String firstName;
	private String lastName;
	private String fatherName;
	private String phone;
	private String email;
	private String username;
	private String password;
	private Date dateOfBirth;
	private String gender;
	private String street;
	private String city;
	private String building;
	private Date lastConnexion;

	public Client() {
		// TODO Auto-generated constructor stub
		this.id = UUID.randomUUID().toString();
	}

	public Client(String id, String firstName, String lastName,
			String fatherName, String phone, String email, String username,
			String password, Date dateOfBirth, String gender, String street,
			String city, String building, Date lastConnexion) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.fatherName = fatherName;
		this.phone = phone;
		this.email = email;
		this.username = username;
		this.password = password;
		this.dateOfBirth = dateOfBirth;
		this.gender = gender;
		this.street = street;
		this.city = city;
		this.building = building;
		this.lastConnexion = lastConnexion;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName.trim();
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName.trim();
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName.trim();
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email.trim();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password.trim();
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender.trim();
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street.trim();
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city.trim();
	}

	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building.trim();
	}

	public Date getLastConnexion() {
		return lastConnexion;
	}

	public void setLastConnexion(Date lastConnexion) {
		this.lastConnexion = lastConnexion;
	}

	public String getInsertQuery(){

		String dateOfBirthStr = null;
		
		SimpleDateFormat sdfDOB = new SimpleDateFormat("yyyy-MM-dd");
		
		try{
			dateOfBirthStr = sdfDOB.format( this.dateOfBirth );
		}catch (Exception ex ){
			ex.printStackTrace();
		}

		String query = "INSERT INTO client VALUES "
				+ "('" + this.id.replace("'", "''") +  "','" + this.firstName.replace("'", "''") +  "',' "
				+ this.lastName.replace("'", "''") + "','" + this.fatherName.replace("'", "''") + "','" + this.phone.replace("'", "''") + "','"
				+ this.email.replace("'", "''") + "','" + this.username.replace("'", "''") + "','" + this.password.replace("'", "''") + "','"
				+ dateOfBirthStr + "','" + this.gender.replace("'", "''") + "','" + this.street.replace("'", "''") + "','"
				+ this.city.replace("'", "''") + "','" + this.building.replace("'", "''") + "',null);" ;
		return query;
	}

	public String getUpdateQuery(){
		String dateOfBirthStr = null;
		String lastConnexionStr = null;
		
		SimpleDateFormat sdfDOB = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdfLastConn = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		try{
			dateOfBirthStr = sdfDOB.format( this.dateOfBirth );
			lastConnexionStr = sdfLastConn.format(this.lastConnexion);
		}catch (Exception ex ){
			ex.printStackTrace();
		}

		String query = "UPDATE client SET first_name = '" + this.firstName.replace("'", "''") + "', "
				+ "last_name = '" + this.lastName.replace("'", "''") + "', father_name = '" + this.fatherName.replace("'", "''") + "', "
				+ "phone_number = '" + this.phone.replace("'", "''") + "', email = '" + this.email.replace("'", "''") + "', "
				+ "username = '" + this.username.replace("'", "''") + "', password = '" + this.password.replace("'", "''") + "', "
				+ "date_of_birth = '" + dateOfBirthStr + "', gender = '" + this.gender.replace("'", "''") + "', "
				+ "street = '" + this.street.replace("'", "''") + "', city = '" + this.city.replace("'", "''") + "', building = '" + this.building.replace("'", "''") + "', "
				+ "last_connexion = '" + lastConnexionStr + "' WHERE id = '" + this.id + "';";
		
		return query;
	}
	
	public String getRemoveQuery(){
		String query = "DELETE FROM client WHERE id='" + this.id + "';";
		
		return query;
		
	}
	
	public static String getSelectQuery(){
		String query = "SELECT * FROM client;";
		return query;
	}
	
	public static String getUpdateLastConnectionQuery(String clientId, Date date){
		String lastConnexionStr = null;

		SimpleDateFormat sdfLastConn = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		try{
			lastConnexionStr = sdfLastConn.format(date);
		}catch (Exception ex ){
			ex.printStackTrace();
		}

		String query = "UPDATE client SET last_connexion = '" + lastConnexionStr + "' "
				+ "WHERE id='" + clientId + "';";
		
		return query;
	}
}
