package spring.anno.ex6;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex6Main {

	public static void main(String[] args) {

		ApplicationContext context=new ClassPathXmlApplicationContext("annoContext4.xml");
		
		MysqlController t=(MysqlController)context.getBean("sql");
		t.myInsert("ȫ�ڻ�");
		t.myDelete("3");
		t.mySelect("�迵ȯ");
	}

}
