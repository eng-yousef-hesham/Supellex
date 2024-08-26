package com.supellex.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import com.supellex.entity.*;

public class productmodel {
	public List<product> get_product_by_name(DataSource datasource1, String name) {
		List<product> product1 = new ArrayList<>();
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();
			name = "%" + name + "%";
			String quary = "select * from product where product_titel like ?";
			stat = connect.prepareStatement(quary);
			stat.setString(1, name);
			rs = stat.executeQuery();

			while (rs.next()) {
				product1.add(new product(rs.getInt("idproduct"), rs.getInt("price"), rs.getString("description"),
						rs.getString("product_titel"), rs.getInt("product_rate"), rs.getString("category"),
						rs.getString("adding_date"), rs.getInt("discount")));
			}

			connect.close();
			stat.close();
			return product1;

		} catch (Exception e) {

			return null;
		}

	}

	public product get_product_by_id(DataSource datasource1, int id) {
		product product1 = null;
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();

			String quary = "select * from product where idproduct = ?";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, id);
			rs = stat.executeQuery();

			while (rs.next()) {
				product1 = new product(rs.getInt("idproduct"), rs.getInt("price"), rs.getString("description"),
						rs.getString("product_titel"), rs.getInt("product_rate"), rs.getString("category"),
						rs.getString("adding_date"), rs.getInt("discount"));
			}
			connect.close();
			stat.close();
			return product1;

		} catch (Exception e) {

			return null;
		}

	}

	public List<product> get_trandy_product(DataSource datasource1) {
		List<product> product1 = new ArrayList<>();
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();

			String quary = "select * from product where product_rate >= 3.5";
			stat = connect.prepareStatement(quary);
			rs = stat.executeQuery();

			while (rs.next()) {
				product1.add(new product(rs.getInt("idproduct"), rs.getInt("price"), rs.getString("description"),
						rs.getString("product_titel"), rs.getInt("product_rate"), rs.getString("category"),
						rs.getString("adding_date"), rs.getInt("discount")));
			}
			connect.close();
			stat.close();
			return product1;

		} catch (Exception e) {

			return null;
		}
	}

	public List<product> get_Just_Arrived_product(DataSource datasource1) {
		List<product> product1 = new ArrayList<>();
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();

			String quary = "select * from product order by adding_date DESC";
			stat = connect.prepareStatement(quary);
			rs = stat.executeQuery();

			while (rs.next()) {
				product1.add(new product(rs.getInt("idproduct"), rs.getInt("price"), rs.getString("description"),
						rs.getString("product_titel"), rs.getInt("product_rate"), rs.getString("category"),
						rs.getString("adding_date"), rs.getInt("discount")));
			}
			connect.close();
			stat.close();
			return product1;

		} catch (Exception e) {

			return null;
		}
	}

	public List<product> get_product(DataSource datasource1) {
		List<product> product1 = new ArrayList<>();
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();

			String quary = "select * from product order by product_rate DESC";
			stat = connect.prepareStatement(quary);
			rs = stat.executeQuery();

			while (rs.next()) {
				product1.add(new product(rs.getInt("idproduct"), rs.getInt("price"), rs.getString("description"),
						rs.getString("product_titel"), rs.getInt("product_rate"), rs.getString("category"),
						rs.getString("adding_date"), rs.getInt("discount")));
			}
			connect.close();
			stat.close();
			return product1;

		} catch (Exception e) {

			return null;
		}
	}

	public void insert_product(DataSource datasource1, String product_name, int product_price, String category,
			String description, int rate, int discount) {
		Connection connect = null;
		PreparedStatement stat = null;
		try {
			connect = datasource1.getConnection();

			String quary = "insert into product (product_titel,price,category,description,adding_date,product_rate,discount) values (?,?,?,?,now(),?,?)";
			stat = connect.prepareStatement(quary);
			stat.setString(1, product_name);
			stat.setInt(2, product_price);
			stat.setString(3, category);
			stat.setString(4, description);
			stat.setInt(5, rate);
			stat.setInt(6, discount);
			stat.execute();

			connect.close();
			return;
		} catch (Exception e) {

			return;
		}
	}

	public int get_last_product(DataSource datasource1) {
		List<Integer> productid = new ArrayList<Integer>() ;
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();
			
			String quary = "SELECT Max(idproduct) as idproduct FROM product";
			stat = connect.prepareStatement(quary);

			rs = stat.executeQuery(quary);
			
			while (rs.next()) {
				productid.add(rs.getInt("idproduct"));
				
			}
			connect.close();
			stat.close();
			
			return productid.get(0);
			
		} catch (Exception e) {

			return 0;
		}

	}
	public void insert_product_photo(DataSource datasource1, int product_id , String product_name) {
		Connection connect = null;
		PreparedStatement stat = null;
		try {
			connect = datasource1.getConnection();

			String quary = "insert into product_photos (idproduct_photos,photo_name) values (?,?)";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, product_id);
			stat.setString(2, product_name);
			

			stat.execute();

			connect.close();
			return;
		} catch (Exception e) {

			return;
		}
	}
	public int get_numper_different_product(DataSource datasource1,int id) {
		List<Integer> productid = new ArrayList<Integer>() ;
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();
			
			String quary = "SELECT  idproduct_photos FROM product_photos where idproduct_photos = ?";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, id);
			rs = stat.executeQuery();
			
			while (rs.next()) {
				productid.add(rs.getInt("idproduct_photos"));
				
			}
			connect.close();
			stat.close();
			
			return productid.size();
			
		} catch (Exception e) {

			return 0;
		}
	}
	
	public Map<Integer,String[]> get_product_poto(DataSource datasource1) {
		Map<Integer,String[]> items = new HashMap<Integer, String[]>();
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();
			
			String quary = "SELECT  idproduct_photos, photo_name FROM product_photos";
			stat = connect.prepareStatement(quary);
			
			rs = stat.executeQuery(quary);
			
			int counter = -1;
			int test = -1;
			int size;
			
			int first=1;
			
			String[]name = new String[1];
			while (rs.next()) {
				
				Integer temp =rs.getInt("idproduct_photos");
				size = get_numper_different_product(datasource1,temp);
				
				System.out.println(temp);
				if(test!=temp)
				{
					
					counter=0;
					size = get_numper_different_product(datasource1,temp);
					
					name = new String[size];
					
				}
				if(test==temp)
				{
					counter++;
				}
				
				name[counter]=rs.getString("photo_name");
				System.out.println("test");
				System.out.println(counter);
				System.out.println("{"+name[counter]+"}");
				items.put(temp, name);
				
				test = temp;
				
			}
			connect.close();
			stat.close();
			
			return items;
			
		} catch (Exception e) {
			System.out.println("now");

			return null;
		}

	}

}
