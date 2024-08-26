package com.supellex.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.supellex.entity.contact;

public class contactmodel {

	public boolean add_message(DataSource datasource1, contact thecontact) {
		int id_user_for_contact = thecontact.getId_user_for_contact();
		String email = thecontact.getEmail();
		String subject = thecontact.getSubject();
		String message = thecontact.getMessage();
		Connection connect = null;
		PreparedStatement stat = null;

		try {
			connect = datasource1.getConnection();

			String quary = "INSERT  INTO contact (id_user_for_contact , email , subject , message) VALUES ( ? , ? , ? , ?)";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, id_user_for_contact);
			stat.setString(2, email);
			stat.setString(3, subject);
			stat.setString(4, message);
			stat.execute();
			connect.close();
			return true;

		} catch (Exception e) {

			return false;
		}

	}

	public List<contact> get_message(DataSource datasource1) {
		List<contact> thecontact = new ArrayList<contact>();
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();

			String quary = "select * from contact ";
			stat = connect.prepareStatement(quary);
			rs = stat.executeQuery();

			while (rs.next()) {
				thecontact.add(new contact(rs.getInt("idcontact"), rs.getInt("id_user_for_contact"), rs.getString("email"),
						rs.getString("subject"), rs.getString("message")));
			}
			connect.close();
			return thecontact;

		} catch (Exception e) {

			return null;
		}

	}
	
	public void delete_items_from_contact_userid(DataSource datasource1,int id)
	{
		
		Connection connect = null;
		PreparedStatement stat = null;
		
		try {
			connect = datasource1.getConnection();
			String quary = "delete from contact where idcontact = ?";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, id);
			stat.execute();
			connect.close();
			stat.close();
			
			return ;

		} catch (Exception e) {
			
			return ;
		}
		
	}
}
