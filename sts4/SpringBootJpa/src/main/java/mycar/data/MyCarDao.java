package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao {

	@Autowired
	MyCarDaoInter carInter;
	
	//insert
	public void insertMyCar(MyCarDto dto) {
		carInter.save(dto); //id타입의 유무에 따라 자동으로 insert or update
	}
	
	//전체출력
	public List<MyCarDto> getAllData() {
		//return carInter.findAll();
		return carInter.findAll(Sort.by(Sort.Direction.DESC, "carprice")); //가격이 높은순
	}
	
	public MyCarDto getData(long num) {
		return carInter.getReferenceById(num);
	}
	
	public void updateMyCar(MyCarDto dto) {
		carInter.save(dto);
	}
	
	public void deleteMyCar(long num) {
		carInter.deleteById(num);
	}
}
