package bjwork;

import java.util.Scanner;

public class Main4 {
	
	public static int[] insertion_sort(int [] arr) {
		
        for(int i=1;i<arr.length;i++) {
            int key=arr[i];
            int j=i-1;
            while(j>=0&&arr[j]>key) {
                arr[j+1]=arr[j];
                j--;
            }
            arr[j+1]=key;
        }
		return arr;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		
		int K=sc.nextInt(),N=sc.nextInt(),sum=0,x;	
		int [] arr=new int[N];
		
		for(int i=0;i<arr.length;i++)
		{
			arr[i]=sc.nextInt();
			sum+=arr[i];
		}	
		int [] arrm=Main4.insertion_sort(arr);
		int min=arrm[0];
		int max=arrm[arrm.length-1];
		
	}

}
