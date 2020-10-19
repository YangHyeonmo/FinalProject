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
			HttpSession session = request.getSession();
			MemberMybatisDAO dao = new MemberMybatisDAO();
			MemberDTO member = new MemberDTO();
			String member_id = (String) session.getAttribute("member_id");
			member = dao.getMember(member_id);
			session.setAttribute("member_phonenumber", member.getMember_phonenumber());
			session.setAttribute("member_birthdate", member.getMember_birthdate());
			session.setAttribute("member_gender", member.getMember_gender());
			session.setAttribute("member_zipcode", member.getMember_zipcode());
			session.setAttribute("member_address", member.getMember_address());
		
			 return "/JSP/view/memberInfoPage.jsp"; 
			}
	public void logout(HttpServletRequest request,
			 HttpServletResponse response) throws Throwable{
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("./mainPage");
			
			}
}

