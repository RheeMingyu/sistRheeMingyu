package day0616;

import java.util.Calendar;
import java.util.Date;

public class CalendarTest_11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//Date date=new Date();
		
		//System.out.println("지금은 "+(date.getYear()+1900));
		
		Calendar cal=Calendar.getInstance();
		System.out.println("지금은 "+cal.get(cal.YEAR)+"년도입니다");
		System.out.println("지금은 "+(cal.get(cal.MONTH)+1)+"월입니다");
		System.out.println("지금은 "+cal.get(cal.DATE)+"일입니다");
		System.out.println("지금은 "+cal.get(cal.DAY_OF_MONTH)+"일입니다");
		System.out.println("지금은 "+cal.get(cal.HOUR)+"시"
						+cal.get(cal.MINUTE)+"분"+cal.get(cal.SECOND)+"초입니다");

	}

}
