package model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

public class OpenBankingDTO implements Serializable {
	private String open_account_no; // 오픈뱅킹 계좌번호
	private String member_id; // 아이디
	private String open_bank; // 오픈뱅킹 은행명
	private String open_account_pw; // 오픈뱅킹 계좌 비밀번호
	private int open_balance; // 오픈뱅킹 잔액
	private Date regdate; // 오픈뱅킹 등록날짜

	public OpenBankingDTO() {
		super();

	}

	public String getOpen_account_no() {
		return open_account_no;
	}

	public void setOpen_account_no(String open_account_no) {
		this.open_account_no = open_account_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getOpen_bank() {
		return open_bank;
	}

	public void setOpen_bank(String open_bank) {
		this.open_bank = open_bank;
	}

	public String getOpen_account_pw() {
		return open_account_pw;
	}

	public void setOpen_account_pw(String open_account_pw) {
		this.open_account_pw = open_account_pw;
	}

	public int getOpen_balance() {
		return open_balance;
	}

	public void setOpen_balance(int open_balance) {
		this.open_balance = open_balance;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "OpenBankingDTO [open_account_no=" + open_account_no
				+ ", member_id=" + member_id + ", open_bank=" + open_bank
				+ ", open_account_pw=" + open_account_pw + ", open_balance="
				+ open_balance + ", regdate=" + regdate + "]";
	}

	

}