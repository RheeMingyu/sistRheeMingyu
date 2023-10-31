package bjwork;

import java.util.Scanner;

public class Main1033 {
	
	private static int a;
	private static int b;
	private static int p;
	private static int q;

	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		
		int n=sc.nextInt();
		int [] abpq=new int [4];
		
		for(int i=0;i<=n;i++) {
			
			a=sc.nextInt();
			b=sc.nextInt();
			p=sc.nextInt();
			q=sc.nextInt();
			
			abpq[0]=a;
			abpq[1]=b;
			abpq[2]=p;
			abpq[3]=q;
		}
	}

}
