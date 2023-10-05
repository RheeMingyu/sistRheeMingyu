package spring.anno.ex6;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("sql")
public class MysqlController {

	@Autowired
	TestDao tdao;
	
	public void myInsert(String name) {
		tdao.insert(name);
	}
	
	public void myDelete(String num) {
		tdao.delete(num);
	}
	
	public void mySelect(String name) {
		tdao.select(name);
	}
}
