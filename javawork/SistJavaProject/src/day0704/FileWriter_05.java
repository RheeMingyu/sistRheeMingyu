package day0704;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

public class FileWriter_05 {

	public static void fileWriter() {
		FileWriter fw=null; //메서드에서는 반드시 초기값 지정
		String fileName="D:\\sist0615\\file\\filetest1.txt";
		
		try {
			fw=new FileWriter(fileName); //파일새로 생성(같은이름이 있어도 새로생성)
			
			//파일에 내용 추가
			fw.write("Have a Nice Day!!\n"); //메모장줄넘김
			fw.write(new Date().toString()); //fw.write에는 모두 문서형식으로 담아야함
			System.out.println("파일 저장 성공");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void fileWriter2() {
		FileWriter fw=null;
		String fileName="D:\\sist0615\\file\\filetest2.txt";
		
		try {
			fw=new FileWriter(fileName,true);//추가모드
			
			fw.write("내이름은 홍길동\n");
			fw.write("===========\n");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		fileWriter();
		fileWriter2();
	}

}
