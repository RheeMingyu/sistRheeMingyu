package day0629;

import day0629_1.SuperObj;

public class SubObj_03 extends SuperObj{

	String addr;
	
	public SubObj_03(String name, int age,String addr) {
		super(name, age); //반드시 첫줄,부모생성자 호출
		this.addr=addr;
	}
	
	public void write() {
		System.out.println("이름: "+this.name);
		System.out.println("나이: "+this.age);
		System.out.println("주소: "+this.addr);
	}
	
}
