package day0704;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ShopMain_03 {

	List<Shop> list=new ArrayList<Shop>();
	
	public void inputShop() {
		Scanner sc=new Scanner(System.in);
		String mer;
		int qnt,prc;
		
		System.out.println("상품명?");
		mer=sc.nextLine();
		System.out.println("수량?");
		qnt=Integer.parseInt(sc.nextLine());
		System.out.println("가격?");
		prc=Integer.parseInt(sc.nextLine());
		
		Shop shop=new Shop();
		shop.setSangName(mer);
		shop.setSu(qnt);
		shop.setDan(prc);
		
		list.add(shop);
		System.out.println("현재데이터 개수: "+list.size());
	}
	
	public void printShop() {
		System.out.println("게시판\n=========");
		System.out.println("번호\t상품명\t수량\t가격\t총가격");
		
		for(int i=0;i<list.size();i++)
		{
			Shop shop=list.get(i);
			
			System.out.println((i+1)+"\t"+shop.getSangName()+"\t"+shop.getSu()
							+"\t"+shop.getDan()+"\t"+shop.getSu()*shop.getDan());
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ShopMain_03 sm=new ShopMain_03();
		Scanner sc=new Scanner(System.in);
		int n;
		
		while(true)
		{
			System.out.println("1.추가 2.전체출력 9.종료");
			n=Integer.parseInt(sc.nextLine());
					
			if(n==1)
				sm.inputShop();
			else if(n==2)
				sm.printShop();
			else if(n==9)
			{
				System.out.println("프로그램 종료");
				break;
			}
			else
			{
				System.out.println("잘못입력했어요");
				continue;
			}
		}
	}

}
