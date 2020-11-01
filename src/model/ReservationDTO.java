package model;

import java.io.Serializable;
import java.util.Date;

public class ReservationDTO implements Serializable {
	private String member_id; // 아이디
	private String open_account_no; // 오픈뱅킹 계좌번호
	private String my_account_num; // 내 계좌번호
	private String open_account_pw; // 예약 암호
	private int collecting_money; // 예약모으기 금액
	private String collecting_day; // 예약모으기가 실행 될 날짜
	private String reservation; // 예약 상태(정상,해지) -> 안 쓸듯
	private String start_date; // 등록일
	private String close_date; // 해지일
	private String last_run_date; // 마지막 예약 실행날짜
	private String summary; // 거래종류
	private String memo; // 메모

	public ReservationDTO() {
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
	public String getCollecting_day() {
		return collecting_day;
	}
	public void setCollecting_day(String collecting_day) {
		this.collecting_day = collecting_day;
	}
	public String getReservation() {
		return reservation;
	}
	public void setReservation(String reservation) {
		this.reservation = reservation;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getClose_date() {
		return close_date;
	}
	public void setClose_date(String close_date) {
		this.close_date = close_date;
	}
	public String getLast_run_date() {
		return last_run_date;
	}
	public void setLast_run_date(String last_run_date) {
		this.last_run_date = last_run_date;
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
		return "ReservationDTO [member_id=" + member_id + ", open_account_no="
				+ open_account_no + ", my_account_num=" + my_account_num
				+ ", open_account_pw=" + open_account_pw + ", collecting_money="
				+ collecting_money + ", collecting_day=" + collecting_day
				+ ", reservation=" + reservation + ", start_date=" + start_date
				+ ", close_date=" + close_date + ", last_run_date="
				+ last_run_date + ", summary=" + summary + ", memo=" + memo
				+ "]";
	}

}