package day0623;

import java.util.Scanner;

public class ArrScannerSum_09 {

	public static void main(String[] args) {
		/*
		 0번지 값: 55
		 1번지 값: 77
		 2번지 값: 88
		 3번지 값: 49
		 4번지 값: 29
		 
		 ===========
		 1번째값: 55
		 ...
		 5번째값: 29
		 
		 ===========
		 총합계: 
		 */
		int [] data;
		data=new int[5];
		
		int sum=0;
		Scanner sc=new Scanner(System.in);
		
		//값입력
		for(int i=0;i<data.length;i++)
		{
			System.out.print(i+"번지 값: ");
			data[i]=sc.nextInt();
			sum+=data[i];
		}

		//값출력
		System.out.println("=============");
		System.out.println("\t[입력값 확인]");
		
		for(int i=0;i<data.length;i++)
			System.out.println((i+1)+"번째 값: "+data[i]);
		System.out.println("총합계: "+sum);
		
	}

}
