package member;

public class MemberDTO {
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_birthdate;
	private String member_gender;
	private String member_email;
	private String member_phonenumber;
	private String member_zipcode;
	private String member_address;
	private int member_author;
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_birthdate() {
		return member_birthdate;
	}
	public void setMember_birthdate(String member_birthdate) {
		this.member_birthdate = member_birthdate;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phonenumber() {
		return member_phonenumber;
	}
	public void setMember_phonenumber(String member_phonenumber) {
		this.member_phonenumber = member_phonenumber;
	}
	public String getMember_zipcode() {
		return member_zipcode;
	}
	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public int getMember_author() {
		return member_author;
	}
	public void setMember_author(int member_author) {
		this.member_author = member_author;
	}
	@Override
	public String toString() {
		return "MemberDTO [member_id=" + member_id + ", member_password=" + member_password + ", member_name="
				+ member_name + ", member_birthdate=" + member_birthdate + ", member_gender=" + member_gender
				+ ", member_email=" + member_email + ", member_phonenumber=" + member_phonenumber + ", member_zipcode="
				+ member_zipcode + ", member_address=" + member_address + ", member_author=" + member_author + "]";
	}
	
	
	
	
	
}
