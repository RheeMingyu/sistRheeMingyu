package day0628;

class MyPersonInfo {
	
	private String name;
	private String blood;
	private String age;
	
	public MyPersonInfo(String name,String blood,String age) {
		this.name=name;
		this.blood=blood;
		this.age=age;
	}
	
	//제목
	public static void title() {
		System.out.println("이름\t혈액형\t나이");
		System.out.println("--------------");
	}
	
	//출력문
	public void getInfo() {
		System.out.println(name+"\t"+blood+"형\t"+age+"세");
	}
}
//////////////////
public class ArrObject_10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		MyPersonInfo.title();
		//생성 초기화
		MyPersonInfo [] info= {
				new MyPersonInfo("이민규", "O", "29"),
				new MyPersonInfo("박희찬", "B", "22")
				};
		
		for(int i=0;i<info.length;i++)
		{
			//info[i].getInfo();
			MyPersonInfo x=info[i];
			x.getInfo();
		}
		
		for(MyPersonInfo x:info)
		{
			x.getInfo();
		}
		
	}

}
