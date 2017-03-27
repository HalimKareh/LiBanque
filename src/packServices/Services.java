package packServices;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import packModel.Account;
import packModel.Admin;
import packModel.Client;
import packModel.Currency;
import packModel.Transaction;
import packModel.Transfer;
import packModel.TypeAccount;
import packModel.TypeTransaction;

//This class contains the following functions
//The find all "entity" which is the select * from table
//The insert Object which is the insert query in SQL
//The update Object which is the update query in SQL
//The remove Object which is the delete query in SQL

public class Services {

	public static ArrayList<Client> findAllClient() {
		ArrayList<Client> list = new ArrayList<Client>();

		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st.executeQuery(Client.getSelectQuery());

			while (rs.next()) {
				String id = rs.getString("id");
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String fatherName = rs.getString("father_name");
				String phone = rs.getString("phone_number");
				String email = rs.getString("email");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String gender = rs.getString("gender");
				String street = rs.getString("street");
				String city = rs.getString("city");
				String building = rs.getString("building");
				Date dateOfBirth = rs.getDate("date_of_birth");
				String lastConnexionStr = rs.getString("last_connexion");
				Date lastConnexion = null;
				try {
					lastConnexion = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(lastConnexionStr);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				Client client = new Client(id, firstName, lastName, fatherName, phone, email, username, password,
						dateOfBirth, gender, street, city, building, lastConnexion);
				list.add(client);
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static Client insertClient(Client client) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(client.getInsertQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return client;
	}

	public static Client updateClient(Client client) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeUpdate(client.getUpdateQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return client;
	}

	public static void removeClient(Client client) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(client.getRemoveQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static ArrayList<Account> findAllAccount() {
		ArrayList<Account> list = new ArrayList<Account>();

		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st.executeQuery(Account.getSelectQuery());

			while (rs.next()) {
				String id = rs.getString("id");
				String clientId = rs.getString("client_id");
				String typeAccountId = rs.getString("type_account_id");
				double amount = rs.getDouble("amount");
				String currencyId = rs.getString("currency_id");

				Account account = new Account(id, clientId, typeAccountId, amount, currencyId);

				list.add(account);
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static Account insertAccount(Account account) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(account.getInsertQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return account;
	}

	public static Account updateAccount(Account account) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(account.getUpdateQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return account;
	}

	public static void removeAccount(Account account) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(account.getRemoveQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static ArrayList<Currency> findAllCurrency() {
		ArrayList<Currency> list = new ArrayList<Currency>();

		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st.executeQuery(Currency.getSelectQuery());

			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				double rateInDollar = rs.getDouble("rate_in_dollar");
				String code = rs.getString("code");

				Currency currency = new Currency(id, name, code, rateInDollar);

				list.add(currency);
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static Currency insertCurrency(Currency currency) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(currency.getInsertQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return currency;
	}

	public static Currency updateCurrency(Currency currency) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(currency.getUpdateQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return currency;
	}

	public static void removeCurrency(Currency currency) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(currency.getRemoveQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static ArrayList<Transaction> findAllTransaction() {
		ArrayList<Transaction> list = new ArrayList<Transaction>();

		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st.executeQuery(Transaction.getSelectQuery());

			while (rs.next()) {
				String id = rs.getString("id");
				String accountId = rs.getString("account_id");
				String typeTransactionId = rs.getString("type_transaction_id");
				Date dateOfTransaction = rs.getDate("date_of_transaction");
				double amount = rs.getDouble("amount");
				String details = rs.getString("details");

				Transaction transaction = new Transaction(id, accountId, typeTransactionId, amount, details,
						dateOfTransaction);

				list.add(transaction);
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static Transaction insertTransaction(Transaction transaction) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(transaction.getInsertQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return transaction;
	}

	public static Transaction updateTransaction(Transaction transaction) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(transaction.getUpdateQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return transaction;
	}

	public static void removeTransaction(Transaction transaction) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(transaction.getRemoveQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static ArrayList<Transfer> findAllTransfer() {
		ArrayList<Transfer> list = new ArrayList<Transfer>();

		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st.executeQuery(Transfer.getSelectQuery());

			while (rs.next()) {
				String id = rs.getString("id");
				String clientId = rs.getString("client_id");
				String fromAccountId = rs.getString("from_account_id");
				String toAccountId = rs.getString("to_account_id");
				Date dateOfTransfare = rs.getDate("date_of_transfer");
				double amount = rs.getDouble("amount");

				Transfer transfer = new Transfer(id, clientId, fromAccountId, toAccountId, dateOfTransfare, amount);

				list.add(transfer);
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static Transfer insertTransfer(Transfer transfer) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(transfer.getInsertQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return transfer;
	}

	public static Transfer updateTransfer(Transfer transfer) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(transfer.getUpdateQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return transfer;
	}

	public static void removeTransfer(Transfer transfer) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(transfer.getRemoveQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static ArrayList<TypeAccount> findAllTypeAccount() {
		ArrayList<TypeAccount> list = new ArrayList<TypeAccount>();

		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st.executeQuery(TypeAccount.getSelectQuery());

			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");

				TypeAccount typeAccount = new TypeAccount(id, name);

				list.add(typeAccount);
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static TypeAccount insertTypeAccount(TypeAccount typeAccount) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(typeAccount.getInsertQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return typeAccount;
	}

	public static TypeAccount updateTypeAccount(TypeAccount typeAccount) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(typeAccount.getUpdateQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return typeAccount;
	}

	public static void removeTypeAccount(TypeAccount typeAccount) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(typeAccount.getRemoveQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static ArrayList<TypeTransaction> findAllTypeTransaction() {
		ArrayList<TypeTransaction> list = new ArrayList<TypeTransaction>();

		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st.executeQuery(TypeTransaction.getSelectQuery());

			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");

				TypeTransaction typeTransaction = new TypeTransaction(id, name);

				list.add(typeTransaction);
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static TypeTransaction insertTypeTransaction(TypeTransaction typeTransaction) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(typeTransaction.getInsertQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return typeTransaction;
	}

	public static TypeTransaction updateTypeTransaction(TypeTransaction typeTransaction) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(typeTransaction.getUpdateQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return typeTransaction;
	}

	public static void removeTypeTransaction(TypeTransaction typeTransaction) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(typeTransaction.getRemoveQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Client clientFindById(String clientId) {

		Client client = null;

		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st.executeQuery(Client.getSelectQuery().replace(";", "") + " WHERE id ='" + clientId + "';");

			while (rs.next()) {
				String id = rs.getString("id");
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String fatherName = rs.getString("father_name");
				String phone = rs.getString("phone_number");
				String email = rs.getString("email");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String gender = rs.getString("gender");
				String street = rs.getString("street");
				String city = rs.getString("city");
				String building = rs.getString("building");
				Date dateOfBirth = rs.getDate("date_of_birth");
				Date lastConnexion = rs.getDate("last_connexion");

				client = new Client(id, firstName, lastName, fatherName, phone, email, username, password, dateOfBirth,
						gender, street, city, building, lastConnexion);
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return client;
	}

	public static Client clientFindByUsername(String clientUsername) {

		Client client = null;

		try {
			Statement st = ConnectionDB.connectToDataBase();

			String query = Client.getSelectQuery().replace(";", "") + " WHERE username = '" + clientUsername + "';";

			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
				String id = rs.getString("id");
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String fatherName = rs.getString("father_name");
				String phone = rs.getString("phone_number");
				String email = rs.getString("email");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String gender = rs.getString("gender");
				String street = rs.getString("street");
				String city = rs.getString("city");
				String building = rs.getString("building");
				Date dateOfBirth = rs.getDate("date_of_birth");
				String lastConnexionStr = rs.getString("last_connexion");
				Date lastConnexion = null;
				try {
					lastConnexion = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(lastConnexionStr);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				client = new Client(id, firstName, lastName, fatherName, phone, email, username, password, dateOfBirth,
						gender, street, city, building, lastConnexion);
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return client;
	}

	public static ArrayList<Account> findAccountByClient(Client client) {

		ArrayList<Account> list = new ArrayList<Account>();

		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st.executeQuery(
					Account.getSelectQuery().replace(";", "") + " WHERE client_id='" + client.getId() + "';");

			while (rs.next()) {
				String id = rs.getString("id");
				String clientId = rs.getString("client_id");
				String typeAccountId = rs.getString("type_account_id");
				double amount = rs.getDouble("amount");
				String currencyId = rs.getString("currency_id");

				Account account = new Account(id, clientId, typeAccountId, amount, currencyId);

				list.add(account);
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static TypeTransaction findTypeTransactionById(String typeTransactionId) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st.executeQuery(
					TypeTransaction.getSelectQuery().replace(";", "") + " WHERE id='" + typeTransactionId + "';");

			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");

				TypeTransaction typeTransaction = new TypeTransaction(id, name);

				return typeTransaction;
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static TypeAccount findTypeAccoundById(String typeAccountId) {

		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st
					.executeQuery(TypeAccount.getSelectQuery().replace(";", "") + " WHERE id='" + typeAccountId + "';");

			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");

				TypeAccount typeAccount = new TypeAccount(id, name);

				return typeAccount;
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static Currency findCurrencyById(String currencyId) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st
					.executeQuery(Currency.getSelectQuery().replace(";", "") + " WHERE id='" + currencyId + "';");

			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				double rateInDollar = rs.getDouble("rate_in_dollar");
				String code = rs.getString("code");

				Currency currency = new Currency(id, name, code, rateInDollar);

				return currency;
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static ArrayList<Transaction> findTransactionByAccountId(String accountId) {
		ArrayList<Transaction> list = new ArrayList<Transaction>();

		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st.executeQuery(
					Transaction.getSelectQuery().replace(";", "") + " WHERE account_id='" + accountId + "';");

			while (rs.next()) {
				String id = rs.getString("id");
				String typeTransactionId = rs.getString("type_transaction_id");
				Date dateOfTransaction = rs.getDate("date_of_transaction");
				double amount = rs.getDouble("amount");
				String details = rs.getString("details");

				Transaction transaction = new Transaction(id, accountId, typeTransactionId, amount, details,
						dateOfTransaction);

				list.add(transaction);
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static ArrayList<Admin> findAllAdmin() {
		ArrayList<Admin> list = new ArrayList<Admin>();

		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st.executeQuery(Admin.getSelectQuery());

			while (rs.next()) {
				String id = rs.getString("id");
				String clientId = rs.getString("clientId");

				Admin admin = new Admin(id, clientId);

				list.add(admin);
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static Admin insertAdmin(Admin admin) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(admin.getInsertQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return admin;
	}

	public static Admin updateAdmin(Admin admin) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(admin.getUpdateQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return admin;
	}

	public static void removeAdmin(Admin admin) {
		try {
			Statement st = ConnectionDB.connectToDataBase();
			st.executeQuery(admin.getRemoveQuery());
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Admin isAdmin(Client client) {

		Statement st = ConnectionDB.connectToDataBase();
		try {
			ResultSet rs = st.executeQuery(
					Admin.getSelectQuery().replace(";", "") + " WHERE client_id='" + client.getId() + "';");
			while (rs.next()) {
				String id = rs.getString("id");
				String clientId = rs.getString("client_id");

				Admin admin = new Admin(id, clientId);

				return admin;
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static Account findAccountById(String accountId) {

		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st
					.executeQuery(Account.getSelectQuery().replace(";", "") + " WHERE id='" + accountId + "';");

			while (rs.next()) {

				String id = rs.getString("id");
				String clientId = rs.getString("client_id");
				String typeAccountId = rs.getString("type_account_id");
				double amount = rs.getDouble("amount");
				String currencyId = rs.getString("currency_id");

				Account account = new Account(id, clientId, typeAccountId, amount, currencyId);

				return account;
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	public static ArrayList<Transfer> findTransferByClientId(String clientId) {
		ArrayList<Transfer> list = new ArrayList<Transfer>();

		try {
			Statement st = ConnectionDB.connectToDataBase();
			ResultSet rs = st
					.executeQuery(Transfer.getSelectQuery().replace(";", " ") + "WHERE client_id='" + clientId + "';");

			while (rs.next()) {
				String id = rs.getString("id");
				String fromAccountId = rs.getString("from_account_id");
				String toAccountId = rs.getString("to_account_id");
				Date dateOfTransfare = rs.getDate("date_of_transfer");
				double amount = rs.getDouble("amount");

				Transfer transfer = new Transfer(id, clientId, fromAccountId, toAccountId, dateOfTransfare, amount);

				list.add(transfer);
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static boolean availableUsername(String username) {

		Statement st = ConnectionDB.connectToDataBase();
		ResultSet rs;
		try {
			rs = st.executeQuery(
					Client.getSelectQuery().replace(";", " ") + "WHERE lower(username)='" + username + "';");
			while (rs.next()) {
				return false;
			}
			rs.close();
			st.close();
			ConnectionDB.closeConnection();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public static void updateClientLastConnection(Client client) {

		Statement st = ConnectionDB.connectToDataBase();
		ResultSet rs;
		try {
			rs = st.executeQuery(Client.getUpdateLastConnectionQuery(client.getId(), new Date()));

			rs.close();
			st.close();
			ConnectionDB.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
