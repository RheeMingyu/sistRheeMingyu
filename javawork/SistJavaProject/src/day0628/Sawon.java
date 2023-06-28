package day0628;
/*
 이름		급여		가족수	초과시간	:입력
 
 이름		급여		가족수	초과시간	 가족수당	시간수당	총급여 :출력
 */
public class Sawon {

	private String sawonName;
	private int pay;
	private int famSu;
	private int timeSu;
	
	public String getSawonName() {
		return sawonName;
	}
	public void setSawonName(String sawonName) {
		this.sawonName = sawonName;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getFamSu() {
		return famSu;
	}
	public void setFamSu(int famSu) {
		this.famSu = famSu;
	}
	public int getTimeSu() {
		return timeSu;
	}
	public void setTimeSu(int timeSu) {
		this.timeSu = timeSu;
	}
	
	//가족수당 ..가족당 5만원(4명이 넘더라도 최대 20만원)
	public int getFamilySudang() {
		int n=0;
		
		if(famSu>=4)
			n=200000;
		else
			n=famSu*50000;
		
		return n;
	}
	
	//시간외수당..시간당 3만원(10시간이상이더라도 30만원)
	public int getTimeSudang() {
		int n=0;
		
		if(timeSu>=10)
			n=300000;
		else
			n=timeSu*30000;
		
		return n;
	}
	
	//총급여
	public int getTotalPay() {
		int s=pay+getFamilySudang()+getTimeSudang();
		
		return s;
	}
	
	//제목
	public static void getTitle() {
		System.out.println("**우리회사 직원 급여현황**");
		System.out.println();
		System.out.println("사원명\t급여\t가족수\t초과시간\t가족수당\t시간외수당\t총급여");
		System.out.println("------------------------");
	}
}
