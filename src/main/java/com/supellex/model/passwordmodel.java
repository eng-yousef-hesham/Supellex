package com.supellex.model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.sql.DataSource;

import com.supellex.entity.password;

public class passwordmodel {
	public int password(DataSource datasource1, String password, int id) {
		int idpassword = -1;
		Connection connect = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			connect = datasource1.getConnection();

			String quary = "select idpassword from password where passwordcol = ? and idpassword = ?";
			stat = connect.prepareStatement(quary);
			stat.setString(1, password);
			stat.setInt(2, id);
			rs = stat.executeQuery();

			while (rs.next()) {
				idpassword = rs.getInt("idpassword");
			}
			connect.close();
			return idpassword;
		} catch (Exception e) {

			return idpassword;
		}
	}

	public boolean insert_newuser_password(DataSource datasource1, password userpassword) {
		int newuserid = userpassword.getIdpassword();
		String newuserpassword = userpassword.getPasswordcol();
		Connection connect = null;
		PreparedStatement stat = null;

		try {
			connect = datasource1.getConnection();

			String quary = "INSERT  INTO password ( idpassword , passwordcol) VALUES ( ?,?)";
			stat = connect.prepareStatement(quary);
			stat.setInt(1, newuserid);
			stat.setString(2, newuserpassword);
			stat.execute();

			connect.close();
			return true;
		} catch (Exception e) {

			return false;
		}
	}
}
