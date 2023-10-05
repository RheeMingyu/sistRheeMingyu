package spring.anno.ex5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex5Main {

	public static void main(String[] args) {
		
		ApplicationContext context=new ClassPathXmlApplicationContext("annoContext4.xml");
		
		Fruit fruit=(KoreanFruit)context.getBean("kfruit");
		fruit.writeFruitName();
		
		MyFruit myfruit=context.getBean("myFruit", MyFruit.class);
		myfruit.writeFruit();
	}

}
