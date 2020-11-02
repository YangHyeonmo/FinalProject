package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.AccountDTO;
import model.MemberDTO;
import service.AccountDAO;
import service.MemberMybatisDAO;

@Controller
@RequestMapping("/account/")
public class AccountController {

	@Autowired
	AccountDAO dbpro;

	public HttpSession session = null;

	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse res) {

		session = request.getSession();
	}

	@RequestMapping("accountShow")
	public String accountShow(String account_num, Model m) throws Exception {

		List article = dbpro.getArticle(account_num);
		m.addAttribute("account_num", account_num);
		m.addAttribute("article", article);

		return "account/accountShow";

	}

	@RequestMapping("accountList")
	public String accountList(Model m) throws Exception {

		String member_id = (String) session.getAttribute("member_id");
		MemberMybatisDAO mdao = new MemberMybatisDAO();
		MemberDTO member = mdao.getMember(member_id);
		int count1 = 0;
		int count2 = 0;
		int count3 = 0;
		List aaList = null; // �엯異쒓툑
		List bbList = null; // �삁湲�
		List ccList = null; // �쟻湲�
		AccountDAO dbPro = new AccountDAO();
		count1 = dbPro.getACount(member_id);
		count2 = dbPro.getBCount(member_id);
		count3 = dbPro.getCCount(member_id);

		aaList = dbPro.getA(member_id);
		bbList = dbPro.getB(member_id);
		ccList = dbPro.getC(member_id);

		m.addAttribute("count1", count1);
		m.addAttribute("count2", count2);
		m.addAttribute("count3", count3);
		m.addAttribute("aaList", aaList);
		m.addAttribute("bbList", bbList);
		m.addAttribute("ccList", ccList);
		m.addAttribute("member",member);

		return "account/accountList";
	}

	@RequestMapping("aliasChange") // 怨꾩쥖蹂꾨챸 愿�由� �럹�씠吏�
	public String aliasChange(String account_num, Model m) throws Exception {

		List article = dbpro.getAlias(account_num);
		m.addAttribute("account_num", account_num);
		m.addAttribute("article", article);

		return "account/aliasChange";
	}

	@RequestMapping("aliasUpdatePro") // 怨꾩쥖蹂꾨챸 蹂�寃�
	public String aliasUpdatePro(String account_alias, String account_num, Model m) throws Exception {
		// TODO Auto-generated method stub
		int result = dbpro.updateAlias(account_alias, account_num);
		List article = dbpro.getArticle(account_num);
		m.addAttribute("account_alias", account_alias);
		m.addAttribute("account_num", account_num);
		m.addAttribute("article", article);

		return "account/accountList";
	}

	@RequestMapping("accountCopy") // �넻�옣�궗蹂�
	public String accountCopy(String account_num, Model m) throws Exception {

		List article = dbpro.getAlias(account_num);
		m.addAttribute("account_num", account_num);
		m.addAttribute("article", article);

		return "account/accountCopy";
	}

	@RequestMapping("accountPwChange") // 鍮꾨�踰덊샇 蹂�寃� �럹�씠吏�
	public String accountPwChange(String account_num, Model m) throws Exception {

		List article = dbpro.getArticle(account_num);
		m.addAttribute("account_num", account_num);
		m.addAttribute("article", article);

		return "account/accountPwChange";
	}

	@RequestMapping("pwUpdate") // 怨꾩쥖鍮꾨쾲 蹂�寃�
	public String pwUpdate(String account_num, int account_pw, int pw_new, int pw_new_check, Model m) throws Exception {
		// TODO Auto-generated method stub
		boolean check;

		check = dbpro.checkPw(account_num, account_pw, pw_new, pw_new_check);
		System.out.println(pw_new);
		System.out.println(pw_new_check);
		m.addAttribute("check", check);
		if (check == true) {
			return "account/accountPwChangePro";
		} else {
			m.addAttribute("message", "鍮꾨�踰덊샇 遺덉씪移�");
			return "account/accountPwChange";

		}
	}

	@RequestMapping("accountDelete") // 怨꾩쥖�빐吏� 紐⑸줉異쒕젰
	public String accountDelete(String account_num, Model m) throws Exception {

		String member_id = (String) session.getAttribute("member_id");
		List<String> article = dbpro.getAccount(account_num);
		List<String> account = dbpro.moveBalanceAccount(member_id);
		m.addAttribute("account_num", account_num);
		m.addAttribute("article", article);
		m.addAttribute("account", account);

		return "account/accountDelete";
	}

	@RequestMapping("accountDeletePro") // 鍮꾨쾲�솗�씤,�떎瑜멸퀎醫뚮줈 �옍�븸�삷源�
	public String accountDeletePro(String account_num, int account_pw, String open_account_no, int balance, Model m)
			throws Exception {

		System.out.println("Account_num= " + balance);

		boolean check;
		int movebalance;

		check = dbpro.deleteCheckPw(account_num, account_pw);
		m.addAttribute("check", check);

		if (check == true) {
			movebalance = dbpro.moveBalance(open_account_no, balance);
			if (movebalance == 1) {
				m.addAttribute("openAccountNo", open_account_no);
				m.addAttribute("balance", balance);
			}
		}
		return "account/accountDeletePro";
	}

	@RequestMapping("DateAccountList")
	public String DateAccountList(AccountDTO account, Model m) { // 湲곌컙 �꽕�젙 硫붿냼�뱶(�떎�넑�씠
																	// �떖�젰硫붿냼�뱶 李멸퀬 �썑
																	// �닔�젙�븷寃뚯슂)

		System.out.println(account.getEnd_date() + "sdsd+" + account.getStart_date() + account.getAccount_num());
		List<AccountDTO> article = dbpro.dateAccountList(account.getStart_date(), account.getEnd_date(),
				account.getAccount_num());
		m.addAttribute("account_num", account.getAccount_num());
		m.addAttribute("article", article);

		return "account/accountShow";

	}

}
