package controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OpenBankingAction extends Action {

	public void headProcess(HttpServletRequest request,
			HttpServletResponse res) {
		try {
			request.setCharacterEncoding("UTF-8");

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
	}
	
	public String InsertOpenBanking(HttpServletRequest request,
			 HttpServletResponse response) throws Throwable{
			 return "/JSP/openbanking/openbanking.jsp"; 
			}
	
	//수정중

}
