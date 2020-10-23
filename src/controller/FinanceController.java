package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;



import model.FinanceDTO;
import model.ProductsDTO;
import service.FinanceMybatisDAO;

@Controller
@RequestMapping("/finance/")
public class FinanceController {
	@Autowired
	FinanceMybatisDAO dbPro;
	int i=0;
	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
	}

	/*
	 * public String financeAllList(HttpServletRequest request, HttpServletResponse
	 * response) throws Exception { // 모든 금융상품 // 보기 List<FinanceDTO> finance =
	 * null; FinanceMybatisDAO dbPro = new FinanceMybatisDAO(); finance =
	 * dbPro.FinanceAllList(); request.setAttribute("finance", finance);
	 * 
	 * return "/view/finance/financeAllList.jsp"; }
	 */
	@RequestMapping("financeDepositList")
	public String financeDepositList(Model m) throws Exception {
		
		List<FinanceDTO> deposit = dbPro.FinanceDepositList();
		m.addAttribute("deposit", deposit);

		return "finance/financeDepositList";
	}
	@RequestMapping("financeSavingsList")
	public String financeSavingsList(Model m) throws Exception {

		List<FinanceDTO> savings = dbPro.FinanceSavingsList();
		m.addAttribute("savings", savings);

		return "finance/financeSavingsList";
	}
	@RequestMapping("financeFundList")
	public String financeFundList(Model m) throws Exception {

		List<FinanceDTO> fund = dbPro.FinanceFundList();
		m.addAttribute("fund", fund);

		return "finance/financeFundList";
	}
	@RequestMapping("financeLoanList")
	public String financeLoanList(Model m) throws Exception {

		List<FinanceDTO> loan = dbPro.FinanceLoanList();
		m.addAttribute("loan", loan);
		return "finance/financeLoanList";
	}
	@RequestMapping("financeMain")
	public String financeMain() throws Exception {

		return "finance/financeMain";
	}

	/*
	 * public String accedeProducts(HttpServletRequest request, HttpServletResponse
	 * response) throws Throwable {
	 * 
	 * FinanceMybatisDAO dbPro = new FinanceMybatisDAO(); int fin_no =
	 * Integer.parseInt(request.getParameter("fin_no")); List<ProductsDTO>
	 * p=dbPro.searchProduct(fin_no); request.setAttribute("p", p);
	 * request.setAttribute("fin_no", fin_no);
	 * 
	 * return "/view/finance/accedeProducts.jsp"; }
	 */
	@RequestMapping("accedeProducts")
	public String accedeProducts(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		FinanceMybatisDAO dbPro = new FinanceMybatisDAO();
		
		int fin_no = Integer.parseInt(request.getParameter("fin_no"));
		int result = dbPro.insertProducts(fin_no);

		if(result == 1) {
			request.setAttribute("fin_no", fin_no);
			request.setAttribute("ref_no", i++);
			request.setAttribute("member_id", "wewqe");
			request.setAttribute("account_num", "111111");
			
			return "finance/accedeProducts";
		}
		return "";
		
		
	}

}