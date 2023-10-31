package bjwork;

import java.util.Scanner;

public class Main1978 {

	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		
		int n=sc.nextInt();
		int cnt=0;
		
		for(int i=0;i<n;i++) {
			
			int number=sc.nextInt();
			boolean flag=false;
			
			for(int j=2;j<=(number/2);j++) {
				
				if(number%j==0)
					flag=true;
			}
			if(!flag&&number!=1)
				cnt++;
		}
		System.out.println(cnt);
	}

}
