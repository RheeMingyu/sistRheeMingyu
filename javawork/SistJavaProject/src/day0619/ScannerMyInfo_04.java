package day0619;

import java.util.Scanner;

public class ScannerMyInfo_04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*Scanner이용할것!!!
		 * 이름을 입력하세요: 홍길동
		 * 핸드폰번호: 010-1234-5678
		 * 주소: 서울시 강남구
		 * =========================
		 * [개인정보]
		 * 이름: 홍길동
		 * 연락처: 010-1234-5678
		 * 주소: 서울시 강남구 */
		
		Scanner sc=new Scanner(System.in);
		
		String name,pnum,adr;
		
		
		System.out.print("이름을 입력하세요: ");
		name=sc.nextLine();
		System.out.print("핸드폰번호: ");
		pnum=sc.nextLine();
		System.out.print("주소: ");
		adr=sc.nextLine();
		
		System.out.println("===============================");
		System.out.println("\t[개인정보]");
		System.out.println("\t이름: "+name);
		System.out.println("\t연락처 "+pnum);
		System.out.println("\t주소: "+adr);

	}

}
