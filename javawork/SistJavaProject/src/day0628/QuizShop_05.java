package day0628;

class MyShop {
	
	private String sangpumName;
	private String ipgoday;
	private String chulgoday;
	
	//3개의 데이터를 한번에 수정할수있는 메서드
	public void setData(String name,String ipd,String chd) {
		sangpumName=name;
		ipgoday=ipd;
		chulgoday=chd;
	}
	
	//3개의 데이터를 한번에 출력할수있게 메서드
	/*public void getData() {
		System.out.println("상품명: "+sangpumName+"\n입고일: "+ipgoday+"\n출고일: "+chulgoday);
	}*/
	public String getData() {
		String s="상품명: "+sangpumName+"\n입고일: "+ipgoday+"\n출고일: "+chulgoday;
		
		return s;
	}
}

public class QuizShop_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		MyShop shop=new MyShop();
		shop.setData("키보드", "2023-06-01", "2023-06-20");
		//shop.getData();
		System.out.println(shop.getData());
		
		MyShop shop2=new MyShop();
		shop2.setData("모니터", "2023-06-04", "2023-06-23");
		//shop2.getData();
		System.out.println(shop2.getData());
	}

}
