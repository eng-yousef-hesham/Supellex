package com.supellex.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.supellex.entity.*;
import com.supellex.model.*;

/**
 * Servlet implementation class signup
 */
@WebServlet("/signup_controller")
public class signup_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/project")
	private DataSource datasource1;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String signup_username = request.getParameter("signup-username");
		String signup_email = request.getParameter("signup-email");
		String signup_password = request.getParameter("signup-password");
		String signup_password_confirm = request.getParameter("signup-password-confirm");

		user newuser = new user();
		if (signup_username == null) {
			response.sendRedirect(request.getContextPath() + "/login_controller?page=login&error=username is mandatory");
			return;
		}
		if (signup_email == null) {
			response.sendRedirect(request.getContextPath() + "/login_controller?page=login&error=user email is mandatory");
			return;
		}
		if (signup_password == null) {
			response.sendRedirect(request.getContextPath() + "/login_controller?page=login&error=field to creat new user");
			return;
		} else if (!signup_password.equals(signup_password_confirm) || signup_password_confirm == null) {
			response.sendRedirect(request.getContextPath() + "/login_controller?page=login&error=wrong password confirmation");
			return;
		}
		if (new usertableModel().test_email_exist(datasource1, signup_email)) {
			response.sendRedirect(request.getContextPath() + "/login_controller?page=login&error=this email is already exist");
			return;
		}
		newuser.setEmail(signup_email);
		newuser.setUsername(signup_username);
		if (new usertableModel().add_user(datasource1, newuser)) {
			int newuser_id = new usertableModel().userid(datasource1, signup_email);
			password newuserpassword = new password();
			newuserpassword.setIdpassword(newuser_id);
			newuserpassword.setPasswordcol(signup_password);
			if (new passwordmodel().insert_newuser_password(datasource1, newuserpassword)) {
				response.sendRedirect(request.getContextPath() + "/login_controller?page=login&done=new user added successfully");
				return;
			} else {
				new usertableModel().delete_user(datasource1, newuser_id);
				response.sendRedirect(
						request.getContextPath() + "/login_controller?page=login&error=field to add user please try again");
				return;
			}

		} else {
			response.sendRedirect(
					request.getContextPath() + "/login_controller?page=login&error=field to add user please try again");
			return;
		}

	}

}
