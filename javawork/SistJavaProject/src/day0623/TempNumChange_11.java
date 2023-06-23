package day0623;

public class TempNumChange_11 {

	public static void main(String[] args) {
		// 순서바꾸기
		int a=10,b=20;
		
		System.out.println("a="+a+" ,b="+b);
		
		int temp=a;
		a=b;
		b=temp;

		System.out.println("a="+a+" ,b="+b);
		
		System.out.println("배열로 순서 바꾸기");
		
		int [] n= {5,7,9};
		
		for(int t:n)
			System.out.print(t+" ");
		
		System.out.println("0번과 2번 교환후 출력");
		
		int temp1=n[0];
		n[0]=n[2];
		n[2]=temp1;
		
		for(int t:n)
			System.out.print(t+" ");
	}

}
