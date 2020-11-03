package model;

public class StockDTO {

	private String excode; // 종목코드
	private String exname; // 종목명.

	public StockDTO() {
	}

	public String getExcode() {
		return excode;
	}
	public void setExcode(String excode) {
		this.excode = excode;
	}
	public String getExname() {
		return exname;
	}
	public void setExname(String exname) {
		this.exname = exname;
	}

	@Override
	public String toString() {
		return " [ 종목코드 ( excode )  = " + excode + " ,   종목명 ( exname ) = "
				+ exname + " ] ";
	}

}