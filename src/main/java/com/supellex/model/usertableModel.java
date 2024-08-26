package com.supellex.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.sql.DataSource;

import com.supellex.entity.user;

public class usertableModel {
	public int userid(DataSource datasource1, String email) {
		int uservariable = -1;
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();

			String quary = "select id from usertable where email = ?";
			stat = connect.prepareStatement(quary);
			stat.setString(1, email);
			rs = stat.executeQuery();

			while (rs.next()) {
				uservariable = rs.getInt("id");
			}
			connect.close();
			return uservariable;

		} catch (Exception e) {

			return -2;
		}

	}

	public boolean test_email_exist(DataSource datasource1, String email) {
		int uservariable = -1;
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();

			String quary = "select id from usertable where email = ?";
			stat = connect.prepareStatement(quary);
			stat.setString(1, email);
			rs = stat.executeQuery();

			while (rs.next()) {
				uservariable = rs.getInt("id");
			}
			if (uservariable != -1) {
				connect.close();
				return true;
			} else {
				connect.close();
				return false;
			}

		} catch (Exception e) {

			return false;
		}
	}

	public boolean add_user(DataSource datasource1, user newuser) {
		String username = newuser.getUsername();
		String email = newuser.getEmail();
		Connection connect = null;
		PreparedStatement stat = null;

		try {
			connect = datasource1.getConnection();

			String quary = "INSERT  INTO usertable ( username , email) VALUES ( ? , ?)";
			stat = connect.prepareStatement(quary);
			stat.setString(1, username);
			stat.setString(2, email);
			stat.execute();
			connect.close();
			return true;

		} catch (Exception e) {

			return false;
		}

	}

	public void delete_user(DataSource datasource1, int userid)
	{
		
		Connection connect = null;
		PreparedStatement stat = null;

		try {
			int id = userid;
			connect = datasource1.getConnection();
			String quary = "delete from usertable where id = ?";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, id);
			System.out.println(stat.toString());
			stat.execute();
			connect.close();
			stat.close();
			
			return;

		} catch (Exception e) {
			System.out.println("newwwwwwwwwwwwwwwwwwwwwwwwwwwwwwweeeeeeeeeeeeeeee2");
			return;
		}
	}

	public boolean admin_test(DataSource datasource1, int userid) {
		int adminid = -1;
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();

			String quary = "select * from admin where id_admin = ?";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, userid);
			rs = stat.executeQuery();

			while (rs.next()) {
				adminid = rs.getInt("id_admin");
			}
			connect.close();
			if (adminid == userid)
				return true;
			else
				return false;
		} catch (Exception e) {

			return false;
		}
	}

	public user get_user_by_userid(DataSource datasource1, int id) {
		user user1 = new user();
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();

			String quary = "select * from usertable where id = ?";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, id);
			rs = stat.executeQuery();
			
			while (rs.next()) {
				 user1.setId(rs.getInt("id"));
				 user1.setUsername(rs.getString("username"));
				 user1.setEmail(rs.getString("email"));
				 
				 
			}
			System.out.println(user1.getEmail());
			connect.close();
			stat.close();
			return user1;

		} catch (Exception e) {

			return null;
		}

	}
}
