package controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.FinanceDTO;
import model.MemberDTO;
import model.ProductsDTO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import service.FinanceMybatisDAO;
import service.MemberMybatisDAO;
import util.SendMail;

@Controller
@RequestMapping("/finance/")
public class FinanceController {

	public HttpSession session = null;
	@Autowired
	FinanceMybatisDAO dbPro;

	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
	}

	@RequestMapping("financeMain") // 탑 3상품 보이기
	public String financeMain(Model m, int dbno) throws Exception {
		List<ProductsDTO> financedata = new ArrayList<ProductsDTO>();
		if (dbno == 1) {
			List<FinanceDTO> deposit = dbPro.FinanceDepositList();
			financedata = dbPro.financeMain(dbno);
			m.addAttribute("best1", financedata);
			m.addAttribute("deposit", deposit);
			m.addAttribute("dbno", dbno);

	
		} else if (dbno == 2) {
			List<FinanceDTO> savings = dbPro.FinanceSavingsList();
			financedata = dbPro.financeMain(dbno);
			m.addAttribute("best2", financedata);
			m.addAttribute("savings", savings);
			m.addAttribute("dbno", dbno);


		} else if (dbno == 3) {
			List<FinanceDTO> fund = dbPro.FinanceFundList();
			financedata = dbPro.financeMain(dbno);
			m.addAttribute("best3", financedata);
			m.addAttribute("fund", fund);
			m.addAttribute("dbno", dbno);

	
		} else if (dbno == 4) {
			List<FinanceDTO> loan = dbPro.FinanceLoanList();
			financedata = dbPro.financeMain(dbno);
			m.addAttribute("best4", financedata);
			m.addAttribute("loan", loan);
			m.addAttribute("dbno", dbno);

		} 
		
			return "finance/financeMain";
	}
	
	@RequestMapping("finCertification")
	public String finCertification(int fin_no, Model m) {
		
		m.addAttribute("fin_no", fin_no);
		return "finance/finCertification";
	}

	@RequestMapping("finishProducts")
	public String finishProducts(MemberDTO member, Model m, int authType, int fin_no) {
		// 핸드폰 번호 입력
		int random = (int) (Math.random() * 1000000) + 1;
		if (authType == 1) {
			String api_key = "NCSGDPVOV9E09TBL";
			String api_secret = "HXHETMZZX56FMFPU9OO2H4OHXWJDG2JK";
			Message coolsms = new Message(api_key, api_secret);

			// 4 params(to, from, type, text) are mandatory. must be filled
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("to", member.getMember_phonenumber()); // 수신전화번호
			params.put("from", "01025566010"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
			params.put("type", "SMS");
			params.put("text", "[인증 번호:" + random + "]");
			params.put("app_version", "test app 1.2"); // application name and version

			try {
				JSONObject obj = (JSONObject) coolsms.send(params);
				System.out.println(obj.toString());
			} catch (CoolsmsException e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
			}
		} else {
			SendMail send = new SendMail();
			send.send(member.getMember_email(), random);
		}
		m.addAttribute("random", random);
		m.addAttribute("fin_no",fin_no);
		return "finance/finishProducts";
	}

	@RequestMapping("finMessageAuth")
	public String finMessageAuth(Model m, int fin_no) throws Exception {

		MemberDTO member = new MemberDTO();
		MemberMybatisDAO mbPro = new MemberMybatisDAO();

		member = mbPro.getMember("syj");

		m.addAttribute("member", member);
		m.addAttribute("fin_no",fin_no);
		return "finance/finMessageAuth";
	}

	@RequestMapping("finEmailAuth")
	public String finEmailAuth(Model m, int fin_no) {

		MemberDTO member = new MemberDTO();
		MemberMybatisDAO mbPro = new MemberMybatisDAO();

		member = mbPro.getMember("hyeonmo");

		m.addAttribute("member", member);
		m.addAttribute("fin_no", fin_no);
		return "finance/finEmailAuth";
	}

	@RequestMapping("accedeProducts")
	public String accedeProducts(Model m, String member_id, String fin_pro,String account_num, String fin_name, int fin_pw, double fin_rate, int fin_no) throws Throwable {
//		member_id = (String) session.getAttribute("member_id");
		member_id = "syj";
		int result = dbPro.insertProducts(fin_no, member_id);
		/* String findfin = dbPro.Findfin(fin_no); */
		System.out.println(fin_no);
		if (result == 1) {
			m.addAttribute("fin_no", fin_no);
			m.addAttribute("member_id", member_id);
			/* m.addAttribute("findfin",findfin); */
		
			
			
			return "finance/financeMain";
		} else {
			return "redirect:financeMain";
		}
	}
}