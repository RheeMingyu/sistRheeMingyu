package day0630;

import java.util.Scanner;

abstract class Command {
	abstract public void write();
}
//////////////////
class Insert1 extends Command{

	@Override
	public void write() {
		System.out.println("추가합니다");
	}
	
}
////////////////
class List extends Command{

	@Override
	public void write() {
		System.out.println("조회합니다");
	}
	
}
////////////////
class Modify extends Command{

	@Override
	public void write() {
		System.out.println("수정합니다");
	}
	
}
////////////////
class Delete1 extends Command{

	@Override
	public void write() {
		System.out.println("삭제합니다");
	}
	
}
////////////////////
public class OracleCRUD_06 {

	public static void main(String[] args) {

		Scanner sc=new Scanner(System.in);
		int n;
		
		Command command=null;
		
		while(true)
		{
			System.out.println("1.추가 2.조회 3.수정 4.삭제 9.종료");
			n=sc.nextInt();
			
			if(n==1)
				command=new Insert1();
			else if(n==2)
				command=new List();
			else if(n==3)
				command=new Modify();
			else if(n==4)
				command=new Delete1();
			else if(n==9)
				System.out.println("종료합니다");
			else
				System.out.println("잘못입력하셨습니다");
			
			if(n<=4)
				command.write();
		}
	}

}
