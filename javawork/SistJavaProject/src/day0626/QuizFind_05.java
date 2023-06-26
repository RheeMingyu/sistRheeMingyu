package day0626;

import java.util.Scanner;

public class QuizFind_05 {

	public static void main(String[] args) {
		/* 숫자를 입력 받아서 배열의 몇번쨰에 있는지 출력하고 없을경우 없습니다 라고 출력하세요
		 * (0 이면 종료)
		 * 입력값: 11
		 *      11은 2번쨰에 있어요!
		 * 입력값: 100
		 *      100은 없습니다
		 * 입력값: 0
		 *      종료합니다(프로그램종료) */

		int [] arrNums= {12,4,53,23,14,65,32,2,34,1,9,8,47};
		int num;
		boolean flag;
		Scanner sc=new Scanner(System.in);
		
		while(true)
		{
			System.out.print("입력값: ");
			num=sc.nextInt();
			
			if(num==0)
			{
				System.out.println("종료합니다");
				break; //while문을 빠져나가면서 종료
			}
			
			flag=false; //반복문안에서 찾았을경우 true로 변경해줄것
			
			//배열개수만큼 반복해서 입력한 숫자 찾기
			for(int i=0;i<arrNums.length;i++)
			{
				if(num==arrNums[i])
				{	
					flag=true;
					System.out.println("\t"+num+"는 "+(i+1)+"번재에 있어요!");
				}	
			}
			if(!flag)
				System.out.println("\t"+num+"는 없습니다");
		}
	}

}
