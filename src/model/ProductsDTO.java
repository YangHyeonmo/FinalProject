package model;

public class ProductsDTO {
	private int rnum;
	private int num;
	private int fin_no;
	private String fin_pro;
	private String fin_name;
	private int fin_date;
	private double fin_rate;
	private double fin_return;
	private String fin_type;
	private String fin_repay;
	private long fin_amount;
	private String fin_content;
	private int ref_no;
	private String member_id;
	private String account_num;
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getFin_no() {
		return fin_no;
	}
	public void setFin_no(int fin_no) {
		this.fin_no = fin_no;
	}
	public String getFin_pro() {
		return fin_pro;
	}
	public void setFin_pro(String fin_pro) {
		this.fin_pro = fin_pro;
	}
	public String getFin_name() {
		return fin_name;
	}
	public void setFin_name(String fin_name) {
		this.fin_name = fin_name;
	}
	public int getFin_date() {
		return fin_date;
	}
	public void setFin_date(int fin_date) {
		this.fin_date = fin_date;
	}
	public double getFin_rate() {
		return fin_rate;
	}
	public void setFin_rate(double fin_rate) {
		this.fin_rate = fin_rate;
	}
	public double getFin_return() {
		return fin_return;
	}
	public void setFin_return(double fin_return) {
		this.fin_return = fin_return;
	}
	public String getFin_type() {
		return fin_type;
	}
	public void setFin_type(String fin_type) {
		this.fin_type = fin_type;
	}
	public String getFin_repay() {
		return fin_repay;
	}
	public void setFin_repay(String fin_repay) {
		this.fin_repay = fin_repay;
	}
	public long getFin_amount() {
		return fin_amount;
	}
	public void setFin_amount(long fin_amount) {
		this.fin_amount = fin_amount;
	}
	public String getFin_content() {
		return fin_content;
	}
	public void setFin_content(String fin_content) {
		this.fin_content = fin_content;
	}
	public int getRef_no() {
		return ref_no;
	}
	public void setRef_no(int ref_no) {
		this.ref_no = ref_no;
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
	@Override
	public String toString() {
		return "newfinanceDTO [fin_no=" + fin_no + ", fin_pro=" + fin_pro + ", fin_name=" + fin_name + ", fin_date="
				+ fin_date + ", fin_rate=" + fin_rate + ", fin_return=" + fin_return + ", fin_type=" + fin_type
				+ ", fin_repay=" + fin_repay + ", fin_amount=" + fin_amount + ", fin_content=" + fin_content
				+ ", ref_no=" + ref_no + ", member_id=" + member_id + ", account_num=" + account_num + "]";
	}
	
	
}
