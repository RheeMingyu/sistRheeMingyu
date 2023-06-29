package day0629;

class Starbucks {
	
	private String store; //지점
	private String menu; //메뉴
	private String goods; //텀블러등등...
	
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getGoods() {
		return goods;
	}
	public void setGoods(String goods) {
		this.goods = goods;
	}
}
//////////////////////////
public class ReviewObject_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Starbucks sb=new Starbucks();
		sb.setStore("코엑스");
		sb.setMenu("아이스 아메리카노");
		sb.setGoods("우산");
		
		System.out.println("나는 스타벅스 "+sb.getStore()
				+"매장에 왔습니다\n"+sb.getMenu()+"를 주문합니다\n"+sb.getGoods()+"를 샀어요");
	}

}
