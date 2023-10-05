package spring.di.ex3;

public class SawonData {

	private String sawonName;
	private int pay;
	private String enterday;
	
	public SawonData() {

	}
	
	//사원명은 생성자 주입
	public SawonData(String name) {
		sawonName=name;
	}
	
	//급여,입사일 setter주입
	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getEnterday() {
		return enterday;
	}

	public void setEnterday(String enterday) {
		this.enterday = enterday;
	}

	public String getSawonName() {
		return sawonName;
	}

	public void setSawonName(String sawonName) {
		this.sawonName = sawonName;
	}
	
}
