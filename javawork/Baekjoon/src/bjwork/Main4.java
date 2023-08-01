package bjwork;

import java.util.Scanner;

public class Main4 {
	
	public static int quotient_sum(int [] arr,int mid) {
		
		int qsum=0;
		
		for(int i=0;i<arr.length;i++)
			qsum+=(int)(arr[i]/mid);
		
		return qsum;
	}
	
	public static int binary_search(int N,int [] arr,int high) {
		
		int low=1;
	    int mid;
	    int result=0;
		
		while(low<=high) 
		{
	        mid=(int)((high+low)/2);

	        int qsum=quotient_sum(arr,mid);

	        if(qsum>=N)
	        {
	        	result=mid;
	        	low=mid+1;
	        }
	        else
	        	high=mid-1;
	    }

	    return result;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		
		int K=sc.nextInt(),N=sc.nextInt(),sum=0;	
		int [] arr=new int[K];
//		int [] quotient=new int[K];
		
		for(int i=0;i<arr.length;i++)
		{
			arr[i]=sc.nextInt();
			sum+=arr[i];
		}
		
		int maxLength=(int)(sum/N);
		
		int result=binary_search(N,arr,maxLength);
		
		System.out.println(result);
	}

}
