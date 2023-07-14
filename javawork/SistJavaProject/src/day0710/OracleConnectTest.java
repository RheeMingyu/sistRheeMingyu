package day0710;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OracleConnectTest {

	static final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	public void connectSawon() {
		
		Connection conn=null; //자바와 오라클 연결
		Statement stmt=null; //crud 전체 sql 전달
		ResultSet rs=null; //리스트가 없을 때까지 읽어옴
		
		String sql="select * from sawon order by name";
		
		try {
			conn=DriverManager.getConnection(URL, "RheeMingyu", "a1234");
			System.out.println("클라우드 오라클 서버 연결성공!!");
			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) //true값 반환,더이상 데이터 없으면 false
			{
				// db로부터 데이터 가져오기
				int num=rs.getInt("num"); //컬럼명 or 열변호
				String name=rs.getString("name");
				String gender=rs.getString("gender");
				String buseo=rs.getString("buseo");
				int pay=rs.getInt("pay");
				
				System.out.println(num+"\t"+name+"\t"+gender+"\t"+buseo+"\t"+pay);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("오라클 서버 연결실패!!"+e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void connectBamin() {
		//주문번호 주문자 음식명 가격 상호명 가게위치 주문자주소
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select f.fno,name,foodname,price,shopname,loc,addr "
				+ "from food f,jumun j "
				+ "where f.fno=j.fno "
				+ "order by name";
		
		try {
			conn=DriverManager.getConnection(URL, "RheeMingyu", "a1234");
			System.out.println("연결성공!!");
			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int fno=rs.getInt("fno");
				String name=rs.getString("name");
				String foodname=rs.getString("foodname");
				int price=rs.getInt("price");
				String shopname=rs.getString("shopname");
				String loc=rs.getString("loc");
				String addr=rs.getString("addr");
				
				System.out.println(fno+"\t"+name+"\t"+foodname+"\t"+price+"\t"+shopname+"\t"+loc+"\t"+addr);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("연결실패!!"+e.getMessage());
		} finally {
				try {
					if(rs!=null) rs.close();
					if(stmt!=null) stmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
	}	
	
	public void connectSawonGroup() {
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select gender,count(*) cnt,to_char(avg(pay),'L999,999,999') avgpay from sawon group by gender";
		
		try {
			conn=DriverManager.getConnection(URL, "RheeMingyu", "a1234");
			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			System.out.println("성별 인원 및 평균급여");
			System.out.println("성별\t인원수\t평균급여");
			
			while(rs.next())
			{
				String gender=rs.getString("gender");
				int count=rs.getInt("cnt"); //명확한 컬럼명이 없으면 sql에서 alias 주고 alias를 컬럼명으로 입력
				String avgpay=rs.getString("avgpay"); //그 외에는 명확한 컬럼명이나 인덱스번호
				
				System.out.println(gender+"\t"+count+"\t"+avgpay);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		OracleConnectTest oc=new OracleConnectTest();
		//oc.connectSawon();
		
		oc.connectBamin();
		
		//oc.connectSawonGroup();
	}

}
