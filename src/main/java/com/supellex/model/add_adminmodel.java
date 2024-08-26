package com.supellex.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.supellex.entity.user;

public class add_adminmodel {
	public List<user> get_user(DataSource datasource1) {
		List<user> user1 = new ArrayList<user>();
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();

			String quary = "select * from usertable ";
			stat = connect.prepareStatement(quary);
			
			rs = stat.executeQuery(quary);
			
			while (rs.next()) {
				 user1.add(new user(rs.getInt("id"),rs.getString("username"),rs.getString("email")));			 
			}
			
			connect.close();
			return user1;

		} catch (Exception e) {

			return null;
		}

	}
	
	public boolean add_admin(DataSource datasource1, int id) {
		
		Connection connect = null;
		PreparedStatement stat = null;

		try {
			connect = datasource1.getConnection();

			String quary = "INSERT  INTO admin ( id_admin) VALUES ( ? )";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, id);

			stat.execute();
			connect.close();
			return true;

		} catch (Exception e) {

			return false;
		}

	}

}
