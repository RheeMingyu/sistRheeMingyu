package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import data.dto.CartDto;
import data.dto.ShopDto;
import mysql.db.DBConnect;

public class ShopDao {

	DBConnect db=new DBConnect();
	
	public void insertShop(ShopDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into shop values(null,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getSangpum());
			pstmt.setString(3, dto.getPhoto());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setString(5, dto.getIpgoday());
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public List<ShopDto> getAllSangpums() {
		
		List<ShopDto> list=new ArrayList<ShopDto>();
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from shop order by shopnum desc";
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				ShopDto dto=new ShopDto();
				
				dto.setCategory(rs.getString("category"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setShopnum(rs.getString("shopnum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setIpgoday(rs.getString("ipgoday"));
				dto.setPrice(rs.getInt("price"));
				
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
	
	public ShopDto getSingleSangpum(String shopnum) {
		
		ShopDto dto=new ShopDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from shop where shopnum=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, shopnum);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setCategory(rs.getString("category"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setShopnum(rs.getString("shopnum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setIpgoday(rs.getString("ipgoday"));
				dto.setPrice(rs.getInt("price"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public void insertCart(CartDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into cart values(null,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getShopnum());
			pstmt.setString(2, dto.getNum());
			pstmt.setInt(3, dto.getCnt());
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public List<HashMap<String, String>> getCartList(String id) {
		
		List<HashMap<String, String>> list=new ArrayList<HashMap<String,String>>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select c.idx,m.name,s.sangpum,s.shopnum,s.photo,s.price,c.cnt,c.cartday"
				+ " from cart c,shop s,member m"
				+ " where c.shopnum=s.shopnum and m.num=c.num and m.id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				HashMap<String, String> map=new HashMap<String, String>();
				
				map.put("idx", rs.getString("idx"));
				map.put("name", rs.getString("name"));
				map.put("sangpum", rs.getString("sangpum"));
				map.put("shopnum", rs.getString("shopnum"));
				map.put("photo", rs.getString("photo"));
				map.put("price", rs.getString("price"));
				map.put("cnt", rs.getString("cnt"));
				map.put("cartday", rs.getString("cartday"));
				
				list.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public void deleteCart(String idx) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from cart where idx=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}
