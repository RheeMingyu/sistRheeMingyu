package day0627;

public class Quiz_09 {

	//변수선언
	private static String place;
	//static String PLACE="이마트";
	private String mer;
	private int price;
	
	//set메서드
	public static void setPlace(String place) {
		Quiz_09.place=place;
	}
	public void setMer(String mer) {
		this.mer=mer;
	}
	public void setPrice(int price) {
		this.price=price;
	}
	
	//get메서드
	public static String getPlace() {
		return place;
	}
	public String getMer() {
		return mer;
	}
	public int getPrice() {
		return price;
	}
}
