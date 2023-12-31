package day0622;

import java.util.Scanner;

public class QuizForWhile_02 {

	public static void quiz1() {
		//점수를 입력하면 합계를 구하시오
		//1~100 이아니면 제외(continue)
		//0을 입력시 프로그램 종료(break)
		Scanner sc=new Scanner(System.in);
		int scr,sum=0;
				
		while(true)
		{
			System.out.print("점수입력(0 종료)");
			scr=sc.nextInt();
			
			//break문
			if(scr==0) //0이면 빠져나감
				break;
			//점수잘못쓰면 끝나는게 아니고 다시 반복 쓸수있게
			if(scr<1||scr>100)
				continue;
			//합계
			sum+=scr; //sum=sum+scr
		}
		System.out.print("합계: "+sum);
	}
	public static void quiz2() {
		//점수를 반복해서 입력하면 합계,평균을 구하시오
		//끝이라고 입력시 프로그램 종료
		Scanner sc=new Scanner(System.in);
		String scr;
		int cnt=0,sum=0;
		double avg=0;
		
		while(true)
		{
			System.out.println("점수입력(끝 종료)");
			scr=sc.nextLine();
			
			if(scr.equals("끝"))
				break;
			if(Integer.parseInt(scr)<1||Integer.parseInt(scr)>100)
				continue;	
			sum+=Integer.parseInt(scr);
			cnt++;
			avg=sum/cnt;
		}
		System.out.println("합계: "+sum);
		System.out.println("평균: "+avg);
	}
	public static void quiz3() {
		/*
		 총 5개의 점수를 입력받아 합계를 구하시오
		 만약 1~100 이 아닐경우 다시 입력받아라
		 
		 1번점수: 88
		 2번점수: 99
		 3번점수: 200
		    잘못입력했어요
		 3번점수: 33
		 
		 =====
		 합계: **점
		 */
		Scanner sc=new Scanner(System.in);
		int i=1,scr=0,sum=0;
		
		for(;i<=5;i++)
		{
			System.out.print(i+"번 점수: ");
			scr=sc.nextInt();
			
			if(scr<1||scr>100)
			{
				System.out.println("\t잘못입력했어요");
				i--;
				continue;
			}
			sum+=scr;
		}
		System.out.println("합계: "+sum+"점");
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//quiz1();
		//quiz2();
		quiz3();
	}

}
