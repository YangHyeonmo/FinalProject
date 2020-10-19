package account;

import java.io.Serializable;
import java.sql.Timestamp;

public class AccountDTO implements Serializable{

    private String member_id; 
    private String account_type;
    private String account_num;
    private String account_name;
    private int account_pw;
    private String account_alias;
    private Timestamp made_date;
    private Timestamp account_date;
    private String sum;
    private int withdraw;
    private int deposit;   
    private int balance;
    private String content;
    private String bank_place;
    private String send_get;
    private int count;
    private int rate;
    
   @Override
   public String toString() {
      return "AccountDTO [member_id=" + member_id + ", account_type=" + account_type + ", account_num=" + account_num
            + ", account_name=" + account_name + ", account_pw=" + account_pw + ", account_alias=" + account_alias
            + ", made_date=" + made_date + ", account_date=" + account_date + ", sum=" + sum + ", withdraw="
            + withdraw + ", deposit=" + deposit + ", balance=" + balance + ", content=" + content + ", bank_place="
            + bank_place + ", send_get=" + send_get + ", count=" + count + ", rate=" + rate + "]";
   }
   public String getMember_id() {
      return member_id;
   }
   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }
   public String getAccount_type() {
      return account_type;
   }
   public void setAccount_type(String account_type) {
      this.account_type = account_type;
   }
   public String getAccount_num() {
      return account_num;
   }
   public void setAccount_num(String account_num) {
      this.account_num = account_num;
   }
   public String getAccount_name() {
      return account_name;
   }
   public void setAccount_name(String account_name) {
      this.account_name = account_name;
   }
   public int getAccount_pw() {
      return account_pw;
   }
   public void setAccount_pw(int account_pw) {
      this.account_pw = account_pw;
   }
   public String getAccount_alias() {
      return account_alias;
   }
   public void setAccount_alias(String account_alias) {
      this.account_alias = account_alias;
   }
   public Timestamp getMade_date() {
      return made_date;
   }
   public void setMade_date(Timestamp made_date) {
      this.made_date = made_date;
   }
   public Timestamp getAccount_date() {
      return account_date;
   }
   public void setAccount_date(Timestamp account_date) {
      this.account_date = account_date;
   }
   public String getSum() {
      return sum;
   }
   public void setSum(String sum) {
      this.sum = sum;
   }
   public int getWithdraw() {
      return withdraw;
   }
   public void setWithdraw(int withdraw) {
      this.withdraw = withdraw;
   }
   public int getDeposit() {
      return deposit;
   }
   public void setDeposit(int deposit) {
      this.deposit = deposit;
   }
   public int getBalance() {
      return balance;
   }
   public void setBalance(int balance) {
      this.balance = balance;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getBank_place() {
      return bank_place;
   }
   public void setBank_place(String bank_place) {
      this.bank_place = bank_place;
   }
   public String getSend_get() {
      return send_get;
   }
   public void setSend_get(String send_get) {
      this.send_get = send_get;
   }
   public int getCount() {
      return count;
   }
   public void setCount(int count) {
      this.count = count;
   }
   public int getRate() {
      return rate;
   }
   public void setRate(int rate) {
      this.rate = rate;
   }
     
   
    
}