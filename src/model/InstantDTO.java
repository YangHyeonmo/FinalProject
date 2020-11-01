package model;

import java.io.Serializable;
import java.util.Date;

public class InstantDTO implements Serializable {
	private String member_id; // 아이디
	private String open_account_no; // 오픈뱅킹 계좌번호 -> 아직 안 쓰임
	private String my_account_num; // 내 계좌번호
	private String open_account_pw; // 계좌 비밀번호 -> 아직 안 쓰임
	private int collecting_money; // 모으기 금액
	private Date collecting_day; // 모으기 날짜
	private String summary; // 거래종류
	private String memo; // 메모

	public InstantDTO() {
		super();

	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getOpen_account_no() {
		return open_account_no;
	}
	public void setOpen_account_no(String open_account_no) {
		this.open_account_no = open_account_no;
	}
	public String getMy_account_num() {
		return my_account_num;
	}
	public void setMy_account_num(String my_account_num) {
		this.my_account_num = my_account_num;
	}
	public String getOpen_account_pw() {
		return open_account_pw;
	}
	public void setOpen_account_pw(String open_account_pw) {
		this.open_account_pw = open_account_pw;
	}
	public int getCollecting_money() {
		return collecting_money;
	}
	public void setCollecting_money(int collecting_money) {
		this.collecting_money = collecting_money;
	}
	public Date getCollecting_day() {
		return collecting_day;
	}
	public void setCollecting_day(Date collecting_day) {
		this.collecting_day = collecting_day;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	@Override
	public String toString() {
		return "InstantDTO [member_id=" + member_id + ", open_account_no="
				+ open_account_no + ", my_account_num=" + my_account_num
				+ ", open_account_pw=" + open_account_pw + ", collecting_money="
				+ collecting_money + ", collecting_day=" + collecting_day
				+ ", summary=" + summary + ", memo=" + memo + "]";
	}

}