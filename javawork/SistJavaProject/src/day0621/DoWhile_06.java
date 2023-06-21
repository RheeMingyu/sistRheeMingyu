package day0621;

public class DoWhile_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int i=1;
		
		System.out.println("while문 결과");
		//조건이 선조건..참일동안 반복
		
		while(i>5)
		{
			//출력후 증가
			System.out.println(i++);
			
			//System.out.println(i);
			//i++;
		}
		
		System.out.println("do~while문 결과");
		//후조건:조건 나중에 온다. 조건안맞아도 한번실행
		
		i=1;
		
		do {
			//출력후 증가
			System.out.println(i++);
		}while(i>5);
	}

}
