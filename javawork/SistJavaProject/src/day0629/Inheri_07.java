package day0629;

class Person {
	String name;
	String buseo;
	
	public void getPerson() {
		System.out.println("**부모변수출력**");
		System.out.println("이름: "+this.name);
		System.out.println("부서: "+this.buseo);
	}
}
////////////////////
class My extends Person{
	int age;
	
	public My(String name,String buseo,int age) {
		this.name=name;
		this.buseo=buseo;
		this.age=age;
	}
	
	public void write() {
		System.out.println("사원명: "+this.name);
		System.out.println("부서: "+this.buseo);
		System.out.println("나이: "+this.age);
	}
	
	@Override
	public void getPerson() {
		// TODO Auto-generated method stub
		super.getPerson();
		System.out.println("나이: "+this.age);
	}
}
////////////////////
public class Inheri_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		My my1=new My("이민규", "교육부", 29);
		my1.write();
		
		my1.getPerson();
	}

}
