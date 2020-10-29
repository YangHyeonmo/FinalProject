package controller;

import java.io.File;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.som.Action;

import model.AccountDTO;
import service.AccountDAO;

@Controller
@RequestMapping("/account/")
public class AccountController {

	@Autowired
	AccountDAO dbpro;

	@RequestMapping("accountShow")
	public String accountShow(String account_num, Model m) throws Exception {

		List article = dbpro.getArticle(account_num);
		m.addAttribute("account_num", account_num);
		m.addAttribute("article", article);

		return "account/accountShow";

	}

	@RequestMapping("accountList")
	public String accountList(Model m) throws Exception {

		String member_id = "dasom7107"; // session.getAtt~~~ 바꾸기
		int count1 = 0;
		int count2 = 0;
		int count3 = 0;
		List aaList = null; // 입출금
		List bbList = null; // 예금
		List ccList = null; // 적금
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

		return "account/accountList";
	}

	@RequestMapping("aliasChange") // 계좌별명 관리 페이지
	public String aliasChange(String account_num, Model m) throws Exception {

		List article = dbpro.getAlias(account_num);
		m.addAttribute("account_num", account_num);
		m.addAttribute("article", article);

		return "account/aliasChange";
	}

	@RequestMapping("aliasUpdatePro") // 계좌별명 변경
	public String aliasUpdatePro(String account_alias, String account_num, Model m) throws Exception {
		// TODO Auto-generated method stub
		int result = dbpro.updateAlias(account_alias, account_num);
		List article = dbpro.getArticle(account_num);
		m.addAttribute("account_alias", account_alias);
		m.addAttribute("account_num", account_num);
		m.addAttribute("article", article);

		return "account/accountList";
	}

	@RequestMapping("accountCopy") // 통장사본
	public String accountCopy(String account_num, Model m) throws Exception {

		List article = dbpro.getAlias(account_num);
		m.addAttribute("account_num", account_num);
		m.addAttribute("article", article);

		return "account/accountCopy";
	}

	@RequestMapping("accountPwChange") // 비밀번호 변경 페이지
	public String accountPwChange(String account_num, Model m) throws Exception {

		List article = dbpro.getArticle(account_num);
		m.addAttribute("account_num", account_num);
		m.addAttribute("article", article);

		return "account/accountPwChange";
	}

	@RequestMapping("pwUpdate") // 계좌비번 변경
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
			m.addAttribute("message", "비밀번호 불일치");
			return "account/accountPwChange";

		}
	}

	@RequestMapping("accountDelete") // 계좌해지 목록출력
	public String accountDelete(String account_num, Model m) throws Exception {
		String member_id = "dasom7107";
		List<String> article = dbpro.getAccount(account_num);
		List<String> account = dbpro.moveBalanceAccount(member_id);
		m.addAttribute("account_num", account_num);
		m.addAttribute("article", article);
		m.addAttribute("account", account);

		return "account/accountDelete";
	}

	@RequestMapping("accountDeletePro") // 비번확인,다른계좌로 잔액옮김
	public String accountDeletePro(String account_num, int account_pw, String OPEN_ACCOUNT_NO, int balance, Model m) throws Exception {

		System.out.println("Account_num= "+balance); 
		
		boolean check;
        int movebalance;
        
		check = dbpro.deleteCheckPw(account_num, account_pw);
		m.addAttribute("check", check);
		
		if (check == true) {
			movebalance = dbpro.moveBalance(OPEN_ACCOUNT_NO, balance);
			if(movebalance == 1) {
			m.addAttribute("openAccountNo", OPEN_ACCOUNT_NO);
			m.addAttribute("balance", balance);
		}
		}
		return "account/accountDeletePro";
	}

}
