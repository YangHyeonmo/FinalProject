package controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.OpenBankingDTO;
import service.OpenBankingDAO;

@Controller
@RequestMapping("/openbanking")
public class OpenBankingController  {

	@Autowired
	public OpenBankingDAO opDAO;
	
	public  OpenBankingDTO opDTO = new OpenBankingDTO();
	
	@ModelAttribute
	public void headProcess(HttpServletRequest request,
			HttpServletResponse res) {
		try {
			request.setCharacterEncoding("UTF-8");

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
	}
	
	@RequestMapping("InsertOpenBanking")
	public String InsertOpenBanking() throws Throwable{
		       return "openbanking/InsertOpenBanking";	   
	}
	
	@RequestMapping("InsertOpenBankingProc")
	public String InsertOpenBankingProc() throws Throwable{
			int result = opDAO.InsertOpenBanking(opDTO);
		      if (result == 1) {
		         return "openbanking/InsertOpenBankingProc";
		      } else {
		         return "openbanking/InsertOpenBankingFailed";
		      }

	}
	//수정중~~~~~
}
