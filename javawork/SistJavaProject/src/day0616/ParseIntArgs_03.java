package day0616;

public class ParseIntArgs_03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*[결과출력]
		 * 내이름은 김영환
		 * 자바점수는 88
		 * 오라클점수는 77
		 * 두과목의 합계는 165점 입니다*/
		
		//변수선언
		String name=args[0];
		String num1=args[1];
		String num2=args[2];
		
		int su1=Integer.parseInt(num1);
		int su2=Integer.parseInt(num2);
		
		int java=Integer.parseInt(args[1]);
		int oracle=Integer.parseInt(args[2]);
		
		//출력
		System.out.println("[결과출력]");
		System.out.println("내이름은 "+args[0]);
		System.out.println("자바점수는 "+su1);
		System.out.println("오라클점수는 "+su2);
		System.out.println("두과목의 합계는"+(su1+su2)+"입니다");
		System.out.println(java+oracle);

	}

}
