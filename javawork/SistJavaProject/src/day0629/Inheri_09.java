package day0629;

class Work {
	public void process() {
		System.out.println("작업중");
	}
}
////////////////////
class Food extends Work{
	
	@Override
	public void process() {
		// TODO Auto-generated method stub
		super.process();
		System.out.println("음식을 합니다");
	}
}
////////////////////
class Clean extends Work{
	
	@Override
	public void process() {
		// TODO Auto-generated method stub
		super.process();
		System.out.println("청소를 합니다");
	}
}
///////////////////
class Study extends Work{
	
	@Override
	public void process() {
		// TODO Auto-generated method stub
		super.process();
		System.out.println("공부를 합니다");
	}
}
////////////////////
public class Inheri_09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//일반적인 생성..메서드호출
		Food f=new Food();
		f.process();
		
		Clean c=new Clean();
		c.process();
		
		Study s=new Study();
		s.process();
		
		//다형성
		System.out.println("**다형성 출력중**");
		Work w=null;
		
		w=new Food();
		w.process();
		
		w=new Clean();
		w.process();
		
		w=new Study();
		w.process();
	}

}
