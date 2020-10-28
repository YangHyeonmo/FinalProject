package model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

public class OpenBankingDTO implements Serializable {
	private String OPEN_ACCOUNT_NO; // 오픈뱅킹 계좌번호
	private String member_id; // 아이디
	private String OPEN_BANK; // 오픈뱅킹 은행명
	private String OPEN_ACCOUNT_PW; // 오픈뱅킹 계좌 비밀번호
	private int OPEN_BALANCE; // 오픈뱅킹 잔액
	private String OPEN_CARD_NAME; // 오픈뱅킹 카드명
	private Date REGDATE; // 오픈뱅킹 등록날짜

	public OpenBankingDTO() {
	}

	public String getOPEN_ACCOUNT_NO() {
		return OPEN_ACCOUNT_NO;
	}
	public void setOPEN_ACCOUNT_NO(String oPEN_ACCOUNT_NO) {
		OPEN_ACCOUNT_NO = oPEN_ACCOUNT_NO;
	}
	public String getmember_id() {
		return member_id;
	}
	public void setmember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getOPEN_BANK() {
		return OPEN_BANK;
	}
	public void setOPEN_BANK(String oPEN_BANK) {
		OPEN_BANK = oPEN_BANK;
	}
	public String getOPEN_ACCOUNT_PW() {
		return OPEN_ACCOUNT_PW;
	}
	public void setOPEN_ACCOUNT_PW(String oPEN_ACCOUNT_PW) {
		OPEN_ACCOUNT_PW = oPEN_ACCOUNT_PW;
	}
	public int getOPEN_BALANCE() {
		return OPEN_BALANCE;
	}
	public void setOPEN_BALANCE(int oPEN_BALANCE) {
		OPEN_BALANCE = oPEN_BALANCE;
	}
	public String getOPEN_CARD_NAME() {
		return OPEN_CARD_NAME;
	}
	public void setOPEN_CARD_NAME(String oPEN_CARD_NAME) {
		OPEN_CARD_NAME = oPEN_CARD_NAME;
	}
	public Date getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(Date rEGDATE) {
		REGDATE = rEGDATE;
	}

	@Override
	public String toString() {
		return "OpenBankingDTO [OPEN_ACCOUNT_NO=" + OPEN_ACCOUNT_NO
				+ ", member_id=" + member_id + ", OPEN_BANK=" + OPEN_BANK
				+ ", OPEN_ACCOUNT_PW=" + OPEN_ACCOUNT_PW + ", OPEN_BALANCE="
				+ OPEN_BALANCE + ", OPEN_CARD_NAME=" + OPEN_CARD_NAME
				+ ", REGDATE=" + REGDATE + "]";
	}

}