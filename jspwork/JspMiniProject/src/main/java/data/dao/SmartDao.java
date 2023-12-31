package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import data.dto.SmartDto;
import mysql.db.DBConnect;

public class SmartDao {

	DBConnect db=new DBConnect();
	
	public void insertSmart(SmartDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into smartboard(writer,subject,content,writeday) values(?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public List<SmartDto> getPagingList(int start,int perPage) {
		
		List<SmartDto> list=new ArrayList<SmartDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from smartboard order by num desc limit ?,?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, perPage);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				SmartDto dto=new SmartDto();
				
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setViewcount(rs.getInt("viewcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int getTotalCount() {
		
		int total=0;
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from smartboard";
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			if(rs.next())
				total=rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		
		return total;
	}
	
	//가장최근에 추가된 글의 num값 얻기
	public int getMaxNum() {
		
		int max=0;
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select max(num) from smartboard";
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			if(rs.next())
				max=rs.getInt("max(num)");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		
		return max;
	}
	
	public SmartDto getSingleData(String num) {
		
		SmartDto dto=new SmartDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from smartboard where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setViewcount(rs.getInt("viewcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public void updateSmart(SmartDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update smartboard set writer=?,subject=?,content=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getNum());
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void deleteSmart(String num) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from smartboard where num=?";
		
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
