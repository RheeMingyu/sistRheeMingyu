package spring.anno.ex4;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("logic") //id가 logic이 된다
public class LogicController {

	@Autowired
	//정확한 빈의 아이디로 주입_모호성이 있는경우에는 @Resource(name="정확한이름")
	DaoInter daoInter;
	
	public LogicController(MyDao dao) {
		this.daoInter=dao;
	}
	
	//insert
	public void insert(String str) {
		daoInter.insertData(str);
	}
	
	//delete
	public void delete(String num) {
		daoInter.deleteData(num);
	}
}
