package bjwork;

import java.util.Scanner;

public class Main2 {
	
	public static int[] aprev(int[]arr) {	
		
		int N=arr[0],r=arr[1],c=arr[2],idx=arr[3];
		
		if((r+1)<=Math.pow(2, N-1)&&(c+1)<=Math.pow(2, N-1))
		{
			Main2.prev(N-1, r, c, idx);
			idx=arr[3];
		}
		else if((r+1)<=Math.pow(2, N-1)&&(c+1)>Math.pow(2, N-1))
		{
			c-=Math.pow(2, N-1);
			Main2.prev(N-1, r, c, idx);
			idx=arr[3];
		}
		else if((r+1)>Math.pow(2, N-1)&&(c+1)<=Math.pow(2, N-1))
		{
			r-=Math.pow(2, N-1);
			Main2.prev(N-1, r, c, idx);
			idx=arr[3];
		}
		else
		{
			c-=Math.pow(2, N-1);
			r-=Math.pow(2, N-1);
			Main2.prev(N-1, r, c, idx);
			idx=arr[3];
		}

		int [] arr2= {N,r,c,idx};
		return arr2;
	}
	
	public static int[] prev(int N,int r,int c,int idx) {

		if((r+1)<=Math.pow(2, N-1)&&(c+1)<=Math.pow(2, N-1))
			idx=0;
		else if((r+1)<=Math.pow(2, N-1)&&(c+1)>Math.pow(2, N-1))
			idx=(int)Math.pow(2, 2*(N-1));
		else if((r+1)>Math.pow(2, N-1)&&(c+1)<=Math.pow(2, N-1))
			idx=(int)Math.pow(2, 2*(N-1)+1);
		else
			idx=(int)(Math.pow(2, 2*(N-1))+Math.pow(2, 2*(N-1)+1));

		int [] arr1= {N,r,c,idx};
		
		return arr1;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		
		int N=sc.nextInt();
		int r=sc.nextInt();
		int c=sc.nextInt();
		int idx=0;
		
		int [] arr= {N,r,c,idx};
		
		for(int i=N;i>0;i--)
		{
			int [] arr1=Main2.prev(i, r, c, idx);
			int [] arr2=Main2.aprev(arr1);
			
			r=arr2[1];
			c=arr2[2];
			
			if(i==N)
				idx+=arr1[3];
			else
				idx+=arr2[3];
		}
		System.out.println(idx);
	}

}
