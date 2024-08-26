package com.supellex.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.supellex.entity.product;

public class cartmodel {
	public void add_to_cart(DataSource datasource1,int user_id,int product_id)
	{
		Connection connect = null;
		PreparedStatement stat = null;
		try {
			connect = datasource1.getConnection();
			String quary = "insert into cart (user_id,product_id) values (?,?)";
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
	public List<Integer> get_items_id_from_cart(DataSource datasource1,int user_id)
	{
		List<Integer> ids = new ArrayList<>();
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();
			String quary = "select product_id from cart where user_id = ?";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, user_id);
			rs = stat.executeQuery();
			
			
			while(rs.next())
			{
				Integer x = rs.getInt("product_id");
				ids.add(x);
			}
			
			
			connect.close();
			stat.close();
			
			return ids;

		} catch (Exception e) {
			
			return null;
		}
		
	}
	public boolean search_for_item_in_cart(DataSource datasource1,int user_id,int product_id)
	{
		List<Integer> idss = new ArrayList<>();
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();
			String quary = "select * from cart where user_id = ? and product_id = ?";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, user_id);
			stat.setInt(2, product_id);
			rs = stat.executeQuery();
			while(rs.next())
			{
				Integer x = rs.getInt("product_id");
				idss.add(x);
			}
			
			connect.close();
			stat.close();
			System.out.println(idss.get(0));
			if(idss != null)
			{
				System.out.println("true");
				return true;
				
			}
			return false;
			

		} catch (Exception e) {
			System.out.println("false");
			return false;
		}
		
	}
	public void delete_from_cart(DataSource datasource1,int user_id,int product_id)
	{
		Connection connect = null;
		PreparedStatement stat = null;
		try {
			connect = datasource1.getConnection();
			String quary = "delete from cart where user_id = ? and product_id = ?";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, user_id);
			stat.setInt(2, product_id);
			stat.execute();
			
			System.out.println("sssssda");
			connect.close();
			stat.close();
			

		} catch (Exception e) {
			
			return ;
		}
		
	}
	
		
	
	
	

}
