package day0627;

public class MemoryCnt_04 {

	static int count=0;
	int cnt=0;
	
	//생성자
	public MemoryCnt_04() {
		count++;
		cnt++;
		System.out.println("count="+count);
		System.out.println("cnt="+cnt);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		MemoryCnt_04 mem1=new MemoryCnt_04();
		MemoryCnt_04 mem2=new MemoryCnt_04();
	}

}
