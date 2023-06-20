package day0620;

import java.util.Scanner;

public class StringEqual_07 {

	public static void main(String[] args) {
		// 문자열 비교는 관계연산자를 이용하면 안되고
		//equals라는 메소드를 사용해서 비교한다
		
		Scanner sc=new Scanner(System.in);
		
		String word;
		
		System.out.println("영어단어를 입력하세요");
		System.out.println("입력예)happy,angel,rose,cat");
		word=sc.nextLine();
		
		System.out.println("입력한 문자열: "+word);
		
		if(word.equals("angel"))
			System.out.println("***천사***");
		else if(word.equalsIgnoreCase("happy"))
			System.out.println("***행복하다***");
		else if(word.equals("rose"))
			System.out.println("***장미***");
		else if(word.equals("cat"))
			System.out.println("***고양이***");
		else
			System.out.println("***한글단어가 등록되지 않았습니다***");

	}

}
