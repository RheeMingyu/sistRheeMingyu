package dbtest;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class CRUDTest {

	DBConnect db=new DBConnect();
	
	//insert
	public void insert() {
		
		Scanner sc=new Scanner(System.in);
			
		System.out.println("이름입력");
		String name=sc.nextLine();
		
		System.out.println("주소입력");
		String addr=sc.nextLine();
		
		String sql="insert into myinfo values (seq1.nextval,'"+name+"','"+addr+"',sysdate)";
		
		//1.db연결
		Connection conn=db.getConnection();
		//2.statement
		Statement stmt=null;
		
		try {
			stmt=conn.createStatement();
			stmt.execute(sql);
			
			System.out.println("***정보가 추가되었습니다***");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("insert error: "+e.getMessage());
		} finally {
			db.dbClose(stmt, conn);
		}
	}
	
	//select
	public void select() {
		
		//Connection
		Connection conn=db.getConnection(); //이미 try~catch 처리된 것
		Statement stmt=null;
		ResultSet rs=null;
		
		//요청한 sql문을 String에 저장
		String sql="select * from myinfo order by num";
		
		System.out.println("시퀀스\t이름\t주소\t입력시간");
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			//2개이상일경우는 while문
			//resultset객체의 next이용해서 행을선택하고 get메서드를 이용해서 테이블의 컬럼값을 얻는다
			while(rs.next())
			{
				int num=rs.getInt("num");
				String name=rs.getString("name");
				String addr=rs.getString("addr");
				String sdate=rs.getString("sdate");
				
				System.out.println(num+"\t"+name+"\t"+addr+"\t"+sdate);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("select error"+e.getMessage());
		} finally {
			db.dbClose(rs, stmt, conn);
		}
	}
	
	public void delete() {
		Scanner sc=new Scanner(System.in);
		
		System.out.println("삭제할 시퀀스 입력");
		int n=Integer.parseInt(sc.nextLine());
		
		String sql="delete from myinfo where num="+n;
		
		//db연결
		Connection conn=db.getConnection();
		//statement
		Statement stmt=null; //try~catch문에 갇히지 않게 하기 위해서
		
		try {
			stmt=conn.createStatement();
			
			//sql문 실행
			int a=stmt.executeUpdate(sql); //성공한 갯수
			
			if(a==0) //없는번호 입력시 실제 삭제가 되지않으므로 0반환
				System.out.println("없는 데이터 번호입니다");
			else //삭제되면 1반환
				System.out.println("***정보가 삭제되었습니다***");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(stmt, conn);
		}
	}
	
	//update할때 없는번호인지 있는번호인지 찾아주기
	public boolean isData(String n) {
		
		//n에 해당하는 데이터가 있으면 true,없으면 false
		boolean flag=false;
		
		String sql="select * from myinfo where num="+n;
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			//1개일경우는 if문
			if(rs.next()) //데이터가 있는경우
				flag=true;
			else //없는경우
				flag=false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		
		return flag;
	}
	
	public void update() {
		
		//수정할 시퀀스 입력후 이름,주소 입력
		Scanner sc=new Scanner(System.in);
		System.out.println("수정할 시퀀스는?");
		String n=sc.nextLine();
		
		//위의 boolean메서드 가져와서 실행
		if(!this.isData(n))
		{
			System.out.println("해당번호는 존재하지 않습니다");
			return; //메서드 종료
		}
		
		System.out.println("수정할 이름은?");
		String name=sc.nextLine();
		
		System.out.println("수정할 주소는?");
		String addr=sc.nextLine();
		
		//sql
		String sql="update myinfo set name='"+name+"',addr='"+addr+"' where num="+n;
		
		System.out.println(sql);
		
		//db연결
		Connection conn=db.getConnection();
		Statement stmt=null;
		
		try {
			stmt=conn.createStatement();
			
			int a=stmt.executeUpdate(sql);
			
			/*if(a==0)
				System.out.println("수정할 데이터가 존재하지 않습니다");
			else
				System.out.println("***수정되었습니다***");*/
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("update error: "+e.getMessage());
		} finally {
			db.dbClose(stmt, conn);
		}
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		CRUDTest crud=new CRUDTest();
		
		Scanner sc=new Scanner(System.in);
		int n;
		
		while(true)
		{
			System.out.println("***Oracle db 연습_myinfo***");
			System.out.println("1.insert 2.select 3.delete 4.update 9.종료");
			
			n=Integer.parseInt(sc.nextLine());
			
			if(n==1)
				crud.insert();
			else if(n==2)
				crud.select();
			else if(n==3)
				crud.delete();
			else if(n==4)
				crud.update();
			else if(n==9)
			{
				System.out.println("종료합니다");
				break;
			}
		}
	}

}
