package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDTO;
import member.MemberMybatisDAO;


public class ViewPageAction extends Action {

	public String mainPage(HttpServletRequest request,
			 HttpServletResponse response) throws Throwable{
			 return "/JSP/view/mainPage.jsp"; 
			}
	public String memberMyPage(HttpServletRequest request,
			 HttpServletResponse response) throws Throwable{
			 return "/JSP/view/memberMyPage.jsp"; 
			}
	public String myInfo(HttpServletRequest request,
			 HttpServletResponse response) throws Throwable{
			MemberMybatisDAO dao = new MemberMybatisDAO();
			MemberDTO dto = new MemberDTO();
			
		
			 return "/JSP/view/memberInfoPage.jsp"; 
			}
	public void logout(HttpServletRequest request,
			 HttpServletResponse response) throws Throwable{
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("./mainPage");
			
			}
}

