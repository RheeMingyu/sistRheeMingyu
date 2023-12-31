package day0622;

import java.util.Scanner;

public class QuizForWhile_08 {

	public static void quiz1() {
		/*
		 나이를 반복해서 입력받는다
		 0이되면 빠져나와서 출력한다
		 나이가 50이상일경우 a변수 증가
		 나이가 30이상일경우 b변수 증가
		 그나머지는 c변수 증가
		 
		 ===============
		 50세이상: 3명
		 30세이상: 2명
		 그이외: 1명
		 */
		int age,a=0,b=0,c=0;
		Scanner sc=new Scanner(System.in);
		
		while(true)
		{
			System.out.println("나이 입력");
			age=sc.nextInt();
			
			if(age>=50)
				a++;
			else if(age>=30)
				b++;
			else
				c++;
			if(age==0)
				break;
		}
		System.out.println("=================");
		System.out.println("50세이상: "+a);
		System.out.println("30세이상: "+b);
		System.out.println("그이외: "+c);
		
	}
	
	public static void quiz2() {
		//Q.총 10개의 다양한 숫자(양수,음수)를 입력받아 양수의 갯수와 음수의 갯수를 구하시오
		/*
		 1 : 45
		 2: -23
		 
		 =========
		 양수갯수: 6
		 음수갯수: 3
		 */
		Scanner sc=new Scanner(System.in);
		int num,p=0,n=0;
		
		for(int x=1;x<=10;x++)
		{
			System.out.print(x+":");
			num=sc.nextInt();
			
			if(num<0)
				n++;
			else if(num>0)
				p++;
		}
		System.out.println("양수갯수: "+p);
		System.out.println("음수갯수: "+n);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//quiz1();
		quiz2();
	}

}
