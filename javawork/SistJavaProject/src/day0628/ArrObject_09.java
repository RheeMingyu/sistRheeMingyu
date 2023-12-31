package day0628;

class Student {
	
	private String sname;
	private String hp;
	private int grade;
	
	//명시적 생성자
	public Student(String sname,String hp,int grade) {
		this.sname=sname;
		this.hp=hp;
		this.grade=grade;
	}
	
	//멤버값 출력데이터
	public void getData() {
		System.out.println("이름: "+sname);
		System.out.println("연락처: "+hp);
		System.out.println("학년: "+grade);
	}
}
///////////////////////
public class ArrObject_09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*Student[] stu=new Student[3];
		
		stu[0]=new Student("이민규", "010-8250-9354", 3);
		stu[1]=new Student("최진평", "010-1111-2224", 1);
		stu[2]=new Student("임형준", "010-2222-3334", 2);*/
		
		//생성하면서 바로 초기화
		Student [] stu= {
				new Student("이민규", "010-8250-9354", 3),
				new Student("최진평", "010-1111-2224", 1),
				new Student("임형준", "010-2222-3334", 2)
				};
		
		
		//출력#1
		for(int i=0;i<stu.length;i++)
		{
			//stu[i].getData();
			Student s=stu[i];
			s.getData();
			
			System.out.println("--------------");
		}
		
		//출력#2
		for(Student s1:stu) //클래스 통째로 가져오려면 자료형 대신 클래스명
		{
			s1.getData();
			System.out.println("=========");
		}
	}

}
