package day0621;

public class ExWhile_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//while문으로 1부터 10까지 출력
		
		int n=0;
		
		while(n<10)
		{
			n++;
			System.out.printf("%4d",n);
		}
		System.out.println();
		
		//다른방법
		n=0;
		while(n<10)
		{
			System.out.printf("%4d",++n);
		}
		System.out.println();
		
		
		n=0;
		while(true)
		{
			System.out.printf("%4d",++n);
			
			//무한루프에 빠지므로 반드시 break문을 주어야 한다
			if(n==10)
				break;
		}
		System.out.println();
		
	}

}
