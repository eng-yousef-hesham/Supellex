package com.supellex.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.supellex.entity.contact;
import com.supellex.model.contactmodel;

/**
 * Servlet implementation class contact_controller
 */
@WebServlet("/contact_controller")
public class contact_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/project")
	private DataSource datasource1;

	public contact_controller() {
		super();
	}

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

		page = page.toLowerCase();
		switch (page) {
		case ("contact"):
			if (request.getParameter("email") != null && request.getParameter("subject") != null
					&& request.getParameter("message") != null) {
				if (!request.getParameter("email").isEmpty() && !request.getParameter("subject").isEmpty()
						&& !request.getParameter("message").isEmpty()) {
					add_contact(request, response, datasource1);
				}
			}
			request.getRequestDispatcher("contact.jsp").forward(request, response);
			break;
		default:
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	private void add_contact(HttpServletRequest request, HttpServletResponse response, DataSource datasouce) {
		int user_id = (int) request.getSession().getAttribute("login_user");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		contact thecontact = new contact(user_id, email, subject, message);

		new contactmodel().add_message(datasouce, thecontact);
	}

}
