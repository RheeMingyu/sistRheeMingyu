package spring.anno.last;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopMain {

	public static void main(String[] args) {
		
		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext4.xml");
		
		OrderController oc=app.getBean("orderController", OrderController.class);
		
		oc.insertOrder("½Ã³ª°ø", 30000, "³ë¶û");
		oc.deleteOrder("1");
		oc.selectOrder("½Ã³ª°ø", 20000, "ÆÄ¶û");
	}

}
