package controller;


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

import model.MemberDTO;
import service.MemberMybatisDAO;
import service.TransferMybatisDAO;


@Controller
@RequestMapping("/view/")
public class ViewPageController  {

	@Autowired
	MemberMybatisDAO dao;
	
	public HttpSession session=null;
	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse res) {
	
		session = request.getSession();
		
	}
	
	public MemberDTO member=new MemberDTO();
	
	@RequestMapping("mainPage")
	public String mainPage() throws Throwable{
			 return "view/mainPage"; 
			}
	@RequestMapping("/memberMyPage")
	public String memberMyPage() throws Throwable{
			 return "view/memberMyPage"; 
			}
	@RequestMapping("myInfo")
	public String myInfo(Model m ) throws Throwable{
			String member_id=(String)session.getAttribute("member_id");
			member = dao.getMember(member_id);			
			m.addAttribute("member", member);
			 return "view/memberInfoPage"; 
			}
	
	@RequestMapping("logout")
	public ModelAndView logout(ModelAndView mv) throws Throwable{
			session.invalidate();
			mv.setViewName("/view/mainPage");
			return mv;
	}
	
	
}

