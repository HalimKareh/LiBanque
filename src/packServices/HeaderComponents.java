package packServices;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import packModel.Client;

public class HeaderComponents {
	
	//Return the current date formated as follow "Friday 08 January 2016 - 09:58"
	public static String setDateAndTime(){
		DateFormat dateFormat = new SimpleDateFormat("EEEE dd MMMM yyyy - hh:mm");
		
		Date currentDate = new Date();
		return dateFormat.format(currentDate);
	}
	
	//If the client is logged in, this function returns the date of the
	//last connected session
	public static String setLastConnection(Client client){
		DateFormat dateFormat = new SimpleDateFormat("EEEE dd MMMM yyyy - hh:mm");
		
		if((client!=null) && (client.getLastConnexion()!=null)){
			Date lastConnection = client.getLastConnexion();
			System.out.println(dateFormat.format(lastConnection));
			return "<br /> <b> Last Connection : </b>" + dateFormat.format(lastConnection);
		}
		return "";
	}

	//If the client is logged in, a welcome phrase is sent with respecting the gender
	public static String setWelcomePhrase(Client client){
		if(client!=null){
			String s = "<b>" + 
					(client.getGender().toLowerCase().equals("male")?"Mr. ": "Mrs. ")
					+ client.getFirstName() + " " + client.getLastName()
					+ "</b>";
			return s;
		}
		return "";
	}
	
}
