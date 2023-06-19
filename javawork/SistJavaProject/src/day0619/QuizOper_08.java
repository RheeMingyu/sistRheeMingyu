package day0619;

import java.util.Scanner;

public class QuizOper_08 {

	public static void main(String[] args) {
		// 월 급여를 입력해서 만원,천원,십원,일원 갯수를 출력해보자
		//예: 금액을 입력하시오
		/*
		 * 2,565,325
		 * 
		 * ==========
		 * 만원: 256
		 * 천원: 5
		 * 백원: 3
		 * 십원: 2
		 * 일원: 5
		 */

		Scanner sc=new Scanner(System.in);
		System.out.print("금액을 입력하시오");
		int pay=sc.nextInt();
		
		int man=pay/10000;
		int chun=pay%10000;
		int baek=pay%1000;
		int sib=pay%100;
		int il=pay%10;
		
		System.out.println("만원: "+man);
		System.out.println("천원: "+chun/1000);
		System.out.println("백원: "+baek/100);
		System.out.println("십원: "+sib/10);
		System.out.println("일원: "+il);
	}

}
