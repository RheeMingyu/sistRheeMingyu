package spring.di.ex3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SawonName {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext context=new ClassPathXmlApplicationContext("appContext3.xml");
		
		Sawon sawon=context.getBean("s", Sawon.class);
		sawon.writeData();
	}

}
