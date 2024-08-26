package com.supellex.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.supellex.model.usertableModel;
import com.supellex.model.passwordmodel;

@WebServlet("/login_controller")
public class login_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/project")
	private DataSource datasource1;

//------------------------------------------------------------------------------------------------------------------------
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");
		if (page == null) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		page = page.toLowerCase();
		switch (page) {

		case ("login"):
			if (request.getParameter("error") != null) {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			request.getRequestDispatcher("login.jsp").forward(request, response);
			break;
		default:
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}

	}

//	-----------------------------------------------------------------------------------------------------------------------

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int id = new usertableModel().userid(datasource1, email);
		if (id == -1) {
			response.sendRedirect(
					request.getContextPath() + "/login_controller?page=login&error=there is no user with this email");
			return;
		} else if (id == -2) {
			response.sendRedirect(
					request.getContextPath() + "/login_controller?page=login&error=error try again later");
			return;
		}

		int idpassword = new passwordmodel().password(datasource1, password, id);

		if (idpassword == -1) {
			response.sendRedirect(request.getContextPath() + "/login_controller?page=login&error=Wrong password");
			return;
		}
		
		if (id == idpassword) {
			
			//test if there is a session if yes invalidate it
			if (request.getSession().getAttribute("login_user") != null) {
				request.getSession().invalidate();
				//System.out.print("test");
			}
			//creat a new session for user id
			HttpSession newsession = request.getSession();
			newsession.setAttribute("login_user", id);
			//System.out.print(request.getSession().getAttribute("login_user"));
			if(new usertableModel().admin_test(datasource1,id))
			{
				newsession.setAttribute("isadmin", "yes");
				//System.out.print(request.getSession().getAttribute("isadmin"));
			}
			
			response.sendRedirect(request.getContextPath() + "/home?page=home");

		} else {
			response.sendRedirect(request.getContextPath() + "/login_controller?page=login&error=Wrong password");
		}

	}

}
