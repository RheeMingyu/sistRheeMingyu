package day0703;

import java.util.HashSet;

public class SetInt_11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HashSet<Integer> set1=new HashSet<Integer>();
		
		set1.add(12);
		set1.add(43);
		set1.add(92);
		set1.add(81);
		set1.add(43);
		set1.add(14);
		
		System.out.println("갯수: "+set1.size());
		
		Object [] ob=set1.toArray();
		
		for(int i=0;i<ob.length;i++)
			System.out.printf("%5d",ob[i]);
	}

}
