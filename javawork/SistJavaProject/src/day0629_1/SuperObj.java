package day0629_1;
/* 부모클래스가 다른패키지에 있을경우 protected,public 변수는 접근이 가능하다
 * 같은패키지인경우에는 private만 빼고 모두 접근 가능 */
public class SuperObj {

	protected String name;
	protected int age;
	
	public SuperObj(String name,int age) {
		this.name=name;
		this.age=age;
	}
}
