package day0630;

interface InterA {
	public void draw();
	public void write();
}
/////////////////////
interface InterB {
	public void play();
}
////////////////////// 2개의 인터페이스를 구현하는 클래스
class Impl implements InterA,InterB{

	@Override
	public void play() {
		// TODO Auto-generated method stub
		System.out.println("축구를 합니다");
	}

	@Override
	public void draw() {
		// TODO Auto-generated method stub
		System.out.println("그림을 그립니다");
	}

	@Override
	public void write() {
		// TODO Auto-generated method stub
		System.out.println("일기를 씁니다");
	}
	
}
/////////////////////
public class InterImpl_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//생성#1
		Impl impl=new Impl();
		
		impl.play();
		impl.draw();
		impl.write();
		
		//다형성
		InterA inA=new Impl();
		inA.draw();
		inA.write();
		
		InterB inB=new Impl();
		inB.play();
	}

}
