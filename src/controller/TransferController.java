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
      /*
       session = request.getSession(); 
       id="hyeonmo";//(String)session.getAttribute("member_id"); //���ǿ� ����ִ� ���̵� id ����������
       List<AccountDTO> account_num= transferMybatisdao.getAccountNum(id); //������� ��� ������ ��� List �����ϰ� View �� �ѷ���
        
       request.setAttribute("account_num", account_num);
      */
      
   }
   @RequestMapping("TransferWrite")
   public String TransferWrite()   { 
         
      return  "transfer/TransferWrite"; 
   } 
   
   @RequestMapping("stockinput")
   public String stockinput()   { 
         
      return  "transfer/stockinput"; 
   } 
   
  
   
   /*@RequestMapping("messageAuth")
   public String messageAuth(Model m) throws Exception   { 
      
      MemberDTO member=new MemberDTO();
      MemberMybatisDAO mbPro=new MemberMybatisDAO();
      
       member=mbPro.getMember("hangbin");
      
       m.addAttribute("member", member);
      return  "transfer/messageAuth"; 
   } 
   */
   @RequestMapping("realfinish")
   public String realfinish(Model m,String phone,int auth,int random) throws Exception   { 
      
      if(random == auth) {
         return  "transfer/realfinish";
      }else {
         m.addAttribute("error", 1);
         return "transfer/finish";
      }
      
   } 
/*   @RequestMapping("emailSendAction")
   public String emailSendAction() throws Exception   { 
      //MemberMybatisDAO memberDAO = new MemberMybatisDAO();
      //String id = "hyeonmo";
      final String from = "yhj940928@gmail.com";  
      String to="yhj940928@naver.com";
      // Assuming you are sending email from localhost  
      String host = "smtp.googlemail.com";  
        
      //587��Ʈ       
      Properties props = new Properties();  
      props.put("mail.smtp.host", host); //SMTP Host  
      props.put("mail.smtp.port", "587"); //TLS Port  
      props.put("mail.smtp.auth", "true"); //enable authentication  
      props.put("mail.smtp.starttls.enable", "true"); //enable   
      props.put("mail.smtp.ssl.trust", host);  

      Authenticator auth = new Authenticator() {  
          //override the getPasswordAuthentication method  
          protected PasswordAuthentication getPasswordAuthentication() {  
              return new PasswordAuthentication(from, "didgusah135@");  
          }  
      };  
      Session session = Session.getInstance(props, auth);  
        
      try {  
          // Create a default MimeMessage object.  
          MimeMessage message = new MimeMessage(session);  
        
          // Set From: header field of the header.  
          message.setFrom(new InternetAddress(from));  
        
          // Set To: header field of the header.  
          message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));  
            
        
          // Set Subject: header field  
          //message.setSubject("������� ���� ����?","utf-8");  
          message.setSubject("���� �׽�Ʈ","utf-8");  
        
          // Create the message part  
          BodyPart messageBodyPart = new MimeBodyPart();  
        
          // Fill the message  
          messageBodyPart.setText("����� ���� �ñ��� �˷��ֱ� �ٶ�!");  
        
          // Create a multipar message  
          Multipart multipart = new MimeMultipart();  
        
          // Set text message part  
          multipart.addBodyPart(messageBodyPart);  
        
          // Part two is attachment  
          messageBodyPart = new MimeBodyPart(); 
          String filename = "file.txt"; 
          DataSource source = new FileDataSource(filename); 
          messageBodyPart.setDataHandler(new DataHandler(source)); 
          messageBodyPart.setFileName(filename); 
          multipart.addBodyPart(messageBodyPart);  
        
          // Send the complete message parts  
          message.setContent(multipart);  
        
          // Send message  
          Transport.send(message);  
          System.out.println(to+" ���� ���ۿϷ�!");  
      } catch (MessagingException mex) {  
          System.out.println(to+" ���� ���ۿ���!");  
          mex.printStackTrace();  
      }  */


      /*String host = "http://localhost:8088/Final_String/";
      String from = "yhj940928@gmail.com";
      String to = "yhj940928@naver.com"; //memberDAO.getUserEmail(id);
      String subject = "BLUEOCEAN�� ���� �̸��� ���� �����Դϴ�.";
      String content = "���� ��ũ�� �����Ͽ� �̸��� ������ �����ϼ���." + 
            "<a href='" + host + "transfer/emailCheckAction?code=" + new SHA256().getSHA256(to) + "'>�̸��� �����ϱ�</a>";
      
      //���� ȯ�� ���� ����
      Properties p  = new Properties();
      //p.put("mail.smtp.host", host);
      //���� ���������� gmail�� �̿��� ���̱� ������ smtp�� ���
      p.setProperty("mail.transport.protocol", "smtp");
      //������ ����
      p.put("mail.smtp.user", from);
      //���� ȣ��Ʈ �ּҸ� ����
      p.put("mail.smtp.host", "smtp.googlemail.com");
      //��Ʈ��ȣ
      p.put("mail.smtp.port", "587");
      //Starttls�� �̿��� ���� �������� �ٽ�, JavaMail�� TLS��带 �����϶�� ��������� ��û
      p.put("mail.smtp.starttls.enable", "true");
      //id, pwd ������ �ʿ�
      p.put("mail.smtp.auth", "true");
      //����� ���
      p.put("mail.smtp.debug","true");
      p.put("mail.smtp.socketFactory.port", "587");
      p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
      p.put("mail.smtp.socketFactory.fallback","false");      
      try{
         Authenticator auth = new Gmail();
         // id�� password�� �����ϰ� session�� ����
         Session ses = Session.getInstance(p, auth); 
         ses.setDebug(true);
         // ���� �޽����� ����� ���� Ŭ������ �����մϴ�.
         MimeMessage msg = new MimeMessage(ses);
         // ���� ������ �����մϴ�.
         msg.setSubject(subject);
         //�۽��� ����
         Address fromAddr = new InternetAddress(from);
         msg.setFrom(fromAddr);
         //������ ����
         Address toAddr = new InternetAddress(to);
         // ���� ���� ������ ����
         msg.addRecipient(Message.RecipientType.TO, toAddr);
         // ���� ������ ������ ���� Ŭ������ �����մϴ�
         msg.setContent(content, "text/html;charset=UTF8");
         //���� ������
         Transport.send(msg);
      }
      catch(Exception e){
         e.printStackTrace();      
      }*/
      
   /*   
      return "transfer/emailSendAction";
      
   } 
   @RequestMapping("emailCheckAction")
   public String emailCheckAction(String code,Model m) throws Exception   { 
      MemberMybatisDAO member = new MemberMybatisDAO();
      String id = null;
      String msg = null;
      String location = null;
      String userEmail = member.getUserEmail(id);
      
      boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
      
      if(isRight == true){
          msg = "������ �����߽��ϴ�";
          m.addAttribute("msg",msg);
          return "transfer/realfinish";
          
      }
      else{
          msg = "��ȿ���� �ʴ� �ڵ��Դϴ�";
          m.addAttribute("msg",msg);
          return "transfer/TransferAuth";
      }
   } 
   @RequestMapping("emailSendConfirm")
   public String emailSendConfirm() throws Exception   { 
      
      return "transfer/emailSendConfirm";
      
   } */
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
          params.put("from", "01068992734");   // �߽���ȭ��ȣ. �׽�Ʈ�ÿ��� �߽�,���� �Ѵ� ���� ��ȣ�� �ϸ� ��
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
      
         System.out.println(1);
         m.addAttribute("random", random);
         m.addAttribute("phone",member.getMember_phonenumber());
      }else if(authType==2) {
         /*String host = "http://localhost:8088/backup/";
         String to = member.getMember_email(); //memberDAO.getUserEmail(id);
         String subject = "BLUEOCEAN�� ���� �̸��� ���� �����Դϴ�.";
         String content = "���� ��ũ�� �����Ͽ� �̸��� ������ �����ϼ���." + 
            "'<a href=" + host + "transfer/emailCheckAction?code=" + new SHA256().getSHA256(to) + "'>�̸��� �����ϱ�</a>";
      
          String user = "yhj940928@gmail.com"; // ���̹��� ��� ���̹� ����, gmail��� gmail ����
              String password = "didgusah135@";   // �н�����

              // SMTP ���� ������ �����Ѵ�.
              Properties prop = new Properties();
              prop.put("mail.smtp.host", "smtp.gmail.com"); 
              prop.put("mail.smtp.port", 465); 
              prop.put("mail.smtp.auth", "true"); 
              prop.put("mail.smtp.ssl.enable", "true"); 
              prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
              
              Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
                  protected PasswordAuthentication getPasswordAuthentication() {
                      return new PasswordAuthentication(user, password);
                  }
              });

              try {
                  MimeMessage message = new MimeMessage(session);
                  message.setFrom(new InternetAddress(user));

                  //�����ڸ����ּ�
                  message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); 

                  // Subject
                  message.setSubject(subject); //���� ������ �Է�

                  // Text
                  message.setText(content);    //���� ������ �Է�

                  // send the message
                  Transport.send(message); ////����
                  System.out.println("message sent successfully...");
              } catch (AddressException e) {
                  // TODO Auto-generated catch block
                  e.printStackTrace();
              } catch (MessagingException e) {
                  // TODO Auto-generated catch block
                  e.printStackTrace();
              }*/
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
   public String TransferSelectList(TransferDTO transfer, int select_period,
         String first_year,String first_month, String first_day,String second_year,
         String second_month, String second_day, Model m   )  {    //�Ⱓ ���� �޼ҵ�(�ټ��� �޷¸޼ҵ� ���� �� �����ҰԿ�)
      
      int error=0;      //����üũ�� ���� ����
      try {
         boolean check_Account= transferMybatisdao.check_account_no(transfer.getAccount_no());   //������ �����ϴ��� Ȯ���ϴ� �޼ҵ�
         if(check_Account) {
            transferdata.setAccount_no(transfer.getAccount_no());      //������ ������ ��� setAccount_no
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
         List<TransferDTO> transList=transferMybatisdao.dateTransList(second_date,first_date,transferdata.getAccount_no());
         
         m.addAttribute("transList", transList);

         return  "transfer/TransferSelectList"; 
      }else if(select_period<10 && select_period>0) {
         cal.add(Calendar.DATE, -select_period);
      }else {
         cal.add(Calendar.MONTH, -(select_period/10));
      }

      String select_date=df.format(cal.getTime());

      List<TransferDTO> transList=transferMybatisdao.dateTransList(now_date,select_date,transferdata.getAccount_no());
      
      m.addAttribute("transList", transList);   
      return  "transfer/TransferSelectList"; 
   } 
   @RequestMapping("TransferAuth")
   public String TransferAuth(TransferDTO transfer,int num, String year, String month,String day,Model m)  throws Throwable {
      int error=0;
      try {
         //������ �����ϴ��� 1�� 
         boolean check_Account= transferMybatisdao.check_account_no(transfer.getAccount_no()); //������ �����ϴ��� Ȯ���ϴ� �޼ҵ�
         if(check_Account) {
            transferdata.setAccount_no(transfer.getAccount_no());   //������ ������ ��� 
         }
         transferdata.setMember_id("hyeonmo");
         transferdata.setTransfer_alias(transfer.getTransfer_alias());
         transferdata.setTransfer_to_member_id("hyeonmo2");   
         //���忡 ���� �������� 2��
         boolean check_Account_money=transferMybatisdao.check_account_money(transfer.getAccount_no(),transfer.getTransfer_price());
         if(check_Account_money) {   //���忡 ���� ����� ���
            transferdata.setTransfer_price(transfer.getTransfer_price());
         }else {      //���忡 ���� ������ ���
            error=2;
            m.addAttribute("error", error);
            return "transfer/TransferWrite";
         }
         //���� ������ �����ϴ��� 3��
         boolean check_TransferAccount=transferMybatisdao.check_account_no(transfer.getTransfer_to_account_no());
         if(check_TransferAccount) {   //���� ������ �����ϴ� ���
            transferdata.setTransfer_to_account_no(transfer.getTransfer_to_account_no());
         }else {
            error=3;
            m.addAttribute("error", error);
            return "transfer/TransferWrite";
         }
         //�ڽſ��� ������ ���ϵ��� 4��
         if(transfer.getAccount_no().equals(transfer.getTransfer_to_account_no())) {
            error=4;
            m.addAttribute("error", error);
            return "transfer/TransferWrite";
         }
         if(num==1) {   //��� ��ü�� ���
            //result=transferMybatisdao.transferInsert(transferdata,num);      //��ü ���� ����
            //int transcount=transferMybatisdao.getTransListCount(num);   // ������ �� = ����� ����
            //transferdata=transferMybatisdao.transferDetail(transcount, num);   //����� ����
            //transferMybatisdao.updateMoney(transferdata.getAccount_no(),transferdata.getTransfer_price(),1);      //1: Minus Money 2.Plus Money
            //transferMybatisdao.updateMoney(transferdata.getTransfer_to_account_no(),transferdata.getTransfer_price(),2);
            m.addAttribute("transferdata", transferdata);
            return "transfer/TransferAuth";
         }else if(num==2 || num==3) {   //�ڵ���ü , ������ü (�޷� ���� ���� �ּ� �ްԿ�)
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
                     error=5;
                     System.out.println("�����Դϴ�");
                     m.addAttribute("error", error);
                     if(num==2) {
                        return "transfer/TransferAuto";
                     }else if(num==3) {
                        return "transfer/TransferReserve";
                     }
                  }
            }catch(java.text.ParseException e) {
               error=6;
               m.addAttribute("error", error);
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