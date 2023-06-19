package day0619;

import java.util.Calendar;
import java.util.Scanner;

public class ScannerMyAge_05 {

	public static void main(String[] args) {
		/* 당신의 이름은? 김민희
		 * 당신의 출생년도는? 1997년
		 * ============================
		 * 이름: 김민희
		 * 현재년도: 2023년
		 * 나이: 26세 */
		
		Scanner sc=new Scanner(System.in);
		Calendar cal=Calendar.getInstance();
		String name;
		int myear;
		
		System.out.print("당신의 이름은?");
		name=sc.nextLine();
		System.out.print("당신의 출생년도는?");
		myear=Integer.parseInt(sc.nextLine());
		
		int age=cal.get(cal.YEAR)-myear;
		
		System.out.println("이름: "+name);
		System.out.println("현재년도: "+cal.get(cal.YEAR));
		System.out.println("나이: "+age+"세");

	}

}
