package day0616;

public class ParseNum02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//String타입을 int타입으로 변경하려면
		//Integer.parseInt("10");  문자열 10이 정수10로 반환
		//Double.parseDouble("12.23");  문자열 12.23이 실수타입의 12.23으로 반환
		
		String num1="10";
		String num2="20";
		
		System.out.println("두수 더하기: "+(num1+num2));

		//문자열num, num2를 정수타입 int로 변환후 계산
		
		int su1=Integer.parseInt(num1);
		int su2=Integer.parseInt(num2);
		
		System.out.println("변환후 두수더하기: "+(su1+su2));
		System.out.println("변환후 두수뺴기: "+(su1-su2));
		System.out.println("변환후 두수곱하기: "+(su1*su2));
		System.out.println("변환후 두수나누기: "+(su1/su2));
		
	}

}
