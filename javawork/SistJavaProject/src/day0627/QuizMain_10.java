package day0627;

public class QuizMain_10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("**상품입고**");
		System.out.println("---------------------");
		
		Quiz_10.SHOPNAME="롯데마트";
		System.out.println("입고된 상점: "+Quiz_10.SHOPNAME);
		System.out.println("---------------------");
		
		Quiz_10 smn1=new Quiz_10();
		smn1.setSangpum("딸기");
		/*smn1.setDan(10000);
		smn1.setSu(5);*/
		smn1.dan=10000;
		smn1.su=5;
		
		Quiz_10 smn2=new Quiz_10();
		smn2.setSangpum("쵸코파이");
		/*smn2.setDan(5000);
		smn2.setSu(10);*/
		smn2.dan=5000;
		smn2.su=10;
		
		Quiz_10 smn3=new Quiz_10();
		smn3.setSangpum("요거트");
		/*smn3.setDan(2500);
		smn3.setSu(100);*/
		smn3.dan=2500;
		smn3.su=100;
				
		/*System.out.println("상품명: "+mer1+"\n가격: "+smn1.getDan()+"\n수량: "+smn1.getSu()+"\n");
		System.out.println("상품명: "+mer2+"\n가격: "+smn1.getDan()+"\n수량: "+smn2.getSu()+"\n");
		System.out.println("상품명: "+mer3+"\n가격: "+smn1.getDan()+"\n수량: "+smn3.getSu()+"\n");*/
		
		System.out.println("상품명: "+smn1.getSangpum()+"\n가격: "+smn1.dan+"\n수량: "+smn1.su+"\n");
		System.out.println("상품명: "+smn2.getSangpum()+"\n가격: "+smn2.dan+"\n수량: "+smn2.su+"\n");
		System.out.println("상품명: "+smn3.getSangpum()+"\n가격: "+smn3.dan+"\n수량: "+smn3.su+"\n");
	}

}
