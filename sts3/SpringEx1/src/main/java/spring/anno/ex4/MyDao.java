package spring.anno.ex4;

import org.springframework.stereotype.Component;

@Component //자동으로 빈에 등록(id는 클래스명,단 첫글자만 소문자 즉 myDao가 id가됨)
public class MyDao implements DaoInter {

	@Override
	public void insertData(String str) {
		// TODO Auto-generated method stub
		System.out.println(str+"_str데이터를 db에 추가완료");
	}

	@Override
	public void deleteData(String num) {
		// TODO Auto-generated method stub
		System.out.println(num+"_num에 해당하는 데이터 삭제완료");
	}

}
