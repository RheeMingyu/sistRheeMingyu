package bjwork;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

public class Main1107 {
	
	public static final int INIT_CHANNEL=100;
	public static final int SINGLE_DIGIT_VAL=10;
	public static final int SMALLEST_NUM=0;
	public static final int GREATEST_NUM=9;
	
	public static final boolean FOR_GREATER=true;
	public static final boolean FOR_SMALLER=false;
	
	public static int only_buttons(int channel) {		
		return Math.abs(channel-INIT_CHANNEL);
	}
	
	public static int with_nums(int channel,int digit_count,List<Integer> usable_list,boolean sg) {
		
		int divisor=(int)Math.pow(SINGLE_DIGIT_VAL, digit_count-1);
		int diff=0;
		int digits=digit_count;
		
		for(int i=0;i<digit_count;i++) {
			int digit=(int)(channel/divisor);
			int near=get_approximation(digit, usable_list, sg);
			
			if(i==0) {
				int min_digit=Collections.min(usable_list);
				int max_digit=Collections.max(usable_list);
				List<Integer> sub_list=new ArrayList<>(usable_list.size());
				sub_list.addAll(usable_list);
				sub_list.remove(Integer.valueOf(0));
				int sub_min=Collections.min(sub_list);
					
				if(max_digit<digit&&sg) {
					diff+=(sub_min*11-digit)*divisor; //min_digit가 0일때 오류
					digits=digit_count+1;
				}
				else if(min_digit>digit&&!sg) {
					diff+=digit*divisor;
					digits=digit_count-1;
				}
				else
					diff+=Math.abs(digit-near)*divisor;
			}
			else if(i!=0&&sg)
				diff+=Collections.min(usable_list)*divisor;
			else if(i!=0&&!sg)
				diff-=Collections.max(usable_list)*divisor;
			
			channel%=divisor;
			divisor/=SINGLE_DIGIT_VAL;
		}
		return diff+digits;
	}
	
	public static int get_approximation(int digit,List<Integer> usable_list,boolean sg) {
		
		int min=Integer.MAX_VALUE;
		int near=0;
		
		for(int i=0;i<usable_list.size();i++) {
			int diff=Math.abs(usable_list.get(i)-digit);
			
			if(sg&&min>=diff) { //큰거용
				min=diff;
				near=usable_list.get(i);
			}
			else if(!sg&&min>diff) {
				min=diff;
				near=usable_list.get(i);
			}
		}
		return near;
	}
	
	/*public static List<Integer> usable_list() {
		List<Integer> usable_list=new ArrayList<>();
		
		for(int i=SMALLEST_NUM;i<SINGLE_DIGIT_VAL;i++) {
			usable_list.add(i);
		}
		return usable_list;
	}*/

	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		
		int channel=sc.nextInt();
		int disabled_cnt=sc.nextInt();
		List<Integer> usable_list=new ArrayList<>(Arrays.asList(0,1,2,3,4,5,6,7,8,9));
		
		for(int i=0;i<disabled_cnt;i++) {
			int disabled_num=sc.nextInt();
			usable_list.remove(Integer.valueOf(disabled_num));
		}
		int digit_count=(channel+"").length();
		//int digit_count=(int)(Math.log10(channel)+1);
		
		int only_buttons=only_buttons(channel);
		int with_nums_g=with_nums(channel, digit_count, usable_list, FOR_GREATER);
		int with_nums_s=with_nums(channel, digit_count, usable_list, FOR_SMALLER);
		
		int result=Math.min(only_buttons, Math.min(with_nums_g, with_nums_s));
		
		System.out.println(result);
	}

}
