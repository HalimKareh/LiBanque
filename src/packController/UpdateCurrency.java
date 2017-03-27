package packController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import packModel.Currency;
import packServices.Services;

/**
 * Servlet implementation class UpdateCurrency
 */
public class UpdateCurrency extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCurrency() {
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
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
super.service(request, response);
		
		String currencyId = request.getParameter("currencyId"); 
		String name = request.getParameter("name");
		String code = request.getParameter("code");
		double rateInDollar = Double.valueOf(request.getParameter("rate"));
		
		Currency currency = new Currency(currencyId, name, code, rateInDollar);
		
		Services.updateCurrency(currency);
		
		response.sendRedirect("edit_currency.jsp?currencyId=" + currencyId + "&success=1");
	}
}
