package day0621;

import java.util.Scanner;

public class ScannerFor_11 {
	
	public static void numSum() {
		//합계를 구할숫자는? 100
		//1부터 100까지의 합은 5050입니다
		
		Scanner sc=new Scanner(System.in);
		int num; //입력할수
		int sum;
		
		System.out.print("합계를 구할숫자는? ");
		num=sc.nextInt();
		
		sum=0;
		for(int i=1;i<=num;i++)
			sum+=i;
		System.out.println("1부터 "+num+"까지의 합은 "+sum+"입니다");
	}
	
	public static void factorialTest() {
		//1!=1
		//2!=2
		//3!=6
		
		//10! 출력
		int result=1;
		int i;
		for(i=1;i<=10;i++)
			result*=i;
		System.out.println(i+"!="+result);
	}
	
	public static void quizFact() {
		//팩토리얼을 구할 숫자를 입력
		//5!=120
		Scanner sc=new Scanner(System.in);
		int num,result=1;
		
		System.out.print("팩토리얼을 구할 숫자를 입력 ");
		num=sc.nextInt();
		
		for(int i=1;i<=num;i++)
			result*=i;
		System.out.println(num+"!="+result);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//numSum();
		//factorialTest();
		quizFact();
	}

}