package model;

import java.io.Serializable;
import java.util.Date;

public class InstantDTO implements Serializable {
	private String MEMBER_ID; // 아이디
	private String OPEN_ACCOUNT_NO; // 오픈뱅킹 계좌번호
	private String MY_ACCOUNT_NUM; // 내 계좌번호
	private String OPEN_ACCOUNT_PW;
	private String OPEN_CARD_NAME; // 오픈뱅킹 카드명
	private int COLLECTING_MONEY; // 모으기 금액
	private Date COLLECTING_DAY; // 모으기 날짜
	private String SUMMARY; // 거래종류
	private String MEMO; // 메모

	public InstantDTO() { // 디폴트 생성자
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public String getOPEN_ACCOUNT_NO() {
		return OPEN_ACCOUNT_NO;
	}

	public void setOPEN_ACCOUNT_NO(String oPEN_ACCOUNT_NO) {
		OPEN_ACCOUNT_NO = oPEN_ACCOUNT_NO;
	}

	public String getMY_ACCOUNT_NUM() {
		return MY_ACCOUNT_NUM;
	}

	public void setMY_ACCOUNT_NUM(String mY_ACCOUNT_NUM) {
		MY_ACCOUNT_NUM = mY_ACCOUNT_NUM;
	}

	public String getOPEN_ACCOUNT_PW() {
		return OPEN_ACCOUNT_PW;
	}

	public void setOPEN_ACCOUNT_PW(String oPEN_ACCOUNT_PW) {
		OPEN_ACCOUNT_PW = oPEN_ACCOUNT_PW;
	}

	public String getOPEN_CARD_NAME() {
		return OPEN_CARD_NAME;
	}

	public void setOPEN_CARD_NAME(String oPEN_CARD_NAME) {
		OPEN_CARD_NAME = oPEN_CARD_NAME;
	}

	public int getCOLLECTING_MONEY() {
		return COLLECTING_MONEY;
	}

	public void setCOLLECTING_MONEY(int cOLLECTING_MONEY) {
		COLLECTING_MONEY = cOLLECTING_MONEY;
	}

	public Date getCOLLECTING_DAY() {
		return COLLECTING_DAY;
	}

	public void setCOLLECTING_DAY(Date cOLLECTING_DAY) {
		COLLECTING_DAY = cOLLECTING_DAY;
	}

	public String getSUMMARY() {
		return SUMMARY;
	}

	public void setSUMMARY(String sUMMARY) {
		SUMMARY = sUMMARY;
	}

	public String getMEMO() {
		return MEMO;
	}

	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}

	@Override
	public String toString() {
		return "InstantDTO [MEMBER_ID=" + MEMBER_ID + ", OPEN_ACCOUNT_NO="
				+ OPEN_ACCOUNT_NO + ", MY_ACCOUNT_NUM=" + MY_ACCOUNT_NUM
				+ ", OPEN_ACCOUNT_PW=" + OPEN_ACCOUNT_PW + ", OPEN_CARD_NAME="
				+ OPEN_CARD_NAME + ", COLLECTING_MONEY=" + COLLECTING_MONEY
				+ ", COLLECTING_DAY=" + COLLECTING_DAY + ", SUMMARY=" + SUMMARY
				+ ", MEMO=" + MEMO + "]";
	}



	

}
