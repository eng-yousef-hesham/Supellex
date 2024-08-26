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
import com.supellex.model.cartmodel;
import com.supellex.model.checkoutmodel;
import com.supellex.model.productmodel;

@WebServlet("/checkout_controller")
public class checkout_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/project")
	private DataSource datasource1;

	public checkout_controller() {
		super();
		// TODO Auto-generated constructor stub
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

		int user_id = (int) request.getSession().getAttribute("login_user");
		page = page.toLowerCase();

		if (request.getParameter("getold") != null) {

			request.setAttribute("getoldtest", "true");
			List<address> address1 = new checkoutmodel().get_address_by_user_id(datasource1, user_id);
			if (address1.isEmpty()) {
				request.removeAttribute("getoldtest");
			}
			request.setAttribute("getoldaddress", address1);

		}

		if (request.getParameter("getold") == null) {
			save_address_and_place_order(request, response, user_id);
		}

		switch (page) {
		case ("checkout"):
			get_cart_product_for_address(request, response, user_id);
			request.getRequestDispatcher("checkout.jsp").forward(request, response);
			break;
		default:
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void save_address_and_place_order(HttpServletRequest request, HttpServletResponse response, int user_id)
			throws ServletException, IOException {
		if (request.getParameter("email") != null && request.getParameter("phone") != null
				&& request.getParameter("address1") != null && request.getParameter("address2") != null
				&& request.getParameter("country") != null && request.getParameter("city") != null
				&& request.getParameter("page") != null) {
			if (!request.getParameter("email").isEmpty() && !request.getParameter("phone").isEmpty()
					&& !request.getParameter("address1").isEmpty() && !request.getParameter("address2").isEmpty()
					&& !request.getParameter("country").isEmpty() && !request.getParameter("city").isEmpty()
					&& request.getParameter("page").equals("checkout")) {
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String address11 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				String country = request.getParameter("country");
				String city = request.getParameter("city");
				if(new checkoutmodel().get_address_by_user_id(datasource1, user_id).isEmpty())
				{
					new checkoutmodel().add_address(datasource1, email, phone, address11, address2, country, city,
							user_id);
				}
				if (request.getParameter("save") != null) {
					List<address> address1 = new checkoutmodel().get_address_by_user_id(datasource1, user_id);
					if (!address1.isEmpty()) {
						new checkoutmodel().delete_address_by_user_id(datasource1, user_id);
					}
					new checkoutmodel().add_address(datasource1, email, phone, address11, address2, country, city,
							user_id);
				}
				
				new checkoutmodel().place_order(datasource1, user_id);
				

			}
		}
	}
	private void get_cart_product_for_address(HttpServletRequest request, HttpServletResponse response, int user_id)
			throws ServletException, IOException {
		List<Integer> ids = new cartmodel().get_items_id_from_cart(datasource1, user_id);
		List<product> product1 = new ArrayList<product>();
		int size = 0;
		if (ids != null) {
			size = ids.size();
		}

		product temp_product = null;
		for (int i = 0; i < size; i++) {
			int product_temp_id = ids.get(i);
			temp_product = new productmodel().get_product_by_id(datasource1, product_temp_id);
			product1.add(temp_product);
		}
		request.setAttribute("get_cart_product_for_address", product1);
	}
}