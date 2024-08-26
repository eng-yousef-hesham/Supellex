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

import com.supellex.entity.address;
import com.supellex.entity.product;
import com.supellex.entity.user;
import com.supellex.model.checkoutmodel;
import com.supellex.model.orders_controlmodel;
import com.supellex.model.productmodel;
import com.supellex.model.usertableModel;

/**
 * Servlet implementation class settings_controller
 */
@WebServlet("/settings_controller")
public class settings_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/project")
	private DataSource datasource1;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String page = request.getParameter("page");
		if (page == null) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}

		if (request.getSession().getAttribute("login_user") == null) {
			response.sendRedirect(request.getContextPath() + "/login_controller?page=login&error=Login First");
			return;
		}

		int id = (int) request.getSession().getAttribute("login_user");

		page = page.toLowerCase();
		switch (page) {
		case ("settings"):
			get_user_info(request, response, id);
			get_user_orders(request, response, id);
			get_user_address(request, response, id);
			request.getRequestDispatcher("settings.jsp").forward(request, response);
			break;

		default:
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	private void get_user_info(HttpServletRequest request, HttpServletResponse response, int id)
			throws ServletException, IOException {

		user tempuser = new usertableModel().get_user_by_userid(datasource1, id);

		request.setAttribute("user_data", tempuser);

	}

	private void get_user_orders(HttpServletRequest request, HttpServletResponse response, int id)
			throws ServletException, IOException {

		List<Integer> items = new orders_controlmodel().get_items_from_order_by_userid(datasource1, id);
		List<product> products = new ArrayList<product>();
		int size = items.size();
		for (int i = 0; i < size; i++) {
			products.add(new productmodel().get_product_by_id(datasource1, items.get(i)));
		}

		request.setAttribute("user_products", products);

	}

	private void get_user_address(HttpServletRequest request, HttpServletResponse response, int id)
			throws ServletException, IOException {

		if (new checkoutmodel().get_address_by_user_id(datasource1, id).isEmpty()) {
			address tempaddress = new address(-1, "empty", "empty", "empty", "empty", "empty", "empty", id);
			request.setAttribute("user_address", tempaddress);
		}else {
			address tempaddress = new checkoutmodel().get_address_by_user_id(datasource1, id).get(0);
			request.setAttribute("user_address", tempaddress);
		}

	}

}
