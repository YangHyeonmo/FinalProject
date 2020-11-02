package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.AccountDTO;
import model.MemberDTO;
import model.OpenBankingDTO;
import service.AccountDAO;
import service.MemberMybatisDAO;
import service.OpenBankingDAO;
import service.TransferMybatisDAO;

@Controller
@RequestMapping("/view/")
public class ViewPageController {

	@Autowired
	MemberMybatisDAO dao;

	@Autowired
	TransferMybatisDAO transferMybatisdao;

	public HttpSession session = null;
	@ModelAttribute
	public void headProcess(HttpServletRequest request,
			HttpServletResponse res) {

		session = request.getSession();

	}

	public MemberDTO member = new MemberDTO();
	@Autowired
	public OpenBankingDAO opDAO = new OpenBankingDAO();
	public OpenBankingDTO oDTO = new OpenBankingDTO();

	@RequestMapping("mainPage")
	public String mainPage(Model m, OpenBankingDTO oDTO) throws Throwable {
		if ((String) session.getAttribute("member_id") == null) {
			return "view/mainPage";
		} else {
			String member_id = (String) session.getAttribute("member_id");
			List<AccountDTO> account_num = transferMybatisdao
					.getAccountNum(member_id); //사용자의 모든 통장을 담는 List 선언하고 View 로 뿌려줌

			List<String> num = new ArrayList<String>();
			List<Integer> balance = new ArrayList<Integer>();
			//Map<String,Integer> accountMap=new HashMap<String,Integer>();
			for (int i = 0; i < account_num.size(); i++) {
				//accountMap.put(account_num.get(i).getAccount_num(), account_num.get(i).getBalance());
				num.add(account_num.get(i).getAccount_num());
				balance.add(account_num.get(i).getBalance());
			}
			if(num.size()!=0) {
				m.addAttribute("num",1);
				m.addAttribute("account_num", num);
				m.addAttribute("balance", balance);
			}else {
				m.addAttribute("num",0);
				m.addAttribute("message","통장 개설하러 가기");
			}
			

			//2.회원이 통장이 가입이 되어있는지
			System.out.println(member_id);
			int total = opDAO.TotalOpenBalance(member_id);
			m.addAttribute("total", total);
			List<OpenBankingDTO> list = opDAO.SelectOpenBanking(member_id);
			m.addAttribute("list", list);

			return "view/mainPage";
		}
	}

	@RequestMapping("/memberMyPage")
	public String memberMyPage(Model m) throws Throwable {
		String member_id = (String) session.getAttribute("member_id");
		member = dao.getMember(member_id);
		m.addAttribute("member", member);
		return "view/memberMyPage";
	}
	@RequestMapping("myInfo")
	public String myInfo(Model m) throws Throwable {
		String member_id = (String) session.getAttribute("member_id");
		member = dao.getMember(member_id);
		m.addAttribute("member", member);
		return "view/memberInfoPage";
	}

	@RequestMapping("logout")
	public ModelAndView logout(ModelAndView mv) throws Throwable {
		session.invalidate();
		mv.setViewName("redirect:/view/mainPage");
		return mv;
	}

}
