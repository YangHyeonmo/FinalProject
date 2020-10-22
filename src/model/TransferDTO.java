package model;

import java.util.Date;

public class TransferDTO {

	private int num;
	private int transfer_no;		//이체 번호
	private String member_id;			//회원 아이디
	private String account_no;		//통장 번호
	private String transfer_to_member_id;	//이체할 회원 아이디
	private String transfer_to_account_no;	//이체할 회원 통장 번호
	private int transfer_price;	//이체할 금액
	private String transfer_alias;	//받는 사람 표시
	private String transfer_day;	//보내는 날짜
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setTransfer_to_member_id(String transfer_to_member_id) {
		this.transfer_to_member_id = transfer_to_member_id;
	}
	//================자동이체(무시하셔도 됩니다!)====================
	private String transfer_auto_period;
	private String transfer_auto_period_start;
	private String transfer_auto_period_end;
	
	//====================예약이체(무시하셔도 됩니다!)================
	private String transfer_res_day;
	private String transfer_res_state;
	public int getTransfer_no() {
		return transfer_no;
	}
	public void setTransfer_no(int transfer_no) {
		this.transfer_no = transfer_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getAccount_no() {
		return account_no;
	}
	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}
	public String getTransfer_to_member_id() {
		return transfer_to_member_id;
	}
	public String getTransfer_to_account_no() {
		return transfer_to_account_no;
	}
	public void setTransfer_to_account_no(String transfer_to_account_no) {
		this.transfer_to_account_no = transfer_to_account_no;
	}
	public int getTransfer_price() {
		return transfer_price;
	}
	public void setTransfer_price(int transfer_price) {
		this.transfer_price = transfer_price;
	}
	public String getTransfer_alias() {
		return transfer_alias;
	}
	public void setTransfer_alias(String transfer_alias) {
		this.transfer_alias = transfer_alias;
	}
	public String getTransfer_day() {
		return transfer_day;
	}
	public void setTransfer_day(String transfer_day) {
		this.transfer_day = transfer_day;
	}
	public String getTransfer_auto_period() {
		return transfer_auto_period;
	}
	public void setTransfer_auto_period(String transfer_auto_period) {
		this.transfer_auto_period = transfer_auto_period;
	}
	public String getTransfer_auto_period_start() {
		return transfer_auto_period_start;
	}
	public void setTransfer_auto_period_start(String transfer_auto_period_start) {
		this.transfer_auto_period_start = transfer_auto_period_start;
	}
	public String getTransfer_auto_period_end() {
		return transfer_auto_period_end;
	}
	public void setTransfer_auto_period_end(String transfer_auto_period_end) {
		this.transfer_auto_period_end = transfer_auto_period_end;
	}
	public String getTransfer_res_day() {
		return transfer_res_day;
	}
	public void setTransfer_res_day(String transfer_res_day) {
		this.transfer_res_day = transfer_res_day;
	}
	public String getTransfer_res_state() {
		return transfer_res_state;
	}
	public void setTransfer_res_state(String transfer_res_state) {
		this.transfer_res_state = transfer_res_state;
	}
	
}
