package controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
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
import service.AccountDAO;
import service.MemberMybatisDAO;
//import service.StockDAO;
import service.TransferMybatisDAO;
import util.CryptoUtil;
import util.Gmail;
import util.SHA256;
import util.SendMail;
import util.TestCrypto;

class TransferInfoSub1Security extends Thread{
	public void run() {
		System.out.println("***BlockChain 시작***");
			try {
				String main="";
				String line = "";
				
				BufferedReader br = new BufferedReader(new FileReader("src/encryptedSecurityFiles/TransferInfoSecurityMain.txt"));
				BufferedWriter sub1 = new BufferedWriter(new FileWriter("src/encryptedSecurityFiles/TransferInfoSub1.txt"));
				while ((line = br.readLine()) != null) {
					main += line+"\n";
				}
		
				sub1.write(main+"\n");
				sub1.flush();
				sub1.close();
				
				}
			catch (Exception e) {
		     }
	        System.out.println("==================================");
			System.out.println("***TransferInfoSub1***파일저장 완료***BlockChain***");
	        System.out.println("==================================");

		}
}
class TransferInfoSub2Security extends Thread{
	public void run() {
			try {
				String main="";
				String line = "";
				
				BufferedReader br = new BufferedReader(new FileReader("src/encryptedSecurityFiles/TransferInfoSecurityMain.txt"));
				BufferedWriter sub2 = new BufferedWriter(new FileWriter("src/encryptedSecurityFiles/TransferInfoSub2.txt"));
				while ((line = br.readLine()) != null) {
					main += line+"\n";
				}
				sub2.write(main+"\n");
				sub2.flush();
				sub2.close();
				}
			
			catch (Exception e) {
		     }
			System.out.println("***TransferInfoSub2***파일저장 완료***BlockChain***");
	        System.out.println("==================================");

		}
	}
class TransferInfoSub3Security extends Thread{
	public void run() {
			try {
				String main="";
				String line = "";
				BufferedReader br = new BufferedReader(new FileReader("src/encryptedSecurityFiles/TransferInfoSecurityMain.txt"));
				BufferedWriter sub3 = new BufferedWriter(new FileWriter("src/encryptedSecurityFiles/TransferInfoSub3.txt"));
	
				while ((line = br.readLine()) != null) {
					main += line+"\n";
				}
				sub3.write(main+"\n");
				sub3.flush();
				sub3.close();
			}
			catch (Exception e) {
		     }
			System.out.println("***TransferInfoSub3***파일저장 완료***BlockChain***");		
	        System.out.println("==================================");

			}
	}




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
        session = request.getSession();							
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
      AccountDAO a=new AccountDAO();
      AccountDTO foraccount=a.accountInfo(transferdata.getAccount_no());
      AccountDTO toaccount=a.accountInfo(transferdata.getTransfer_to_account_no());
      if(random == auth) {
    	//   result=transferMybatisdao.transferInsert(transferdata,num);     
           transferMybatisdao.updateMoney(transferdata.getAccount_no(),transferdata.getTransfer_price(),1);      //1: Minus Money 2.Plus Money
           transferMybatisdao.updateMoney(transferdata.getTransfer_to_account_no(),transferdata.getTransfer_price(),2);
           System.out.println(foraccount+ " \n" + toaccount);
    	 m.addAttribute("finish",1);
         return  "view/mainPage";
      }else {
         m.addAttribute("error", 1);
         return "transfer/finish";
      }
      
   } 
   
   @RequestMapping("finish")
   public String finish(MemberDTO member,Model m,int authType,HttpServletRequest request) throws Exception   { 
      int random=(int)(Math.random()*1000000)+1;
      if(authType==1) {
          String api_key = "NCSGDPVOV9E09TBL";
          String api_secret = "HXHETMZZX56FMFPU9OO2H4OHXWJDG2JK";
          Message coolsms = new Message(api_key, api_secret);
         
          // 4 params(to, from, type, text) are mandatory. must be filled
          HashMap<String, String> params = new HashMap<String, String>();
          params.put("to", member.getMember_phonenumber());  
          params.put("from", "01068992734");  
          params.put("type", "SMS");
          params.put("text", "[valid:"+random+"]");
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
      
      System.out.println(transferdata.getAccount_no());
      result=transferMybatisdao.transferInsert(transferdata,transferdata.getNum());
      transferMybatisdao.updateMoney(transferdata.getAccount_no(),transferdata.getTransfer_price(),1);
      transferMybatisdao.updateMoney(transferdata.getTransfer_to_account_no(),transferdata.getTransfer_price(),2);
      
      AccountDAO a=new AccountDAO();
      AccountDTO foraccount=a.accountInfo(transferdata.getAccount_no());
      AccountDTO toaccount=a.accountInfo(transferdata.getTransfer_to_account_no());
      
      
      String plainText = transferdata.getMember_id()+"님께서" + transferdata.getTransfer_to_member_id() + "님에게 " + transferdata.getTransfer_price()+"원을 보냈습니다";
      String key = "secret key";
      String encrypted = CryptoUtil.encryptAES256(plainText, key);
      System.out.println("AES-256 : enc - " + encrypted);
      System.out.println("AES-256 : dec - " + CryptoUtil.decryptAES256(encrypted, key));
      
      String path=request.getServletContext().getRealPath("/")+"text\\TransferInfoSecurityMain.txt";
      path=path.replace("\\", "/");
      
      BufferedWriter bw = new BufferedWriter(new FileWriter(path,true));
      
      
      bw.write(encrypted+"\n");
      bw.flush();
      bw.close();
      
            
      String main="";
      String sub1="";
      String sub2="";
      String sub3="";
      double compare=100/3;

    BufferedReader br = new BufferedReader(new FileReader(path));
    path=request.getServletContext().getRealPath("/")+"text\\TransferInfoSub1.txt";
    path=path.replace("\\", "/");
  	BufferedReader br1 = new BufferedReader(new FileReader(path));
  	path=request.getServletContext().getRealPath("/")+"text\\TransferInfoSub2.txt";
  	path=path.replace("\\", "/");
  	BufferedReader br2 = new BufferedReader(new FileReader(path));
 	path=request.getServletContext().getRealPath("/")+"text\\TransferInfoSub3.txt";
 	path=path.replace("\\", "/");
  	BufferedReader br3 = new BufferedReader(new FileReader(path));
		

	      try {
		     String  line="";
	            while ((line = br.readLine()) != null) {
	            	main+=line;
	            }
	      } catch (Exception e) {
	      }
	      
	      try {
		     String  line="";
	            while ((line = br1.readLine()) != null) {
	            	sub1+=line;
	            }
	      } catch (Exception e) {
	      }
	      try {
		     String  line="";
	            while ((line = br2.readLine()) != null) {
	            	sub2+=line;
	            }
	      } catch (Exception e) {
	      }
	      try {
			  String  line="";
		         while ((line = br3.readLine()) != null) {
		            sub3+=line;
		           }
		      } catch (Exception e) {
		      }
	      
	      
	      if(sub1.hashCode() == sub2.hashCode()) {
	    	  compare += 100/3;
	    	  if(sub2.hashCode() == sub3.hashCode()) {
		    	  compare += 100/3;
	    	  }
	      }
	      else if (sub2.hashCode() == sub3.hashCode()) {
	    	  compare += 100/3;
	      }
	      else if(sub1.hashCode() == sub3.hashCode()) {
  		  compare += 100/3;
  		 
  	  }
	      System.out.println("==================================");
	      System.out.println("BlockChain True일 확률 : " + compare +"%");
	      System.out.println("==================================");
	    
	    
     if(compare > 51) {
  	   TransferInfoSub1Security sub1Security = new TransferInfoSub1Security();
  	   TransferInfoSub2Security sub2Security = new TransferInfoSub2Security();
  	   TransferInfoSub3Security sub3Security = new TransferInfoSub3Security();
  	   Thread.sleep(5000);
  	   sub1Security.start();
  	   Thread.sleep(5000);
  	   sub2Security.start();
  	   Thread.sleep(5000);
  	   sub3Security.start();

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
   public String TransferAuth(TransferDTO transfer, String year, String month,String day,Model m)  throws Throwable {
	    id=(String)session.getAttribute("member_id");
     try {
         boolean check_Account= transferMybatisdao.check_account_no(transfer.getAccount_no()); 
         if(check_Account) {
            transferdata.setAccount_no(transfer.getAccount_no());   
         }
         transfer.setMember_id(id); 
         transferdata.setMember_id(id);
         boolean check_Account_money=transferMybatisdao.check_account_money(transfer.getAccount_no(),transfer.getTransfer_price());
         if(!check_Account_money) {  
        	 m.addAttribute("error", 2);
             return "transfer/TransferWrite";
         }
         boolean check_TransferAccount=transferMybatisdao.check_account_no(transfer.getTransfer_to_account_no());
         AccountDAO a=new AccountDAO();
         String tran_id=a.account_id(transfer.getTransfer_to_account_no());
         transfer.setTransfer_to_member_id(tran_id);
         transferdata.setTransfer_to_account_no(transfer.getTransfer_to_account_no());
         transferdata.setTransfer_to_member_id(tran_id);
         transferdata.setTransfer_alias(transfer.getTransfer_alias());
         transferdata.setTransfer_price(transfer.getTransfer_price());
         if(!check_TransferAccount) {   
        	 m.addAttribute("error", 3);
             return "transfer/TransferWrite";
         }
         if(transfer.getAccount_no().equals(transfer.getTransfer_to_account_no())) {
            m.addAttribute("error", 4);
            return "transfer/TransferWrite";
         }
         if(transfer.getNum()==1) {   
        	
            m.addAttribute("transferdata", transferdata);
            
            return "transfer/TransferAuth";
         }else if(transfer.getNum()==2 || transfer.getNum()==3) {   
            if(month.length()<2) {
               month="0"+month;
            }
            if(day.length()<2) {
               day="0"+day;
            }
            if(transfer.getNum()==2) {
               transferdata.setTransfer_auto_period(transfer.getTransfer_auto_period());            
               transferdata.setTransfer_auto_period_start(year+""+month+""+day);
            }
            else if(transfer.getNum()==3){
               transferdata.setTransfer_res_day(year+""+month+""+day);
            }
            try {
               String period_start="";
               if(transfer.getNum()==2) {
                  transferdata.setTransfer_auto_period(transfer.getTransfer_auto_period());
                   period_start=transferdata.getTransfer_auto_period_start();
               }else if(transfer.getNum()==3) {
                  period_start=transferdata.getTransfer_res_day();
               }
                  Date today=new Date();
                  System.out.println("��¥:"+ period_start);
                  Date actday=new SimpleDateFormat("yyyyMMdd").parse(period_start);
                  transferdata.setTransfer_auto_period_start(period_start);
                  
                  //��¥ �� ��ȿ��
                  if( (actday!=null) && actday.getTime() > today.getTime()) {
                     boolean insert=transferMybatisdao.transferInsert(transferdata,transfer.getNum());
                     if(insert) {
                        int transcount=transferMybatisdao.getTransListCount(transfer.getNum());
                        transferdata=transferMybatisdao.transferDetail(transcount, transfer.getNum());
                        System.out.println("�����ȣ"+ transferdata.getAccount_no());
                        System.out.println("��ü����"+ transferdata.getTransfer_price());
                        transferMybatisdao.updateMoney(transferdata.getAccount_no(),transferdata.getTransfer_price(),1);      //1: Minus Money 2.Plus Money
                        transferMybatisdao.updateMoney(transferdata.getTransfer_to_account_no(),transferdata.getTransfer_price(),2);      
                        return "transfer/TransferAuth";
                     }
                  }               
                  else {
                     m.addAttribute("error", 5);
                     if(transfer.getNum()==2) {
                        return "transfer/TransferAuto";
                     }else if(transfer.getNum()==3) {
                        return "transfer/TransferReserve";
                     }
                  }
            }catch(java.text.ParseException e) {
               m.addAttribute("error", 6);
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
      m.addAttribute("transfer", transfer);
      return "transfer/TransferAuth";         
   } 
   @RequestMapping("emailAuth")
   public String emailAuth() { 
      return  "transfer/emailAuth"; 
   } 
   @RequestMapping("messageAuth")
   public String messageAuth() { 
      return  "transfer/messageAuth"; 
   } 
}