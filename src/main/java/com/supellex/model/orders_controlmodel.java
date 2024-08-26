package com.supellex.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class orders_controlmodel {
	public List<Integer> get_users_id_from_orders(DataSource datasource1)
	{
		List<Integer> ids = new ArrayList<Integer>();
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();
			String quary = "select distinct user_id from orderr";
			stat = connect.prepareStatement(quary);
			
			rs = stat.executeQuery();
			

			
			while(rs.next())
			{
				Integer x = rs.getInt("user_id");
				ids.add(x);
			}
			
			
			connect.close();
			stat.close();
			
			return ids;

		} catch (Exception e) {
			
			return null;
		}
		
	}
	public List<Integer> get_items_from_order_by_userid(DataSource datasource1,int user_id)
	{
		List<Integer> items = new ArrayList<>();
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();
			String quary = "select product_id from orderr where user_id = ?";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, user_id);
			rs = stat.executeQuery();
			
			
			while(rs.next())
			{
				
				items.add(rs.getInt("product_id"));
			}
			
			
			connect.close();
			stat.close();
			
			return items;

		} catch (Exception e) {
			
			return null;
		}
		
	}
	
	public void delete_items_from_order_by_userid(DataSource datasource1,int user_id)
	{
		
		Connection connect = null;
		PreparedStatement stat = null;
		
		try {
			connect = datasource1.getConnection();
			String quary = "delete from orderr where user_id = ?";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, user_id);
			stat.execute();
			connect.close();
			stat.close();
			
			return ;

		} catch (Exception e) {
			
			return ;
		}
		
	}

}
