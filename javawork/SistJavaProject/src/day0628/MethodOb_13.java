package day0628;

public class MethodOb_13 {

	public static void hello(int age,double height) {
		
		System.out.println("안녕");
		System.out.println("제나이는 "+age+"세 입니다");
		System.out.println("제키는 "+height+"cm입니다");
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("메서드 연습시작!!!");
		hello(33, 180.3);
		goodbye();
		System.out.println("메서드 연습끝!!!");
		hello(29, 170.2);
	}
	
	public static void goodbye() {
		System.out.println("담에 뵈요~~");
	}

}
