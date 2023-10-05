package spring.di.ex2;

public class Person {

	String schoolName;
	MyInfo info;
	
	public Person(MyInfo info) {
		this.info=info;
	}

	//setter
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	
	//출력
	public void writeData() {
	
		System.out.println("**학생정보 출력**");
		System.out.println("학교명: "+schoolName);
		System.out.println("학생명: "+info.name);
		System.out.println("나이: "+info.age);
		System.out.println("주소: "+info.addr);
	}
	
}
