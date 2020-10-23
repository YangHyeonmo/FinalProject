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
public class AccountController  {

	@Autowired
	AccountDAO dbpro;
	@RequestMapping("accountShow")
	public String accountShow(String account_num,Model m) throws Exception {

		List article = dbpro.getArticle(account_num);
		m.addAttribute("account_num", account_num);
		m.addAttribute("article", article);
		
		return "account/accountShow";

	}

	@RequestMapping("accountList")
	public String accountList(Model m) throws Exception {

		String member_id = "dasom7107";	//session.getAtt~~~ 바꾸기
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

	@RequestMapping("aliasChange")
	public String aliasChange(String account_num,Model m) throws Exception {

		List article = dbpro.getAlias(account_num);
		m.addAttribute("account_num", account_num);
		m.addAttribute("article", article);

		return "account/aliasChange";
	}

	@RequestMapping("aliasUpdatePro")
	public String aliasUpdatePro(String account_alias,String account_num,Model m) throws Exception {
		// TODO Auto-generated method stub
		int result=dbpro.updateAlias(account_alias,account_num);
		List article = dbpro.getArticle(account_num);
		m.addAttribute("account_alias", account_alias);
		m.addAttribute("account_num", account_num);
		m.addAttribute("article", article);

		return "account/accountList";
	}

}
