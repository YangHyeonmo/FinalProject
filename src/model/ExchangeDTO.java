package model;

import java.io.Serializable;
import java.util.Date;

//DTO(Data Transfer Object)는 VO(Value Object)로 바꿔 말할 수 있는데 
//계층간 데이터 교환을 위한 자바빈즈를 말합니다.
public class ExchangeDTO implements Serializable {
	private String member_id;
	private String exc_name;
	private String cur_unit;
	private long kor_money;
	private String exc_money;
	private String zipcode;
	private Date exc_date;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getExc_name() {
		return exc_name;
	}

	public void setExc_name(String exc_name) {
		this.exc_name = exc_name;
	}

	public String getCur_unit() {
		return cur_unit;
	}

	public void setCur_unit(String cur_unit) {
		this.cur_unit = cur_unit;
	}

	public long getKor_money() {
		return kor_money;
	}

	public void setKor_money(long kor_money) {
		this.kor_money = kor_money;
	}

	public String getExc_money() {
		return exc_money;
	}

	public void setExc_money(String exc_money) {
		this.exc_money = exc_money;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public Date getExc_date() {
		return exc_date;
	}

	public void setExc_date(Date exc_date) {
		this.exc_date = exc_date;
	}

	@Override
	public String toString() {
		return "ExchangeDTO [member_id=" + member_id + ", exc_name=" + exc_name + ", cur_unit=" + cur_unit
				+ ", kor_money=" + kor_money + ", exc_money=" + exc_money + ", zipcode=" + zipcode + ", exc_date="
				+ exc_date + "]";
	}

}