package day0622;

import java.util.Scanner;

public class ForStar_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("중첩(다중)for문으로 별모양 찍기");
		
		for(int i=1;i<=5;i++) //행갯수
		{
			for(int j=1;j<=5;j++)//열갯수
			{
				System.out.print("*");
			}
			System.out.println();
		}
		
		System.out.println();
		
		for(int i=1;i<=5;i++)
		{
			for(int j=1;j<=i;j++) //열갯수(i값만큼만 반복)
			System.out.print("*");
			System.out.println();
		}
		
		for(int i=1;i<=5;i++)
		{
			for(int j=5;j>=i;j--) //열갯수(i가 1일떄 5번, 2일때 4번,...)
				System.out.print("*");
			System.out.println();
		}
	}

}
