package controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
//import javax.mail.Message;            //����
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import net.nurigo.java_sdk.api.Message;//����
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
//import org.rosuda.REngine.Rserve.RConnection;
//import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.AccountDTO;
import model.MemberDTO;
//import model.StockDTO;
import model.TransferDTO;

import net.nurigo.java_sdk.exceptions.CoolsmsException;
import service.MemberMybatisDAO;
//import service.StockDAO;
import service.TransferMybatisDAO;
import util.Gmail;
import util.SHA256;
import util.SendMail;

@Controller
@RequestMapping("/transfer/")
public class TransferController{

   @Autowired
   TransferMybatisDAO transferMybatisdao;
   
   public TransferDTO transferdata = new TransferDTO();
   public String id;      //����� ���̵�
   public boolean result = false;

   public MemberDTO member=null;
   public HttpSession session=null;
   public ModelAndView mv = new ModelAndView();
   
   @ModelAttribute
   public void headProcess(HttpServletRequest request, HttpServletResponse res) {
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      HttpSession session = request.getSession();							
		id= (String)session.getAttribute("member_id");	
		List<AccountDTO> account_num= transferMybatisdao.getAccountNum(id);	
		
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
   
   @RequestMapping("stockinput")
   public String stockinput()   { 
         
      return  "transfer/stockinput"; 
   } 
   
   @RequestMapping("realfinish")
   public String realfinish(Model m,int auth,int random) throws Exception   { 
      
      if(random == auth) {
    	//   result=transferMybatisdao.transferInsert(transferdata,num);     
           transferMybatisdao.updateMoney(transferdata.getAccount_no(),transferdata.getTransfer_price(),1);      //1: Minus Money 2.Plus Money
           transferMybatisdao.updateMoney(transferdata.getTransfer_to_account_no(),transferdata.getTransfer_price(),2);
          
    	 m.addAttribute("finish",1);
         return  "view/mainPage";
      }else {
         m.addAttribute("error", 1);
         return "transfer/finish";
      }
      
   } 
   @RequestMapping("finish")
   public String finish(MemberDTO member,Model m,int authType)   { 
      //�ڵ��� ��ȣ �Է�
      int random=(int)(Math.random()*1000000)+1;
      if(authType==1) {
          String api_key = "NCSGDPVOV9E09TBL";
          String api_secret = "HXHETMZZX56FMFPU9OO2H4OHXWJDG2JK";
          Message coolsms = new Message(api_key, api_secret);
         
          // 4 params(to, from, type, text) are mandatory. must be filled
          HashMap<String, String> params = new HashMap<String, String>();
          params.put("to", member.getMember_phonenumber());   // ������ȭ��ȣ
          params.put("from", "01068992734");  
          params.put("type", "SMS");
          params.put("text", "[���� ��ȣ:"+random+"]");
          params.put("app_version", "test app 1.2"); // application name and version

          try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
          } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
          }         
         m.addAttribute("random", random);
         m.addAttribute("phone",member.getMember_phonenumber());
      }else if(authType==2) {
    	  SendMail send=new SendMail();
    	  send.send(member.getMember_email(), random);
      }
      return  "transfer/finish";
   } 
   
   @RequestMapping("TransferAuto")
   public String TransferAuto() { 
      return  "transfer/TransferAuto"; 
   } 
   @RequestMapping("TransferRes")
   public String TransferRes()  throws Throwable { 
      return  "transfer/TransferReserve"; 
   }
   @RequestMapping("TransferSelect")
   public String TransferSelect()  throws Throwable { 
      return  "transfer/TransferSelect"; 
   } 
   @RequestMapping("TransferSelectList")
	public String TransferSelectList(TransferDTO transfer,String select_period, Model m	)  { 	
		System.out.println("����:"+transfer.getAccount_no());
	try {
			boolean check_Account= transferMybatisdao.check_account_no(transfer.getAccount_no());	
			if(check_Account) {
				transferdata.setAccount_no(transfer.getAccount_no());		
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		Calendar cal=Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat df=new SimpleDateFormat("yyyy/MM/dd");
		String now_date=df.format(cal.getTime());
		List<TransferDTO> transList=transferMybatisdao.dateTransList(now_date,select_period,transferdata.getAccount_no());
		
		m.addAttribute("transList", transList);	
		return  "transfer/TransferSelectList"; 
	} 
   @RequestMapping("TransferAuth")
   public String TransferAuth(TransferDTO transfer,int num, String year, String month,String day,Model m)  throws Throwable {
	  String id=(String)session.getAttribute("member_id");
     try {
         boolean check_Account= transferMybatisdao.check_account_no(transfer.getAccount_no()); 
         if(check_Account) {
            transferdata.setAccount_no(transfer.getAccount_no());   
         }
         transferdata.setMember_id(id); 
         boolean check_Account_money=transferMybatisdao.check_account_money(transfer.getAccount_no(),transfer.getTransfer_price());
         if(check_Account_money) {  
            transferdata.setTransfer_price(transfer.getTransfer_price());
         }else {     
            m.addAttribute("error", 2);
            return "transfer/TransferWrite";
         }
         boolean check_TransferAccount=transferMybatisdao.check_account_no(transfer.getTransfer_to_account_no());
         if(check_TransferAccount) {   
            transferdata.setTransfer_to_account_no(transfer.getTransfer_to_account_no());
         }else {
            m.addAttribute("error", 3);
            return "transfer/TransferWrite";
         }
         //�ڽſ��� ������ ���ϵ��� 4��
         if(transfer.getAccount_no().equals(transfer.getTransfer_to_account_no())) {
            m.addAttribute("error", 4);
            return "transfer/TransferWrite";
         }
         if(num==1) {   
            m.addAttribute("transferdata", transferdata);
            return "transfer/TransferAuth";
         }else if(num==2 || num==3) {   
            if(month.length()<2) {
               month="0"+month;
            }
            if(day.length()<2) {
               day="0"+day;
            }
            if(num==2) {
               transferdata.setTransfer_auto_period(transfer.getTransfer_auto_period());            
               transferdata.setTransfer_auto_period_start(year+""+month+""+day);
            }
            else if(num==3){
               transferdata.setTransfer_res_day(year+""+month+""+day);
            }
            try {
               String period_start="";
               if(num==2) {
                  transferdata.setTransfer_auto_period(transfer.getTransfer_auto_period());
                   period_start=transferdata.getTransfer_auto_period_start();
               }else if(num==3) {
                  period_start=transferdata.getTransfer_res_day();
               }
                  Date today=new Date();
                  System.out.println("��¥:"+ period_start);
                  Date actday=new SimpleDateFormat("yyyyMMdd").parse(period_start);
                  transferdata.setTransfer_auto_period_start(period_start);
                  
                  //��¥ �� ��ȿ��
                  if( (actday!=null) && actday.getTime() > today.getTime()) {
                     boolean insert=transferMybatisdao.transferInsert(transferdata,num);
                     if(insert) {
                        int transcount=transferMybatisdao.getTransListCount(num);
                        transferdata=transferMybatisdao.transferDetail(transcount, num);
                        System.out.println("�����ȣ"+ transferdata.getAccount_no());
                        System.out.println("��ü����"+ transferdata.getTransfer_price());
                        transferMybatisdao.updateMoney(transferdata.getAccount_no(),transferdata.getTransfer_price(),1);      //1: Minus Money 2.Plus Money
                        transferMybatisdao.updateMoney(transferdata.getTransfer_to_account_no(),transferdata.getTransfer_price(),2);      
                        return "transfer/TransferAuth";
                     }
                  }               
                  else {
                     m.addAttribute("error", 5);
                     if(num==2) {
                        return "transfer/TransferAuto";
                     }else if(num==3) {
                        return "transfer/TransferReserve";
                     }
                  }
            }catch(java.text.ParseException e) {
               m.addAttribute("error", 6);
               if(num==2) {
                  return "transfer/TransferAuto";
               }else if(num==3) {
                  return "transfer/TransferReserve";
               }
            }catch(Exception e) {
               e.printStackTrace();
            }
         }
         }catch(Exception e) {
            e.printStackTrace();
         }
      m.addAttribute("transfer", transfer);
      return "transfer/TransferAuth";         
   } 
}