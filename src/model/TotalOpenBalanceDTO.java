package model;

public class TotalOpenBalanceDTO {
	private String member_id; // 아이디
	private int OPEN_BALANCE; // 오픈뱅킹 총 잔액

	public TotalOpenBalanceDTO() {
	}

	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getOPEN_BALANCE() {
		return OPEN_BALANCE;
	}
	public void setOPEN_BALANCE(int oPEN_BALANCE) {
		OPEN_BALANCE = oPEN_BALANCE;
	}

	@Override
	public String toString() {
		return "TotalOpenBalanceDTO [member_id=" + member_id + ", OPEN_BALANCE="
				+ OPEN_BALANCE + "]";
	}

}
