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

import com.supellex.entity.product;
import com.supellex.model.cartmodel;
import com.supellex.model.productmodel;

@WebServlet("/cart_controller")
public class cart_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/project")
	private DataSource datasource1;

	public cart_controller() {
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
		case ("cart"):
			int user_id = (int) request.getSession().getAttribute("login_user");
			if (request.getParameter("add") != null) {

				int product_id = Integer.parseInt(request.getParameter("add"));
				if (!test_if_item_in_cart(request, response, user_id, product_id)) {
					add(request, response, user_id, product_id);
					System.out.println("done");
				}
			}
			if(request.getParameter("delete")!= null)
			{
				
				int delete_product_id = Integer.parseInt(request.getParameter("delete"));
				delete(request, response, user_id, delete_product_id);
			}
			get_cart_product(request, response, user_id);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
			break;
		default:
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	private void add(HttpServletRequest request, HttpServletResponse response, int user_id, int product_id)
			throws ServletException, IOException {
		new cartmodel().add_to_cart(datasource1, user_id, product_id);

	}
	private void delete(HttpServletRequest request, HttpServletResponse response, int user_id, int product_id)
			throws ServletException, IOException {
		new cartmodel().delete_from_cart(datasource1, user_id, product_id);

	}

	private void get_cart_product(HttpServletRequest request, HttpServletResponse response, int user_id)
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
		request.setAttribute("get_cart_product", product1);
	}

	private boolean test_if_item_in_cart(HttpServletRequest request, HttpServletResponse response, int user_id,
			int product_id) throws ServletException, IOException {
		return new cartmodel().search_for_item_in_cart(datasource1, user_id, product_id);

	}

}
