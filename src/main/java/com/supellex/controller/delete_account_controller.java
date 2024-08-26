package com.supellex.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.supellex.entity.user;
import com.supellex.model.cartmodel;
import com.supellex.model.checkoutmodel;
import com.supellex.model.usertableModel;

/**
 * Servlet implementation class delete_account_controller
 */
@WebServlet("/delete_account_controller")
public class delete_account_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;   
	@Resource(name = "jdbc/project")
	private DataSource datasource1;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String page = request.getParameter("page");
		if (page == null) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
		if (request.getSession().getAttribute("login_user") == null) {
			response.sendRedirect(request.getContextPath() + "/login_controller?page=login&error=Login First");
			return;
		}
		if(request.getParameter("agree_on_delete") !=null)
		{
			
			delete_account(request, response,datasource1);
			System.out.println("iam here");
			return;
		}
		
			
		page = page.toLowerCase();
		switch (page) {
		case ("delete_account"):

			request.getRequestDispatcher("delete_account.jsp").forward(request, response);

			break;
			
		default:
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	private void delete_account(HttpServletRequest request, HttpServletResponse response,DataSource datasource2)
			throws ServletException, IOException {
		
		int id = (int) request.getSession().getAttribute("login_user");
		
	
		new usertableModel().delete_user(datasource2, id);
		System.out.println("iam there");
		if (request.getSession().getAttribute("login_user") != null) {
			request.getSession().invalidate();
		}
		response.sendRedirect(request.getContextPath()+"/home?page=home");

		return;

		

	}

}
