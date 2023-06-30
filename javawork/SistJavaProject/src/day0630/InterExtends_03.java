package day0630;

interface InterAA {
	public void eat();
	public void go();
}
///////////////////////
interface InterBB extends InterAA{
	public void ride();
}
/////////////////////////
class InterImpl2 implements InterBB{

	@Override
	public void eat() {
		// TODO Auto-generated method stub
		System.out.println("저녁을 먹어요");
	}

	@Override
	public void go() {
		// TODO Auto-generated method stub
		System.out.println("롯데월드 가요");
	}

	@Override
	public void ride() {
		// TODO Auto-generated method stub
		System.out.println("자전거 타고 놀아요");
	}
	
}
/////////////////////
public class InterExtends_03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		InterImpl2 inter=new InterImpl2();
		inter.eat();
		inter.go();
		inter.ride();
		
		//다형성 호출
		InterBB inter1=new InterImpl2();
		inter1.eat();
		inter1.go();
		inter1.ride();
	}

}
