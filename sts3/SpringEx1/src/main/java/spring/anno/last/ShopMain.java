package spring.anno.last;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopMain {

	public static void main(String[] args) {
		
		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext4.xml");
		
		OrderController oc=app.getBean("orderController", OrderController.class);
		
		oc.insertOrder("�ó���", 30000, "���");
		oc.deleteOrder("1");
		oc.selectOrder("�ó���", 20000, "�Ķ�");
	}

}
