package com.supellex.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class logout_controller
 */
@WebServlet("/logout_controller")
public class logout_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public logout_controller() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getSession().getAttribute("login_user") != null) {
			request.getSession().invalidate();
			//System.out.print("test");
		}
		response.sendRedirect(request.getContextPath()+"/home?page=home");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
