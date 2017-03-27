package packController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import packModel.Currency;
import packServices.Services;

/**
 * Servlet implementation class InsertCurrency
 */
public class InsertCurrency extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCurrency() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.service(request, response);
		
		String name = request.getParameter("name");
		String code = request.getParameter("code");
		double rate = Double.valueOf(request.getParameter("rate"));
		
		System.out.println(name);
		System.out.println(code);
		System.out.println(rate);
		
		Currency currency = new Currency();
		currency.setCode(code);
		currency.setName(name);
		currency.setRateInDollar(rate);
		
		Services.insertCurrency(currency);
		
	}
}
