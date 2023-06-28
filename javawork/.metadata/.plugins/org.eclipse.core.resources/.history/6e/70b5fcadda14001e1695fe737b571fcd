package day0627;

class ObTestA {
	
	private int x;
	private static int y;
	
	//x
	public void setX(int xx)
	{
		//this.x=xx;
		x=xx;  //이름이 틀릴땐 this생략가능
	}
	
	//x
	public void getX()
	{
		System.out.println("x="+this.x);
	}
	
	//y
	public static void setY(int yy)
	{
		//this.y=yy; static변수는 레퍼런스변수인 this를 가지고있지않다
		//일반멤버변수 호출못함...static변수만 호출가능
		ObTestA.y=yy;
	}
	
	public static void getY()
	{
		System.out.println("y="+ObTestA.y);
	}
}
////////////////////////////
public class ExObTest_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*x는 생성..private 붙이는 순간 에러...메서드로 접근해야
		ObTestA oa1=new ObTestA();
		System.out.println(oa1.x);
		//y는 클래스명으로 호출
		System.out.println(ObTestA.y);*/
		
		//private변수이므로 메서드 만들어서 호출가능..변수에 직접 접근안됨
		ObTestA oa1=new ObTestA();
		oa1.setX(20);
		oa1.getX();
		
		ObTestA oa2=new ObTestA();
		oa2.setX(50);
		oa2.getX();
		
		//ObTestA.y=200;  private이므로 멤버y에 직접접근못함
		//y호출...클래스명으로 호출
		ObTestA.setY(100);
		ObTestA.getY();
	}

}
