package day0616;

public class QuizDataType_10 {

	public static void main(String[] args) {
		/* 매개변수(args)를 이용하여 출력해보세요
		 * [시험결과]
		 * Java=88,Jsp=77,Spring=99
		 * 총점: 264 점
		 * 평균: 88.00 점 */
		
		//변수선언&계산
		int j=Integer.parseInt(args[0]);
		int p=Integer.parseInt(args[1]);
		int s=Integer.parseInt(args[2]);
		int total=j+p+s;
		double mean=total/3; //결과가 무조건 int
		
		System.out.println("[시험결과]");
		System.out.printf("Java=%d,Jsp=%d,Spring=%d\n",j,p,s);
		System.out.printf("총점: %d 점\n",total);
		System.out.printf("평균: %.2f 점\n",mean);
		
		double avr=total/3.00;
				System.out.println(avr);

	}

}
