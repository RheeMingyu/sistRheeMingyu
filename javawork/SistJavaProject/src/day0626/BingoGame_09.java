package day0626;

import java.util.Scanner;

public class BingoGame_09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner sc=new Scanner(System.in);
		
		//3행3열 배열 생성
		int [][] pz=new int[3][3];
		
		int bingo=0;
		
		while(true)
		{
			System.out.println("***같은숫자나오면 빙고!!!***");
			
			//3행3열안에 1~3까지의 난수발생
			for(int i=0;i<pz.length;i++)//행
			{
				for(int j=0;j<pz[i].length;j++)//열
				{
					pz[i][j]=(int)(Math.random()*3)+1;
				}
			}
			
			//출력
			for(int i=0;i<pz.length;i++)//행
			{
				for(int j=0;j<pz[i].length;j++)//열
				{
					System.out.printf("%4d",pz[i][j]);
				}
				System.out.println();
			}
			
			//빙고갯수
			
			bingo=0;
			//가로방향 3개 세로방향 3개
			for(int i=0;i<pz.length;i++)
			{
				//가로방향비교
				if(pz[i][0]==pz[i][1]&&pz[i][1]==pz[i][2])
					bingo++;
				
				//세로방향비교
				if(pz[0][i]==pz[1][i]&&pz[1][i]==pz[2][i])
					bingo++;
			}
			//대각선 \방향
			if(pz[0][0]==pz[1][1]&&pz[1][1]==pz[2][2])
				bingo++;
			
			//대각선 /방향
			if(pz[2][0]==pz[1][1]&&pz[1][1]==pz[0][2])
				bingo++;
			
			//빙고출력
			if(bingo==0)
				System.out.println("\t꽝!!!");
			else
				System.out.println("\t빙고 "+bingo+"개");
			
			//게임종료
			System.out.println("엔터를 누르면 다음난수가 나옵니다(q: 종료)");
			String ans=sc.nextLine();
			
			if(ans.equalsIgnoreCase("q"))
			{
				System.out.println("게임을 종료합니다");
				break;				
			}
		}
	}

}
