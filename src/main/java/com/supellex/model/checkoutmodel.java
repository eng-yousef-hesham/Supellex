package com.supellex.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.supellex.entity.address;
import com.supellex.entity.product;

public class checkoutmodel {
	public List<address> get_address_by_user_id(DataSource datasource1, int id) {
		List<address> address1 = new ArrayList<address>();
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();

			String quary = "select * from address where user_id = ?";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, id);
			rs = stat.executeQuery();
			System.out.println("noo");
			while (rs.next()) {
				address1.add(new address(rs.getInt("address_id"), rs.getString("email"), rs.getString("phone"),
						rs.getString("address1"), rs.getString("address2"), rs.getString("country"),
						rs.getString("city"), rs.getInt("user_id")));

			}

			connect.close();
			stat.close();
			return address1;

		} catch (Exception e) {

			return address1;
		}

	}

	public boolean delete_address_by_user_id(DataSource datasource1, int id) {

		Connection connect = null;
		PreparedStatement stat = null;
		try {
			connect = datasource1.getConnection();

			String quary = "delete from address where user_id = ?";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, id);
			stat.execute();
			System.out.println("llll");

			connect.close();
			stat.close();
			return true;

		} catch (Exception e) {

			return false;
		}

	}

	public boolean add_address(DataSource datasource1, String email, String phone, String address1, String address2,
			String country, String city, int user_id) {

		Connection connect = null;
		PreparedStatement stat = null;
		try {
			connect = datasource1.getConnection();

			String quary = "insert into address(email,phone,address1,address2,country,city,user_id) values (?,?,?,?,?,?,?)";
			stat = connect.prepareStatement(quary);
			stat.setString(1, email);
			stat.setString(2,phone);
			stat.setString(3,address1);
			stat.setString(4,address2);
			stat.setString(5,country);
			stat.setString(6,city);
			stat.setInt(7, user_id);
			stat.execute();
			System.out.println("llll");

			connect.close();
			stat.close();
			return true;

		} catch (Exception e) {

			return false;
		}

	}
	public boolean place_order(DataSource datasource1, int user_id) {

		
		
		List<Integer> ids = new cartmodel().get_items_id_from_cart(datasource1,user_id);
		
		if(ids.isEmpty())
		{
			return false;
		}
		
		cartmodel cm = new cartmodel();
		
		Connection connect = null;
		PreparedStatement stat = null;
		
		try {
			connect = datasource1.getConnection();
			for(int i :ids) {
				
			String quary = "insert into orderr (user_id, product_id) values (?,?)";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, user_id);
			stat.setInt(2, i);
			
			stat.execute();
			System.out.println(i+" "+user_id);
			cm.delete_from_cart(datasource1, user_id, i);
			}

			connect.close();
			stat.close();
			return true;

		} catch (Exception e) {

			return false;
		}

	}
	

}
