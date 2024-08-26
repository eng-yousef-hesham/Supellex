package com.supellex.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class wishlistmodel {
	public void add_to_wishlist(DataSource datasource1,int user_id,int product_id)
	{
		Connection connect = null;
		PreparedStatement stat = null;
		try {
			connect = datasource1.getConnection();
			String quary = "insert into wishlist (user_id_for_wishlist,product_id_for_wishlist) values (?,?)";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, user_id);
			stat.setInt(2, product_id);
			stat.execute();
			
			
			connect.close();
			stat.close();
			
			return;
		} catch (Exception e) {
			
			return ;
		}
		
	}
	public boolean is_product_in_wishlist(DataSource datasource1,int user_id,int product_id)
	{
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs =null;
		int s = 0;
		try {
			connect = datasource1.getConnection();
			String quary = "select idwishlist from wishlist where user_id_for_wishlist = ? and product_id_for_wishlist = ?";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, user_id);
			stat.setInt(2, product_id);
			rs = stat.executeQuery();
			while(rs.next())
			{
				
				s= rs.getInt("idwishlist");
			}
			
			
			connect.close();
			stat.close();
			
			if(s != 0)
			{
				return true;
			}
			else
			{
				return false;
			}
				
		} catch (Exception e) {
			
			return false;
		}
		
	}
	public List<Integer> wishlist_products(DataSource datasource1,int user_id)
	{
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs =null;
		List<Integer> s = new ArrayList<Integer>();

		try {
			connect = datasource1.getConnection();
			String quary = "select product_id_for_wishlist from wishlist where user_id_for_wishlist = ?";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, user_id);
			
			rs = stat.executeQuery();
			while(rs.next())
			{
				s.add(rs.getInt("product_id_for_wishlist"));
				
			}
			
			
			connect.close();
			stat.close();
			
			
			return s;
		} catch (Exception e) {
			
			return null;
		}
		
	}

}
