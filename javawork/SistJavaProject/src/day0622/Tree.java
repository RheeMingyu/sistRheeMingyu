package day0622;

import java.util.Scanner;

public class Tree {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("중첩(다중)for문으로 별모양 찍기");
		/*
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
		*/
		Scanner sc=new Scanner(System.in);
		System.out.println("높이 입력 ");
		int h;
		h=sc.nextInt();
		
		/*for(int i=1;i<=h;i++)
		{
			for(int star=1;star<=(2*i-1);star++)
			{
				for(int space=1;space<=(h-i);space++)
				{	
					if(star>=2)
						continue;
					System.out.print("a");
				}
				System.out.print("*");
			}
			System.out.println();
		}*/
		
		/*for(int i=1;i<=h;i++)
		{
			for(int space=1;space<=(h-i);space++)
			System.out.print("a");
			for(int star=1;star<=(2*i-1);star++)
			{
				if(star%2==0)
					System.out.print("b");
				else
					System.out.print("*");
			}
			System.out.println();
		}*/
		
		/*for(int i=1;i<=h;i++)
		{
			for(int space=1;space<=(h-i);space++)
				System.out.print("a");
			for(int star=1;star<=(2*i-1);star++)
				System.out.print("*");
			System.out.println();
		}*/
		
		for(int i=1;i<=h;i++)
		{
			for(int j=1;j<=(h+i-1);j++)
			{
				if(j<=(h-i))
					System.out.print("a");
				else
				{
					if((h+i-j)%2==0)
						System.out.print("a");
					else
						System.out.print("*");
				}
			}
		System.out.println();
		}
	}

}
