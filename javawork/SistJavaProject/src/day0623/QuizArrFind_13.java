package day0623;

import java.util.Scanner;

public class QuizArrFind_13 {

	public static void main(String[] args) {
		// 이름을 입력해서 없으면 없다고 있으면 몇번째 있는지 알려주세요

		String [] stuNames= {"이성신","이민규","박병주","최성현","김영준","강연주","최진평","고은비","송주영"};

		Scanner sc=new Scanner(System.in);
		boolean flag=false;
		String name;
		
		while(true)
		{
			System.out.println("이름 입력");
			name=sc.nextLine();
		
			if(name.equals("끝"))
			{	
				System.out.println("종료합니다");
				break;
			}
			for(int i=0;i<stuNames.length;i++)
			{	
				if(name.equals(stuNames[i]))
				{
					flag=true;
					System.out.println(name+"은 "+(i+1)+"번째에 있습니다");
				}
			}
			if(!flag)
				System.out.println("이름이 없습니다");
		}
	}

}
