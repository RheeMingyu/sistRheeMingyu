package member.model;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mysql.db.DBConnect;

public class MemberDao {
	
	DBConnect db=new DBConnect();

	//아이디존재하면 true
	public boolean overlapCheck(String id) {
		
		boolean flag=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from spmember where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return flag;
	}
	
	//insert
	public void insertMember(MemberDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into spmember values(null,?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getImage());
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public ArrayList<MemberDto> getAllDatas() {
		
		ArrayList<MemberDto> list=new ArrayList<MemberDto>();
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from spmember order by num";
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				MemberDto dto=new MemberDto();
				
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setHp(rs.getString("hp"));
				dto.setImage(rs.getString("photo"));
				dto.setGaip(rs.getTimestamp("gaip"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		
		return list;
	}
	
	public boolean authentification(String id,String pass) {
		
		boolean flag=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from spmember where id=? and pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return flag;
	}
	
	public String getName(String id) {
		
		String name="";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from spmember where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				name=rs.getString("name");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return name;
	}
	
	public MemberDto getSingleData(String num) {
		
		MemberDto dto=new MemberDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from spmember where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setHp(rs.getString("hp"));
				dto.setImage(rs.getString("photo"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public void updateMember(MemberDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update spmember set id=?,pass=?,name=?,hp=?,photo=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getImage());
			pstmt.setString(6, dto.getNum());
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void deleteMember(String num) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from spmember where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}
