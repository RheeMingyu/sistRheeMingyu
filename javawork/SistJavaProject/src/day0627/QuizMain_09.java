package day0627;

public class QuizMain_09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Quiz_09.setPlace("이마트");
		
		Quiz_09 smn1=new Quiz_09();
		smn1.setMer("손선풍기");
		smn1.setPrice(25000);
		
		Quiz_09 smn2=new Quiz_09();
		smn2.setMer("핸드폰충전기");
		smn2.setPrice(30000);
		
		Quiz_09 smn3=new Quiz_09();
		smn3.setMer("이어폰");
		smn3.setPrice(70000);
		
		//String place=smn1.getPlace();
		String place=Quiz_09.getPlace();
		
		String mer1=smn1.getMer();
		int price1=smn1.getPrice();
		
		String mer2=smn2.getMer();
		int price2=smn2.getPrice();
		
		String mer3=smn2.getMer();
		int price3=smn3.getPrice();
		
		System.out.println("[쇼핑목록]\n");
		System.out.println("쇼핑장소: "+place+"\n");
		System.out.println("목록1\n상품명: "+mer1+"\n가격: "+price1+"\n");
		System.out.println("목록2\n상품명: "+mer2+"\n가격: "+price2+"\n");
		System.out.println("목록3\n상품명: "+mer3+"\n가격: "+price3+"\n");
	}

}
