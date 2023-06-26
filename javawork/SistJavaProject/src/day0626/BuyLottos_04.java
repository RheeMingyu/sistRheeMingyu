package day0626;

import java.util.Scanner;

public class BuyLottos_04 {

	public static void main(String[] args) {
		//몇장구입할건지 입력하여 여러개 출력
		
		Scanner sc=new Scanner(System.in);
		int guip; //몇장,얼마
		int [] lotto=new int[6];
		
		System.out.println("로또 얼마 구입할지를 입력해주세요");
		guip=sc.nextInt();
		
		//예외조항
		if(guip<1000)
		{
			System.out.println("***구입금액이 부족합니다***");
			return; //메인함수 빠져나간다
		}
		
		for(int n=0;n<guip/1000;n++) {
			
			System.out.printf("%d회: ",n+1);
		
		for(int i=0;i<lotto.length;i++)
		{
			//1~45까지의 랜덤수 발생
			lotto[i]=(int)(Math.random()*45)+1;
			
			//중복처리
			for(int j=0;j<i;j++)
			{
				if(lotto[i]==lotto[j])
				{
					i--; //같은번지에 다시값을 구하기위해서
					break; //i++로 이동
				}
			}
		}
		
		//Arrays.sort(lotto);
		//오름차순정렬(기준:처음~끝에서2번째    비교:시작다음값~끝)
		for(int i=0;i<lotto.length-1;i++)
		{
			for(int j=i+1;j<lotto.length;j++)
			{
				if(lotto[i]>lotto[j])
				{
					int temp=lotto[i];
					lotto[i]=lotto[j];
					lotto[j]=temp;
				}
			}
		}
		
		//출력
		for(int i=0;i<lotto.length;i++)
		{
			System.out.printf("%5d",lotto[i]);
		}
		System.out.println();
		} //첫번쨰 for문 끝
	}

}
