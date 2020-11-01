package controller;

import java.io.UnsupportedEncodingException;
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


import model.MemberDTO;
import service.MemberMybatisDAO;

import util.SHA256;

@Controller
@RequestMapping("/member/")
public class MemberController {
		
	public	HttpSession session = null;

	
	@Autowired
	MemberMybatisDAO memberDAO;
	

	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse res) {
		try {
			request.setCharacterEncoding("UTF-8");
			session = request.getSession();
	
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	
		
		
	}
	
	@RequestMapping("loginRegister")
	public String loginRegister() throws Throwable{
			 return "member/loginRegister"; 
	}
	
	@RequestMapping("findMemberForm")
	public String findMemberForm() throws Throwable{
			 return "member/findMemberForm"; 
			}
	

	
	@RequestMapping("insertRegister")
	public String insertRegister(MemberDTO member) throws Exception {
		
		member.setMember_password(SHA256.getSHA256(member.getMember_password()));
		member.setMember_author(0);
	
		int result = memberDAO.insertMember(member);
		if(result == 1) {
			return "member/memberRegisterPro";
		}
		else return "member/memberRegisterFailed"; 
	}
	
	@RequestMapping("loginUser")
	public String loginUser(String member_id, String member_password, Model m) throws Exception {
		MemberDTO member = new MemberDTO();
		String member_pwdSecurity = SHA256.getSHA256(member_password);

		int loginResult = memberDAO.loginMember(member_id, member_pwdSecurity);
		if(loginResult == 1) {
			member = (MemberDTO) memberDAO.getMember(member_id);
			session.setAttribute("member_id", member_id);
			session.setAttribute("member_password", member_password);		
			session.setAttribute("member", member);
			session.setAttribute("login", 1);
			return "member/memberLoginPro";
		}
		else return "member/memberLoginFailed"; 
	}
	
	@RequestMapping("memberInfoUpdate")
	public String memberInfoUpdate(String oldpwd, String pwd, String name, String email, String tel, String birthdate, String gender, String zipcode, String address) throws Exception {
		MemberDTO member = (MemberDTO) session.getAttribute("member");

		String password = member.getMember_password();
		String oldPwdChk = SHA256.getSHA256(oldpwd);
		
		if(password.equals(oldPwdChk)) {
			member.setMember_password(SHA256.getSHA256(pwd));
			member.setMember_name(name);
			member.setMember_email(email);
			member.setMember_phonenumber(tel);
			member.setMember_birthdate(birthdate);
			member.setMember_gender(gender);
			member.setMember_zipcode(zipcode);
			member.setMember_address(address);
			memberDAO.updateMember(member);
			return "view/mainPage";
		}
		else return "view/memberInfoPage";
		
	}
	
	@RequestMapping("memberDelete")
	public String memberDelete(String oldpwd) throws Exception {
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String member_id = (String) session.getAttribute("member_id");
		String password = member.getMember_password();
		String oldPwdChk = SHA256.getSHA256(oldpwd);

		if(password.equals(oldPwdChk)) {
			memberDAO.deleteMember(member_id);
			session.invalidate();
			return "view/mainPage";
		}
		else return "view/memberInfoPage";
		
	}
	
	@RequestMapping("findId")
	public String findId(String member_name, String member_email, Model m) throws Exception {
		
		String member_id = memberDAO.fineMemberId(member_name, member_email);
		m.addAttribute("member_id",member_id);
		return "member/findIdPro";
	}
	
	@RequestMapping("findPwd")
	public String findPwd(String member_id, String member_email, String member_phonenumber, Model m) throws Exception {

		String member_password= memberDAO.findMemberPwd(member_id, member_email, member_phonenumber);
		m.addAttribute("member_password",member_password);
		
		return "member/findPwdPro";
	}
	
	
	@RequestMapping("idCheck")
	public String idCheck(String member_id, Model m) throws Exception {
		String checkId = memberDAO.memberIdCheck(member_id);
		m.addAttribute("checkId", checkId);
		return "member/idCheck";
		
	}
}
