package day0703;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.StringTokenizer;

public class QuizTokenFile_09 {

	public static void fruitReader() {
		String fileName="D:\\sist0615\\file\\fruit.txt";
		FileReader fr=null;
		BufferedReader br=null;
		
		try {
			fr=new FileReader(fileName);
			br=new BufferedReader(fr);
			
			while(true)
			{
				String s=br.readLine();
				
				if(s==null)
					break;
				
				/*StringTokenizer st=new StringTokenizer(s, ",");
				
				System.out.println(st.nextToken()+"\t"+(qnt=st.nextToken())+"\t"+(prc=st.nextToken())
									+"\t"+Integer.parseInt(qnt)*Integer.parseInt(prc));
									
				String name=st.nextToken();
				int qnt=Integer.parseInt(st.nextToken());
				int prc=Integer.parseInt(st.nextToken());
				System.out.println(name+"\t"+qnt+"\t"+prc+"\t"+qnt*prc);*/
				
				String [] data=s.split(",");
				String name=data[0];
				int qnt=Integer.parseInt(data[1]);
				int prc=Integer.parseInt(data[2]);
				int tot=qnt*prc;
				System.out.println(name+"\t"+qnt+"\t"+prc+"\t"+tot);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			
		} finally {
			try {
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

		System.out.println("과일목록");
		System.out.println("상품\t수량\t단가\t총금액");
		System.out.println("-------------------");
		fruitReader();
	}

}
