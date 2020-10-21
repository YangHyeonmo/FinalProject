package controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDTO;
import member.MemberMybatisDAO;
import util.SHA256;

public class LoginRegisterAction extends Action {
	
	public void headProcess(HttpServletRequest request, HttpServletResponse res) {
		try {
			request.setCharacterEncoding("UTF-8");
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
	}
	public String loginRegister(HttpServletRequest request,
			 HttpServletResponse response) throws Throwable{
			 return "/JSP/member/loginRegister.jsp"; 
			}
	

	

	public String insertRegister(HttpServletRequest request, HttpServletResponse res) throws Exception {
		headProcess(request, res);
		MemberDTO member = new MemberDTO();
		member.setMember_id(request.getParameter("member_id"));
		member.setMember_password(SHA256.getSHA256(request.getParameter("member_password")));
		member.setMember_name(request.getParameter("member_name"));
		member.setMember_birthdate(request.getParameter("member_birthdate"));
		member.setMember_gender(request.getParameter("member_gender"));
		member.setMember_email(request.getParameter("member_email"));
		member.setMember_phonenumber(request.getParameter("member_phonenumber"));
		member.setMember_zipcode(request.getParameter("member_zipcode"));
		member.setMember_address(request.getParameter("member_address"));
		member.setMember_author(0);
		
		MemberMybatisDAO memberDAO = new MemberMybatisDAO();
		int result = memberDAO.insertMember(member);
		if(result == 1) {
			return "/JSP/member/memberRegisterPro.jsp";
		}
		else return "/JSP/member/memberRegisterFailed.jsp"; 
	}
	
	public String loginUser(HttpServletRequest request, HttpServletResponse res) throws Exception {
		headProcess(request, res);
		HttpSession session = request.getSession();
		MemberMybatisDAO memberDAO = new MemberMybatisDAO();
		MemberDTO member = new MemberDTO();
		String member_id = request.getParameter("member_id");
		String member_password = SHA256.getSHA256(request.getParameter("member_password"));
		System.out.println("=======================================");
		System.out.println(member_password);
		int loginResult = memberDAO.loginMember(member_id, member_password);
		
		if(loginResult == 1) {
			member = (MemberDTO) memberDAO.getMember(member_id);
			session.setAttribute("member_id", member_id);
			session.setAttribute("member_password", member_password);
			session.setAttribute("member_name", member.getMember_name());
			session.setAttribute("member_email", member.getMember_email());
			session.setAttribute("login", 1);
			return "/JSP/member/memberLoginPro.jsp";
		}
		else return "/JSP/member/memberLoginFailed.jsp"; 
	}
	
	public String memberInfoUpdate(HttpServletRequest request, HttpServletResponse res) throws Exception {
		headProcess(request, res);
		HttpSession session = request.getSession();
		MemberMybatisDAO dao = new MemberMybatisDAO();
		MemberDTO member = new MemberDTO();
		member.setMember_id((String)session.getAttribute("member_id"));
		member.setMember_password(SHA256.getSHA256(request.getParameter("pwd")));
		member.setMember_email(request.getParameter("email"));
		member.setMember_name(request.getParameter("name"));
		member.setMember_birthdate(request.getParameter("tel"));
		member.setMember_gender(request.getParameter("gender"));
		member.setMember_zipcode(request.getParameter("zipcode"));
		member.setMember_address(request.getParameter("address"));
		String password = (String)session.getAttribute("member_password");
		String oldpwd = SHA256.getSHA256(request.getParameter("oldpwd"));
		if(password.equals(oldpwd)) {
			dao.updateMember(member);
			return "/JSP/view/mainPage.jsp";
		}
		else return "/JSP/view/memberInfoPage.jsp";
		
	}
	public String memberDelete(HttpServletRequest request, HttpServletResponse res) throws Exception {
		headProcess(request, res);
		HttpSession session = request.getSession();
		MemberMybatisDAO dao = new MemberMybatisDAO();
		String member_id = (String) session.getAttribute("member_id");
		String password = (String)session.getAttribute("member_password");
		String oldpwd = SHA256.getSHA256(request.getParameter("oldpwd"));
		if(password.equals(oldpwd)) {
			dao.deleteMember(member_id);
			session.invalidate();
			return "/JSP/view/mainPage.jsp";
		}
		else return "/JSP/view/memberInfoPage.jsp";
		
	}
	
	public int idCheck(HttpServletRequest request, HttpServletResponse res) throws Exception {
		headProcess(request, res);
		MemberMybatisDAO memberDAO = new MemberMybatisDAO();
		String member_id = request.getParameter("memberId").trim();
		return memberDAO.memberIdCheck(member_id);
	}
}
