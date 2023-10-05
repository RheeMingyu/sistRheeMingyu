package spring.anno.ex6;

import org.springframework.stereotype.Component;

@Component
public class TestDao {

	public void insert(String irum) {
		System.out.println(irum+"님 db에 추가됨");
	}
	
	public void delete(String no) {
		System.out.println(no+"번 데이터 삭제됨");
	}
	
	public void select(String irum) {
		System.out.println(irum+"님은 남아공에 사는 100kg 괴물임");
	}
}
