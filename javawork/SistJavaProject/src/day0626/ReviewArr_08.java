package day0626;

public class ReviewArr_08 {

	public static void main(String[] args) {
		// 해당 배열을 for문을 이용하여 출력하시오

		//1.ex>0번지: 영환이
		
		String [] names= {"영환이","수환이","동환이","성환이"};
		
		//2.해당배열을 가로로 출력하시오
		int [] nums= {2,4,5,7,8};
		
		//flowers
		String [] flowers= {"장미","로즈마리","해바라기","백합"};
		
		//colors
		String [] colors= {"blue","red","yellow","white","black"};
		
		for(int i=0;i<names.length;i++)
			System.out.println(i+"번지: "+names[i]);
		
		for(int i=0;i<nums.length;i++)
			System.out.print(nums[i]+" ");
		System.out.println();
		
		for(int i=0;i<flowers.length;i++)
			System.out.println(flowers[i]);
		
		for(int i=0;i<colors.length;i++)
			System.out.println(colors[i]);
		
		String [][] fcn= {
				{"장미","로즈마리","해바라기","백합"},
				{"blue","red","yellow","white","black"},
				{"2","4","5","7","8"},
				{"영환이","수환이","동환이","성환이"}
				};
		
		for(int i=0;i<fcn.length;i++)
		{
			for(int j=0;j<fcn[i].length;j++)
			{
				System.out.printf("(%d,%d) %s\t",i,j,fcn[i][j]);
			}
			System.out.println();
		}
		
		for(int i=0;i<nums.length-1;i++)
		{
			for(int j=i+1;j<nums.length;j++)
			{
				if(nums[i]<nums[j])
				{
					int temp=nums[i];
					nums[i]=nums[j];
					nums[j]=temp;
				}
			}
		}
		
		for(int i=0;i<nums.length;i++)
			System.out.print(nums[i]+" ");
	}

}
