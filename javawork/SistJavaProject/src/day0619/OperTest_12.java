package day0619;

import java.util.Calendar;
import java.util.Scanner;

public class OperTest_12 {

	public static void main(String[] args) {
		// 삼항연산자 조건 12 .. 태어난 연도로 띠 구하기
		// 로직에서는 언제ㅏ 원숭이띠
		
		Scanner sc = new Scanner(System.in);
		Calendar cal = Calendar.getInstance();
		int myYear,age;
		String name,ddi;
		
		System.out.print("이름입력: ");
		name=sc.nextLine();
		
		System.out.println("태어난 연도 입력: ");
		myYear=sc.nextInt();
		
		age = cal.get(cal.YEAR)-myYear+1;
		
		//로직에서 사용순서는 원숭이부터
		ddi = myYear%12==0 ? "원숭이띠" : 
			myYear%12==1 ? "닭띠" : 
				myYear%12==2 ? "개띠" :
					myYear%12==3 ? "돼지띠" :
						myYear%12==4 ? "쥐띠" :
							myYear%12==5 ? "소띠" :
								myYear%12==6 ? "호랑이띠" :
									myYear%12==7 ? "토끼띠" :
										myYear%12==8 ? "용띠" :
											myYear%12==9 ? "뱀띠" :
												myYear%12==10 ? "말띠" : "양띠";
		System.out.println("[나이와 띠 구하기]");
		System.out.println("이름 : "+name);
		System.out.println("나이 : "+age);
		System.out.println("띠 : "+ddi);
		
		
		

	}

}
