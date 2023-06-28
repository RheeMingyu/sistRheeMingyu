package day0628;

class Score {
	
	private String stuName;
	private int java;
	private int oracle;
	private int html;
	
	static final String TITLE="중간고사 시험결과";

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public int getJava() {
		return java;
	}

	public void setJava(int java) {
		this.java = java;
	}

	public int getOracle() {
		return oracle;
	}

	public void setOracle(int oracle) {
		this.oracle = oracle;
	}

	public int getHtml() {
		return html;
	}

	public void setHtml(int html) {
		this.html = html;
	}
	
	//합계메서드
	public int getTot() {
		int t=java+oracle+html;
		return t;
	}
	
	//평균메서드
	public double getAvg() {
		//return getTot()/3.0;
		
		double a=getTot()/3.0;
		return a;
	}
}
/////////////////////////
public class ExObject_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println(Score.TITLE+"\n");
		
		Score s1=new Score();
		s1.setStuName("김지윤");
		s1.setJava(99);
		s1.setOracle(88);
		s1.setHtml(56);
		
		Score s2=new Score();
		s2.setStuName("김동현");
		s2.setJava(79);
		s2.setOracle(68);
		s2.setHtml(76);
		
		String name1=s1.getStuName();
		int java1=s1.getJava();
		int oracle1=s1.getOracle();
		int html1=s1.getHtml();
		
		String name2=s2.getStuName();
		int java2=s2.getJava();
		int oracle2=s2.getOracle();
		int html2=s2.getHtml();
				
		System.out.println("학생명: "+name1+"\n자바점수: "+java1+"\n오라클점수: "+oracle1+"\nHTML점수: "+html1);
		System.out.println("합계점수: "+s1.getTot()+"\n평균점수: "+s1.getAvg());
		System.out.println();
		System.out.println("학생명: "+name2+"\n자바점수: "+java2+"\n오라클점수: "+oracle2+"\nHTML점수: "+html2);
		System.out.println("합계점수: "+s2.getTot()+"\n평균점수: "+s2.getAvg());
	}

}
