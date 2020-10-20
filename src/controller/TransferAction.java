package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import transfer.TransferDTO;
import transfer.TransferMybatisDAO;

public class TransferAction extends Action{

	public TransferMybatisDAO transferMybatisdao = new TransferMybatisDAO();
	public TransferDTO transferdata = new TransferDTO();
	public String id;		//사용자 아이디
	public int num = 0;		// 1. 즉시 이체 2. 자동 이체 3. 예약 이체
	public boolean result = false;

	public void headProcess(HttpServletRequest request, HttpServletResponse res) {
		HttpSession session = request.getSession();							
		id= (String)session.getAttribute("member_id");		//세션에 담겨있는 아이디를 id 변수에 저장
		List<String> account_num= transferMybatisdao.getAccountNum(id);	//사용자의 모든 통장을 담는 List 선언하고 View 로 뿌려줌
		request.setAttribute("account_num", account_num);
		
		
	}
	
	public String TransferWrite(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		headProcess(request,response);		
		return  "/JSP/view/transfer/TransferWrite.jsp"; 
	} 
	
	public String TransferAuto(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		headProcess(request,response);	
		 return  "/JSP/view/transfer/TransferAuto.jsp"; 
	} 
	
	public String TransferRes(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		headProcess(request,response);
		 return  "/JSP/view/transfer/TransferReserve.jsp"; 
	}
	
	public String TransferSelect(HttpServletRequest request,HttpServletResponse response)  throws Throwable { 
		headProcess(request,response);
		//int deposit=transferMybatisdao.getDeposit("dasom7107");
		//request.setAttribute("deposit", deposit);
		
		return  "/JSP/view/transfer/TransferSelect.jsp"; 
	} 
	
	public String TransferSelectList(HttpServletRequest request,HttpServletResponse response)  throws Throwable { 	//기간 설정 메소드(다솜이 달력메소드 참고 후 수정할게요)
		headProcess(request,response);
		//int deposit=transferMybatisdao.getDeposit("dasom7107");
		//request.setAttribute("deposit", deposit);
		int error=0;		//에러체크를 위한 변수
		try {
			boolean check_Account= transferMybatisdao.check_account_no(request.getParameter("ACCOUNT_NO"));	//통장이 존재하는지 확인하는 메소드
			if(check_Account) {
				transferdata.setAccount_no(request.getParameter("ACCOUNT_NO"));		//통장이 존재할 경우 setAccount_no
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		Calendar cal=Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat df=new SimpleDateFormat("yyyy/MM/dd");
		String now_date=df.format(cal.getTime());
	
		int select_period=Integer.parseInt(request.getParameter("select_period"));
		
		String first_year,first_month,first_day,second_year,second_month,second_day="";
		
		if(select_period==0) {
			 first_year=request.getParameter("transfer_year");
			 first_month=request.getParameter("transfer_month");
			 second_year=request.getParameter("transfer_year2");
			 second_month=request.getParameter("transfer_month2");
			
			 if(first_month.length()<2) {
				 first_month="0"+first_month;
			}
			 first_day=request.getParameter("transfer_day");
			if(first_day.length()<2) {
				first_day="0"+first_day;
			}
			 if(second_month.length()<2) {
				 second_month="0"+second_month;
			}
			 second_day=request.getParameter("transfer_day2");
			if(second_day.length()<2) {
				second_day="0"+second_day;
			}
			
			String first_date=first_year+first_month+first_day;
			String second_date=second_year+second_month+second_day;
			List<TransferDTO> transList=transferMybatisdao.dateTransList(second_date,first_date,transferdata.getAccount_no());
			
			request.setAttribute("transList", transList);		
			return  "/JSP/view/transfer/TransferSelectList.jsp"; 
		}else if(select_period<10 && select_period>0) {
			cal.add(Calendar.DATE, -select_period);
		}else {
			cal.add(Calendar.MONTH, -(select_period/10));
		}

		String select_date=df.format(cal.getTime());

		List<TransferDTO> transList=transferMybatisdao.dateTransList(now_date,select_date,transferdata.getAccount_no());
		
		request.setAttribute("transList", transList);		
		return  "/JSP/view/transfer/TransferSelectList.jsp"; 
	} 
	public String TransferAuth(HttpServletRequest request, HttpServletResponse response)  throws Throwable {
		headProcess(request,response);
		int error=0;
		int num=Integer.parseInt(request.getParameter("TransferNum"));
		try {
			//transferdata.setTransfer_no(2);
			//통장이 존재하는지 1번 
			boolean check_Account= transferMybatisdao.check_account_no(request.getParameter("ACCOUNT_NO")); //통장이 존재하는지 확인하는 메소드
			if(check_Account) {
				transferdata.setAccount_no(request.getParameter("ACCOUNT_NO"));	//통장이 존재할 경우 
			}
			transferdata.setMember_id(id);
			transferdata.setTransfer_alias(request.getParameter("TRANSFER_ALIAS"));
			transferdata.setTransfer_to_member_id("hyeonmo2");	
			//통장에 돈이 부족한지 2번
			boolean check_Account_money=transferMybatisdao.check_account_money(request.getParameter("ACCOUNT_NO"),Integer.parseInt(request.getParameter("TRANSFER_PRICE")));
			if(check_Account_money) {	//통장에 돈이 충분한 경우
				transferdata.setTransfer_price(Integer.parseInt(request.getParameter("TRANSFER_PRICE")));
			}else {		//통장에 돈이 부족한 경우
				error=2;
				request.setAttribute("error", error);
				return "/JSP/view/transfer/TransferWrite.jsp";
			}
			//보낼 통장이 존재하는지 3번
			boolean check_TransferAccount=transferMybatisdao.check_account_no(request.getParameter("TRANSFER_TO_ACCOUNT_NO"));
			if(check_TransferAccount) {	//보낼 통장이 존재하는 경우
				transferdata.setTransfer_to_account_no(request.getParameter("TRANSFER_TO_ACCOUNT_NO"));
			}else {
				error=3;
				request.setAttribute("error", error);
				return "/JSP/view/transfer/TransferWrite.jsp";
			}
			//자신에게 보내지 못하도록 4번
			if(request.getParameter("ACCOUNT_NO").equals(request.getParameter("TRANSFER_TO_ACCOUNT_NO"))) {
				error=4;
				request.setAttribute("error", error);
				return "/JSP/view/transfer/TransferWrite.jsp";
			}
			if(num==1) {	//즉시 이체인 경우
				result=transferMybatisdao.transferInsert(transferdata,num);		//이체 내역 삽입
				int transcount=transferMybatisdao.getTransListCount(num);	// 마지막 행 = 사용자 정보
				transferdata=transferMybatisdao.transferDetail(transcount, num);	//사용자 정보
				transferMybatisdao.updateMoney(transferdata.getAccount_no(),transferdata.getTransfer_price(),1);		//1: Minus Money 2.Plus Money
				transferMybatisdao.updateMoney(transferdata.getTransfer_to_account_no(),transferdata.getTransfer_price(),2);
				return "/JSP/view/transfer/TransferAuth.jsp";
			}else if(num==2 || num==3) {	//자동이체 , 예약이체 (달력 수정 이후 주석 달게요)
				String year=request.getParameter("transfer_year");
				String month=request.getParameter("transfer_month");
				if(month.length()<2) {
					month="0"+month;
				}
				String day=request.getParameter("transfer_day");
				if(day.length()<2) {
					day="0"+day;
				}
				if(num==2) {
					transferdata.setTransfer_auto_period(request.getParameter("TRANSFER_AUTO_PERIOD"));				
					transferdata.setTransfer_auto_period_start(year+""+month+""+day);
				}
				else if(num==3){
					transferdata.setTransfer_res_day(year+""+month+""+day);
				}
				try {
					String period_start="";
					if(num==2) {
						transferdata.setTransfer_auto_period(request.getParameter("TRANSFER_AUTO_PERIOD"));
					 	period_start=transferdata.getTransfer_auto_period_start();
					}else if(num==3) {
						period_start=transferdata.getTransfer_res_day();
					}
						Date today=new Date();
						System.out.println("날짜:"+ period_start);
						Date actday=new SimpleDateFormat("yyyyMMdd").parse(period_start);
						transferdata.setTransfer_auto_period_start(period_start);
						
						//날짜 비교 유효성
						if( (actday!=null) && actday.getTime() > today.getTime()) {
							boolean insert=transferMybatisdao.transferInsert(transferdata,num);
							if(insert) {
								int transcount=transferMybatisdao.getTransListCount(num);
								transferdata=transferMybatisdao.transferDetail(transcount, num);
								System.out.println("통장번호"+ transferdata.getAccount_no());
								System.out.println("이체가격"+ transferdata.getTransfer_price());
								transferMybatisdao.updateMoney(transferdata.getAccount_no(),transferdata.getTransfer_price(),1);		//1: Minus Money 2.Plus Money
								transferMybatisdao.updateMoney(transferdata.getTransfer_to_account_no(),transferdata.getTransfer_price(),2);		
								return "/JSP/view/transfer/TransferAuth.jsp";
							}
						}					
						else {
							error=5;
							System.out.println("에러입니다");
							request.setAttribute("error", error);
							if(num==2) {
								return "/JSP/view/transfer/TransferAuto.jsp";
							}else if(num==3) {
								return "/JSP/view/transfer/TransferReserve.jsp";
							}
						}
				}catch(java.text.ParseException e) {
					error=6;
					request.setAttribute("error", error);
					if(num==2) {
						return "/JSP/view/transfer/TransferAuto.jsp";
					}else if(num==3) {
						return "/JSP/view/transfer/TransferReserve.jsp";
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			}catch(Exception e) {
				e.printStackTrace();
			}
		return "/JSP/view/transfer/TransferAuth.jsp";			
	} 
}
