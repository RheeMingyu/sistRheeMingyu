package day0626;

public class ArrDaCha_07 {

	public static void main(String[] args) {
		// 다차원배열 선언과 동시에 초기값 지정후 출력
		
		int [][] arr= {
				{22,33},
				{11,22,33},
				{10,20,30,40}
				};
		
		System.out.println("총행갯수: "+arr.length);
		System.out.println("0번행의 열갯수: "+arr[0].length);
		System.out.println("1번행의 열갯수: "+arr[1].length);
		System.out.println("2번행의 열갯수: "+arr[2].length);
		
		//for문으로 출력
		for(int i=0;i<arr.length;i++)//행
		{
			for(int j=0;j<arr[i].length;j++)//열
			{
				System.out.printf("[%d],[%d]=%d\t",i,j,arr[i][j]);
			}
			System.out.println();
		}
	}

}
