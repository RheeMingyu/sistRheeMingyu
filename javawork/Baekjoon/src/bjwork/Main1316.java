package bjwork;

import java.util.Scanner;

public class Main1316 {
	
	private final static boolean acceptable=true;
	private final static boolean unacceptable=false;
	
	private final static int init_count=0;
	
	public static boolean isValid(String input) {
		
		boolean flag=acceptable;
		int i=init_count;
		
		while(i<input.length()-1) {
			
			if(input.charAt(i)!=input.charAt(i+1)) {
				//int from_begin=input.indexOf(input.charAt(i));
				int from_last=input.lastIndexOf(input.charAt(i));
				
				if(i!=from_last) {
					flag=unacceptable;
					//input=input.substring(from_begin+1);
				}
			}
			i++;
		}
		return flag;
	}

	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		int cnt=init_count;
		
		int inputcount=sc.nextInt();
		
		for(int i=0;i<=inputcount;i++) {
			
			String inputstr=sc.nextLine();

			if(isValid(inputstr))
				cnt++;
		}
		System.out.println(cnt-1);
	}
}
