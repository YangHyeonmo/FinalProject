package model;

public class MainAccountDTO {

	private String member_id;
	private String account_num;
	private String account_pw;
	private int balance;

	public MainAccountDTO() {
		super();
	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	public String getAccount_pw() {
		return account_pw;
	}
	public void setAccount_pw(String account_pw) {
		this.account_pw = account_pw;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "MainAccountDTO [member_id=" + member_id + ", account_num="
				+ account_num + ", account_pw=" + account_pw + ", balance="
				+ balance + "]";
	}

}
