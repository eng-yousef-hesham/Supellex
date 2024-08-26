package com.supellex.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.supellex.entity.contact;
import com.supellex.entity.user;
import com.supellex.model.contactmodel;
import com.supellex.model.orders_controlmodel;
import com.supellex.model.usertableModel;



@WebServlet("/user_message_controller")
public class user_message_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/project")
	private DataSource datasource1;   
    
    public user_message_controller() {
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
		
		
		
		
		if (request.getParameter("delete") != null) {
			int delete_id =Integer.parseInt(request.getParameter("delete"));
			new contactmodel().delete_items_from_contact_userid(datasource1, delete_id);
		}
		
		
		
		page = page.toLowerCase();
		
		switch (page) {
		
		case ("user_message"):
			get_message(request,response);
			
			
			request.getRequestDispatcher("users_message.jsp").forward(request, response);
			break;
		default:
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	private void get_message(HttpServletRequest request, HttpServletResponse response)
	{
	
		List<contact> thecontact = new contactmodel().get_message(datasource1);
		List<user> users = new ArrayList<user>();
		int size = thecontact.size();
		for(int i=0;i<size;i++)
		{
			users.add(new usertableModel().get_user_by_userid(datasource1, thecontact.get(i).getId_user_for_contact()));
		}
		
		request.setAttribute("messages", thecontact);
		request.setAttribute("users", users);
	//System.out.println(map.get(32));

	
	}

}
