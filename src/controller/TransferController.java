package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.AccountDTO;
import model.MemberDTO;
import model.TransferDTO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import service.MemberMybatisDAO;
import service.TransferMybatisDAO;
import util.SendMail;

@Controller
@RequestMapping("/transfer/")
public class TransferController{

	@Autowired
	TransferMybatisDAO transferMybatisdao;
	
	public String id;		//사용자 아이디
	public boolean result = false;
	public	HttpSession session = null;
	
	public ModelAndView mv = new ModelAndView();
	
	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse res) {
		session = request.getSession();							
		id= (String)session.getAttribute("member_id");		//세션에 담겨있는 아이디를 id 변수에 저장
		
		List<AccountDTO> account_num= transferMybatisdao.getAccountNum(id);	//사용자의 모든 통장을 담는 List 선언하고 View 로 뿌려줌
		
		List<String> num=new ArrayList<String>();
		List<Integer> balance=new ArrayList<Integer>();
		
		//Map<String,Integer> accountMap=new HashMap<String,Integer>();
		for(int i=0;i<account_num.size();i++) {
			//accountMap.put(account_num.get(i).getAccount_num(), account_num.get(i).getBalance());
			num.add(account_num.get(i).getAccount_num());
			balance.add(account_num.get(i).getBalance());
		}
		request.setAttribute("account_num", num);
		request.setAttribute("balance", balance);
		//request.setAttribute("accountMap", accountMap);
	}
	@RequestMapping("TransferWrite")
	public String TransferWrite()   { 
			
		return  "transfer/TransferWrite"; 
	} 
	@RequestMapping("TransferAuto")
	public String TransferAuto() { 
		return  "transfer/TransferAuto"; 
	} 
	@RequestMapping("TransferRes")
	public String TransferRes() { 
		return  "transfer/TransferReserve"; 
	}
	@RequestMapping("TransferSelect")
	public String TransferSelect(){ 
		return  "transfer/TransferSelect"; 
	} 
	@RequestMapping("TransferSelectList")
	public String TransferSelectList(TransferDTO transfer, int select_period,
			String first_year,String first_month, String first_day,String second_year,
			String second_month, String second_day, Model m	)  { 	//기간 설정 메소드(다솜이 달력메소드 참고 후 수정할게요)
		
	
		try {
			boolean check_Account= transferMybatisdao.check_account_no(transfer.getAccount_no());	//통장이 존재하는지 확인하는 메소드
			if(check_Account) {
				transfer.setAccount_no(transfer.getAccount_no());		//통장이 존재할 경우 setAccount_no
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		Calendar cal=Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat df=new SimpleDateFormat("yyyy/MM/dd");
		String now_date=df.format(cal.getTime());
		if(select_period==0) {
			
			 if(first_month.length()<2) {
				 first_month="0"+first_month;
			}
			if(first_day.length()<2) {
				first_day="0"+first_day;
			}
			 if(second_month.length()<2) {
				 second_month="0"+second_month;
			}
			if(second_day.length()<2) {
				second_day="0"+second_day;
			}		
			String first_date=first_year+first_month+first_day;
			String second_date=second_year+second_month+second_day;
			List<TransferDTO> transList=transferMybatisdao.dateTransList(second_date,first_date,transfer.getAccount_no());
			
			m.addAttribute("transList", transList);

			return  "transfer/TransferSelectList"; 
		}else if(select_period<10 && select_period>0) {
			cal.add(Calendar.DATE, -select_period);
		}else {
			cal.add(Calendar.MONTH, -(select_period/10));
		}

		String select_date=df.format(cal.getTime());

		List<TransferDTO> transList=transferMybatisdao.dateTransList(now_date,select_date,transfer.getAccount_no());
		
		m.addAttribute("transList", transList);	
		return  "transfer/TransferSelectList"; 
	} 
	@RequestMapping("TransferAuth")
	public String TransferAuth(TransferDTO transfer,String year, String month,String day,Model m) {
		int error=0;
		try {
			//통장이 존재하는지 1번 
			System.out.println(transfer.getAccount_no());
			boolean check_Account= transferMybatisdao.check_account_no(transfer.getAccount_no()); //통장이 존재하는지 확인하는 메소드
			if(check_Account) {
				transfer.setAccount_no(transfer.getAccount_no());	//통장이 존재할 경우 
			}
			transfer.setMember_id(id);
			
			
			//통장에 돈이 부족한지 2번
			boolean check_Account_money=transferMybatisdao.check_account_money(transfer.getAccount_no(),transfer.getTransfer_price());
			if(!check_Account_money) {	//통장에 돈이 충분한 경우
				error=2;
				m.addAttribute("error", error);
				return "transfer/TransferWrite";
			}
			//보낼 통장이 존재하는지 3번
			boolean check_TransferAccount=transferMybatisdao.check_account_no(transfer.getTransfer_to_account_no());
			if(check_TransferAccount) {	//보낼 통장이 존재하는 경우
				String sendMember=transferMybatisdao.sendMember(transfer.getTransfer_to_account_no());
				transfer.setTransfer_to_member_id(sendMember);	//보낼 사람 아이디		
				m.addAttribute("sendMember",sendMember);
			}else {
				error=3;
				m.addAttribute("error", error);
				return "transfer/TransferWrite";
			}
			//자신에게 보내지 못하도록 4번
			if(transfer.getAccount_no().equals(transfer.getTransfer_to_account_no())) {
				error=4;
				m.addAttribute("error", error);
				return "transfer/TransferWrite";
			}
			if(transfer.getNum()==1) {	//즉시 이체인 경우
				//result=transferMybatisdao.transferInsert(transferdata,num);		//이체 내역 삽입
				//transferMybatisdao.updateMoney(transferdata.getAccount_no(),transferdata.getTransfer_price(),1);		//1: Minus Money 2.Plus Money
				//transferMybatisdao.updateMoney(transferdata.getTransfer_to_account_no(),transferdata.getTransfer_price(),2);
				session.setAttribute("transfer", transfer);
				m.addAttribute("transferdata", transfer);
				return "transfer/TransferAuth";
			}else if(transfer.getNum()==2 || transfer.getNum()==3) {	//자동이체 , 예약이체 (달력 수정 이후 주석 달게요)
				if(month.length()<2) {
					month="0"+month;
				}
				if(day.length()<2) {
					day="0"+day;
				}
				if(transfer.getNum()==2) {
					transfer.setTransfer_auto_period(transfer.getTransfer_auto_period());				
					transfer.setTransfer_auto_period_start(year+""+month+""+day);
				}
				else if(transfer.getNum()==3){
					transfer.setTransfer_res_day(year+""+month+""+day);
				}
				try {
					String period_start="";
					if(transfer.getNum()==2) {
						transfer.setTransfer_auto_period(transfer.getTransfer_auto_period());
					 	period_start=transfer.getTransfer_auto_period_start();
					}else if(transfer.getNum()==3) {
						period_start=transfer.getTransfer_res_day();
					}
						Date today=new Date();
						System.out.println("날짜:"+ period_start);
						Date actday=new SimpleDateFormat("yyyyMMdd").parse(period_start);
						transfer.setTransfer_auto_period_start(period_start);
						
						//날짜 비교 유효성
						if( (actday!=null) && actday.getTime() > today.getTime()) {
							boolean insert=transferMybatisdao.transferInsert(transfer,transfer.getNum());
							if(insert) {
								int transcount=transferMybatisdao.getTransListCount(transfer.getNum());
								transfer=transferMybatisdao.transferDetail(transcount, transfer.getNum());
								System.out.println("통장번호"+ transfer.getAccount_no());
								System.out.println("이체가격"+ transfer.getTransfer_price());
								transferMybatisdao.updateMoney(transfer.getAccount_no(),transfer.getTransfer_price(),1);		//1: Minus Money 2.Plus Money
								transferMybatisdao.updateMoney(transfer.getTransfer_to_account_no(),transfer.getTransfer_price(),2);		
								return "transfer/TransferAuth";
							}
						}					
						else {
							error=5;
							System.out.println("에러입니다");
							m.addAttribute("error", error);
							if(transfer.getNum()==2) {
								return "transfer/TransferAuto";
							}else if(transfer.getNum()==3) {
								return "transfer/TransferReserve";
							}
						}
				}catch(java.text.ParseException e) {
					error=6;
					m.addAttribute("error", error);
					if(transfer.getNum()==2) {
						return "transfer/TransferAuto";
					}else if(transfer.getNum()==3) {
						return "transfer/TransferReserve";
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			}catch(Exception e) {
				e.printStackTrace();
			}
		return "transfer/TransferAuth";			
	} 
	
	@RequestMapping("finish")
	public String finish(MemberDTO member,Model m,int authType)   { 
		//핸드폰 번호 입력
		int random=(int)(Math.random()*1000000)+1;
		if(authType==1) {
		 	String api_key = "NCSGDPVOV9E09TBL";
		    String api_secret = "HXHETMZZX56FMFPU9OO2H4OHXWJDG2JK";
		    Message coolsms = new Message(api_key, api_secret);
		   
		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", member.getMember_phonenumber());	// 수신전화번호
		    params.put("from", "01068992734");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		    params.put("type", "SMS");
		    params.put("text", "[인증 번호:"+random+"]");
		    params.put("app_version", "test app 1.2"); // application name and version

		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }		   
		}else {
			SendMail send=new SendMail();
			send.send(member.getMember_email(),random);
		}
		m.addAttribute("random", random);
		return  "transfer/finish";
	} 
	@RequestMapping("messageAuth")
	public String messageAuth(Model m) throws Exception   { 
		
		MemberDTO member=new MemberDTO();
		MemberMybatisDAO mbPro=new MemberMybatisDAO();
		
		 member=mbPro.getMember(id);
		
		 m.addAttribute("member", member);
		return  "transfer/messageAuth"; 
	} 
	
	@RequestMapping("emailAuth")
	public String emailAuth(Model m)   { 
		
		MemberDTO member=new MemberDTO();
		MemberMybatisDAO mbPro=new MemberMybatisDAO();
		
		 member=mbPro.getMember("hyeonmo");
		
		 m.addAttribute("member", member);
		return  "transfer/emailAuth"; 
	} 
	
	@RequestMapping("realfinish")
	public String realfinish(Model m,int auth,int random)    { 
		
		if(random == auth) {
			TransferDTO data=(TransferDTO)session.getAttribute("transfer");
			result=transferMybatisdao.transferInsert(data,data.getNum());		//이체 내역 삽입
			System.out.println(data.getTransfer_price());
			transferMybatisdao.updateMoney(data.getAccount_no(),data.getTransfer_price(),1);		//1: Minus Money 2.Plus Money
			transferMybatisdao.updateMoney(data.getTransfer_to_account_no(),data.getTransfer_price(),2);
			
			m.addAttribute("transfer",data);
			return  "transfer/realfinish";
		}else {
			m.addAttribute("error", 1);
			return "transfer/realfinish";
		}
		
	} 
}
