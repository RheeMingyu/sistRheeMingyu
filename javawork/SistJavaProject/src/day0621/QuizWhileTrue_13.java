package day0621;

import java.util.Scanner;

public class QuizWhileTrue_13 {

	public static void main(String[] args) {
		/*
		 점수를 반복해서 입력하다가 q나 Q를 입력하면
		 while문을 빠져나온뒤 총갯수,총점,평균을 출력하시오
		 평균은 소수점 1자리
		 */
		Scanner sc=new Scanner(System.in);
		String scr;
		int cnt=0,sum=0;
		double avg=0;
		
		while(true)
		{
			System.out.println("점수(q or Q 종료)");
			scr=sc.nextLine();
			
			//종료
			//if(scr.equals("q")||scr.equals("Q"))
			//if(scr.equalsIgnoreCase("q"))
			if(scr.charAt(0)=='q'||scr.charAt(0)=='Q')
				break;
			
			sum+=Integer.parseInt(scr); //정수로 변환후 합계변수에 누적
			cnt++;
			avg=sum/cnt; //둘다정수이므로 double로 형변환가능
		}
		System.out.println("총갯수: "+cnt);
		System.out.println("총점: "+sum);
		System.out.printf("평균: %.2f",avg);
	}

}
