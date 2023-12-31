package day0703;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

//score.txt를 읽고 몇개인지 구하고 총점,평균까지 구해서 출력
public class FileException_06 {

	public static void scoreRead() {
		String fileName="D:\\sist0615\\file\\score.txt";
		FileReader fr=null; //메서드에서는 무조건 초기값 주어야함
		BufferedReader br=null;
		int cnt=0,sum=0;
		double avg=0;
		
		try {
			fr=new FileReader(fileName);
			br=new BufferedReader(fr);
			
			while(true)
			{
			String s=br.readLine();
			
			if(s==null)
				break;
			
			cnt++;
			sum+=Integer.parseInt(s);
			avg=(double)sum/cnt;
			
			System.out.println(s);
			}
			System.out.println(cnt+"개\n총점:"+sum+"\n평균:"+avg);

			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO: handle exception
		} finally {
			try {
				//자원은 오픈한 반대순서로 닫기
				br.close();
				fr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		scoreRead();
	}

}
