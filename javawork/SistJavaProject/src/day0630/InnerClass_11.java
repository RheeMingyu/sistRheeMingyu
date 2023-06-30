package day0630;

//내부클래스 -특정클래스 내에 또다른 클래스가 정의됨
//하나의 멤버처럼 사용가능(외부의 모든멤버들을 자신의 멤버처럼 사용가능)
//상속이 하나인 단점을 어느정도 보완해줌
class OuterObject {
	
	class InnerObject {
		public void write() {
			System.out.println("내부클래스의 메소드");
		}
	}
	
	public void showMsg() {
		System.out.println("외부클래스의 메소드");
		System.out.println("외부에서 내부클래스 메서드 호출");
		
		InnerObject inObj=new InnerObject();
		inObj.write();
	}
}
////////////////
public class InnerClass_11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		OuterObject outObj=new OuterObject();
		outObj.showMsg();
		System.out.println("-------------------");
		
		//내부클래스의 메서드 선언..외부통해서만 가능
		//OuterObject.InnerObject obj=new OuterObject().new InnerObject();
		OuterObject.InnerObject obj=outObj.new InnerObject();
		obj.write();
	}

}
