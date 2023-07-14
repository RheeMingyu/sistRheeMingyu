package Homework;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Homework {

	DBConnect db=new DBConnect();
	Scanner sc=new Scanner(System.in);
	
	public void insert() {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into mystudent values(seq_stu.nextval,?,?,?,?,?,sysdate)";
		
		System.out.println("학생의 이름은?");
		String name=sc.nextLine();	
		System.out.println("학생의 학년은?");
		int grade=Integer.parseInt(sc.nextLine());	
		System.out.println("학생의 전화번호는?");
		String hp=sc.nextLine();	
		System.out.println("학생의 주소는?");
		String addr=sc.nextLine();
		System.out.println("학생의 나이는?");
		int age=Integer.parseInt(sc.nextLine());
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setInt(2, grade);
			pstmt.setString(3, hp);
			pstmt.setString(4, addr);
			pstmt.setInt(5, age);
			
			int a=pstmt.executeUpdate();
			if(a==1)
				System.out.println("입력 성공");
			else
				System.out.println("입력 실패");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void select() {
		System.out.println("학생번호\t학생명\t학년\t전화번호\t\t주소\t나이\t입력일자");
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from mystudent order by stu_num";
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int num=rs.getInt("stu_num");
				String name=rs.getString("stu_name");
				int grade=rs.getInt("stu_grade");
				String hp=rs.getString("hp");
				String addr=rs.getString("addr");
				int age=rs.getInt("age");
				String sdate=rs.getString("sdate");
				
				System.out.println(num+"\t"+name+"\t"+grade+"\t"+hp+"\t"+addr+"\t"+age+"\t"+sdate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
	}
	
	public void delete() {
		System.out.println("삭제할 시퀀스는?");
		int n=Integer.parseInt(sc.nextLine());
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from mystudent where stu_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, n);
			
			int a=pstmt.executeUpdate();
			
			if(a==1)
				System.out.println("삭제 성공");
			else
				System.out.println("존재하지 않는 시퀀스입니다");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void update() {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update mystudent set stu_name=?,stu_grade=?,hp=?,addr=?,age=? where stu_num=?";
		
		System.out.println("수정할 시퀀스는?");
		int n=Integer.parseInt(sc.nextLine());
		
		if(!this.isData(n))
		{
			System.out.println("존재하지 않는 시퀀스입니다");
			return;
		}
		System.out.println("수정할 학생명은?");
		String name=sc.nextLine();
		System.out.println("수정할 학년은?");
		int grade=Integer.parseInt(sc.nextLine());
		System.out.println("수정할 전화번호는?");
		String hp=sc.nextLine();
		System.out.println("수정할 주소는?");
		String addr=sc.nextLine();
		System.out.println("수정할 나이는?");
		int age=Integer.parseInt(sc.nextLine());
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setInt(2, grade);
			pstmt.setString(3, hp);
			pstmt.setString(4, addr);
			pstmt.setInt(5, age);
			pstmt.setInt(6, n);
			
			pstmt.executeUpdate();
			
			System.out.println("수정 성공");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean isData(int n) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		boolean flag=false;
		
		String sql="select * from mystudent where stu_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, n);
			
			pstmt.execute();
			rs=pstmt.executeQuery();
			
			if(rs.next())
				flag=true;
			else
				flag=false;			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return flag;
	}
	
	public void searchMyStudent() {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		System.out.println("검색할 학생명은?(일부)");
		String name=sc.nextLine();
		
		String sql="select * from mystudent where stu_name like ?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+name+"%");
			
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				int num=rs.getInt("stu_num");
				String sname=rs.getString("stu_name");
				int grade=rs.getInt("stu_grade");
				String hp=rs.getString("hp");
				String addr=rs.getString("addr");
				int age=rs.getInt("age");
				String sdate=rs.getString("sdate");
				
				System.out.println(num+"\t"+sname+"\t"+grade+"\t"+hp+"\t"+addr+"\t"+age+"\t"+sdate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Homework hw=new Homework();
		Scanner sc=new Scanner(System.in);
		int n;

		while(true)
		{
			System.out.println("**학생정보**");
			System.out.println("1.입력 2.출력 3.삭제 4.수정 5.학생정보검색 9.종료");
			n=Integer.parseInt(sc.nextLine());
				
			if(n==1)
				hw.insert();
			else if(n==2)
				hw.select();
			else if(n==3)
				hw.delete();
			else if(n==4)
				hw.update();
			else if(n==5)
				hw.searchMyStudent();
			else if(n==9)
			{
				System.out.println("종료합니다");
				break;
			}
		}				
	}

}
