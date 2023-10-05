package spring.anno.last;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class OrderController {

	@Autowired
	ShopInter shop;
	
	int cnt=10;
	String name="홍박사";
	
	public void insertOrder(String sang,int price,String color) {
		shop.insertSangpum(sang, price, color);
		System.out.println(name+"님이 "+cnt+"개를 주문함");
	}
	
	public void deleteOrder(String num) {
		shop.deleteSangpum(num);
	}
	
	public void selectOrder(String sang,int price,String color) {
		System.out.println("주문자: "+name);
		shop.selectShop(sang, price, color);
		System.out.println("주문개수: "+cnt);
	}
}
