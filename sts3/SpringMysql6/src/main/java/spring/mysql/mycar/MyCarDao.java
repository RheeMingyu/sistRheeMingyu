package spring.mysql.mycar;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao {

	@Autowired
	private SqlSession session;
	
	String namespace="spring.mysql.mycar.MyCarDao";
	
	public int getTotalCount() {
		return session.selectOne(namespace+".getTotalCount");
	}
	
	public void insertCar(MyCarDto dto) {
		session.insert("insertOfMyCar", dto);
	}
	
	public List<MyCarDto> getAllCars() {
		return session.selectList("getAllListMyCar");
	}
	
	public void deleteCar(String num) {
		session.delete("deleteOfMyCar", num);
	}
	
	public MyCarDto getDataCar(String num) {
		return session.selectOne("getMyCar", num);
	}
	
	public void updateCar(MyCarDto dto) {
		session.update("updateOfMyCar", dto);
	}
}
