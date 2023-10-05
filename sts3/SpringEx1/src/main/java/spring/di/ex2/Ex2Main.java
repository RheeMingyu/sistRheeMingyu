package spring.di.ex2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex2Main {

	public static void main(String[] args) {
		
		ApplicationContext context=new ClassPathXmlApplicationContext("appContext2.xml");
		
		//MyInfo생성후 확인
		MyInfo my=(MyInfo)context.getBean("my");
		
		System.out.println(my.toString());
		System.out.println(my);
		
		//Person
		Person per=context.getBean("person", Person.class);
		per.writeData();
	}

}
