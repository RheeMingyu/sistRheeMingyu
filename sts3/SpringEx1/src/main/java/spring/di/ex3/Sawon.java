package spring.di.ex3;

public class Sawon {

	SawonData data;
	
	public Sawon(SawonData data) {
		this.data=data;
	}
	
	public void writeData() {
		System.out.println("**�������**");
		System.out.println("�����: "+data.getSawonName());
		System.out.println("�޿�: "+data.getPay());
		System.out.println("�Ի���: "+data.getEnterday());
	}
}
