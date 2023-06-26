package day0626;

import java.util.Scanner;

public class ArrSearchCnt_01 {

	public static void main(String[] args) {
		/*Q.반복문안에서 실행...성을 입력시 그성씨를 가진사람과 총 인원수를 출력..
		 * 종료 라고 하면 프로그램 종료 */

		String [] names= {"김선호","나나","이효리","엄정화","김완선","보아","유재석","하하","김연진","이진"};
		
		Scanner sc=new Scanner(System.in);
		int cnt;
		String serch; //입력할 성
		boolean flag;
		
		while(true)
		{
			System.out.println("성을 입력하세요");
			serch=sc.nextLine();
			
			if(serch.equals("종료"))
			{
				System.out.println("프로그램 종료");
				break;
			}
			
			flag=false;
			cnt=0; //검색할때마다 0으로 초기화가 필요함
			
			for(int i=0;i<names.length;i++)
			{
				if(names[i].startsWith(serch))
				{	
					flag=true;
					cnt++;
					System.out.print(names[i]+" ");
				}
			}
			/*if(!flag)
				System.out.println("해당 성씨가 없습니다");
			if(cnt==0)
				continue;
			System.out.println("총 "+cnt+"명");*/
			
			if(flag) //flag==true
				System.out.println("총"+cnt+"명");
			else //!flag
				System.out.println(serch+"씨 성을 가진사람은 없습니다");
		}
	}

}
