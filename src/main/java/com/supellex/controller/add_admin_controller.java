package com.supellex.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.supellex.entity.user;
import com.supellex.model.add_adminmodel;
import com.supellex.model.usertableModel;


@WebServlet("/add_admin_controller")
public class add_admin_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/project")
	private DataSource datasource1;
	
    public add_admin_controller() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("isadmin") == null)
		{
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}
		String page = request.getParameter("page");
		if (page == null) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
		
			
		page = page.toLowerCase();
		switch (page) {
		case ("add_admin"):
			get_all_users(request,response,datasource1);
			request.getRequestDispatcher("add_admin.jsp").forward(request, response);

			break;
			
		default:
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		add_admin(request, response, datasource1);
	}
	
	private void get_all_users(HttpServletRequest request, HttpServletResponse response,DataSource dataSource1)throws ServletException, IOException
	{
		List<user> users = new ArrayList<user>();
		users = new add_adminmodel().get_user(dataSource1);
		request.setAttribute("users", users);
	}
	
	private void add_admin(HttpServletRequest request, HttpServletResponse response,DataSource dataSource1)throws ServletException, IOException{
		int id =  Integer.parseInt(request.getParameter("admin"));
		boolean test = new usertableModel().admin_test(dataSource1, id);
		if(!test)
		{
			new add_adminmodel().add_admin(dataSource1, id);
			response.sendRedirect(request.getContextPath()+"/home?page=home");
			return;
		}
		get_all_users(request,response,datasource1);
		request.getRequestDispatcher("add_admin.jsp").forward(request, response);
	}
	

}
