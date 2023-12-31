package day0629;

import java.util.Scanner;

class MyTv {

	private String che; //채널
	private String vol; //볼륨
	
	public String getChe() {
		return che;
	}
	public void setChe(String che) {
		this.che = che;
	}
	public String getVol() {
		return vol;
	}
	public void setVol(String vol) {
		this.vol = vol;
	}

	public static void title() {
		System.out.println("**tv시청목록**");
	}
}
////////////////////////
public class ReviewObject_01 {

	public static void getPrint(MyTv[] x) {
		for(MyTv t:x)
		System.out.println(t.getChe()+" 채널을 시철합니다\n볼륨은 "+t.getVol()+"데시벨 입니다");
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner sc=new Scanner(System.in);
		String channel;
		String volume;
		
		System.out.println("입력할 채널 수 입력");
		int many=Integer.parseInt(sc.nextLine());
		
		MyTv [] tv=new MyTv[many];
		
		for(int i=0;i<tv.length;i++)
		{			
			System.out.println("채널 입력");
			channel=sc.nextLine();
			System.out.println("볼륨 입력");	
			volume=sc.nextLine();
		
			tv[i]=new MyTv();
			
			tv[i].setChe(channel);
			tv[i].setVol(volume);
		}
		getPrint(tv);
	}

}
