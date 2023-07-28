package bjwork;

import java.util.Scanner;

public class Main3 {
	
	public static double[] insertion_sort(double [] arr) {
		
        for (int i = 1; i < arr.length; i++) {
            double key = arr[i];
            int j = i - 1;
            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
		
		return arr;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner sc=new Scanner(System.in);
		
		int N=sc.nextInt();
		double sum=0;

		double [] arr=new double[N];
		
		for(int i=0;i<arr.length;i++)
			arr[i]=sc.nextInt();
		
		double [] arr1=Main3.insertion_sort(arr);
		
		for(int i=0;i<arr1.length;i++)
		{
			double v=(arr1[i]/arr1[arr1.length-1])*100;
			sum+=v;
		}
		System.out.println(sum/arr1.length);
	}

}
