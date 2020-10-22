package model;

import java.io.Serializable;
import java.util.Date;

public class ReservationDTO implements Serializable {
	private String MEMBER_ID; // 아이디
	private String OPEN_ACCOUNT_NO; // 오픈뱅킹 계좌번호
	private String MY_ACCOUNT_NUM; // 내 계좌번호
	private String OPEN_CARD_NAME; // 오픈뱅킹 카드명
	private int COLLECTING_MONEY; // 예약 모으기 금액
	private String COLLECTING_DAY; // 예약 모으기 날짜
	private String RESERVATION; // 예약 상태(정상,해지)
	private String START_DATE; // 자동이체 시작일
	private String CLOSE_DATE; // 자동이체 해지일
	private String LAST_RUN_DATE; // 마지막 자동이체일
	private String SUMMARY; // 거래종류
	private String MEMO; // 메모
	
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
	public String getCOLLECTING_DAY() {
		return COLLECTING_DAY;
	}
	public void setCOLLECTING_DAY(String cOLLECTING_DAY) {
		COLLECTING_DAY = cOLLECTING_DAY;
	}
	public String getRESERVATION() {
		return RESERVATION;
	}
	public void setRESERVATION(String rESERVATION) {
		RESERVATION = rESERVATION;
	}
	public String getSTART_DATE() {
		return START_DATE;
	}
	public void setSTART_DATE(String sTART_DATE) {
		START_DATE = sTART_DATE;
	}
	public String getCLOSE_DATE() {
		return CLOSE_DATE;
	}
	public void setCLOSE_DATE(String cLOSE_DATE) {
		CLOSE_DATE = cLOSE_DATE;
	}
	public String getLAST_RUN_DATE() {
		return LAST_RUN_DATE;
	}
	public void setLAST_RUN_DATE(String lAST_RUN_DATE) {
		LAST_RUN_DATE = lAST_RUN_DATE;
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
		return "ReservationDTO [MEMBER_ID=" + MEMBER_ID + ", OPEN_ACCOUNT_NO="
				+ OPEN_ACCOUNT_NO + ", MY_ACCOUNT_NUM=" + MY_ACCOUNT_NUM
				+ ", OPEN_CARD_NAME=" + OPEN_CARD_NAME + ", COLLECTING_MONEY="
				+ COLLECTING_MONEY + ", COLLECTING_DAY=" + COLLECTING_DAY
				+ ", RESERVATION=" + RESERVATION + ", START_DATE=" + START_DATE
				+ ", CLOSE_DATE=" + CLOSE_DATE + ", LAST_RUN_DATE="
				+ LAST_RUN_DATE + ", SUMMARY=" + SUMMARY + ", MEMO=" + MEMO
				+ "]";
	}

}
