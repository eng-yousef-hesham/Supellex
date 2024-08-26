package com.supellex.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.supellex.entity.product;
import com.supellex.model.productmodel;
import com.supellex.model.wishlistmodel;

/**
 * Servlet implementation class shopdetail
 */
@WebServlet("/shopdetail_controller")
public class shopdetail_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/project")
	private DataSource datasource1;

	public shopdetail_controller() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int item = 0;
		if (request.getParameter("item") != null) {
			item = Integer.parseInt(request.getParameter("item"));
		}
		String page = request.getParameter("page");
		if (page == null) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		if (request.getSession().getAttribute("login_user") != null && request.getParameter("item") != null) {
			
			int userid = (Integer)request.getSession().getAttribute("login_user");
			System.out.println(userid);
			test_if_the_product_in_widhlist(request, response, userid, item);
			
			
		}
		page = page.toLowerCase();
		switch (page) {
		case ("shopdetail"):
			get_product(request, response);
			if (item != 0) {
				get_detail_product(request, response, item);
			}
			get_items_photo(request, response);
			request.getRequestDispatcher("shopdetail.jsp").forward(request, response);
			break;
		default:
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	private void get_detail_product(HttpServletRequest request, HttpServletResponse response, int item_id)
			throws ServletException, IOException {
		product product5 = new productmodel().get_product_by_id(datasource1, item_id);
		request.setAttribute("get_product_by_id", product5);
	}

	private void get_product(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<product> product3 = new ArrayList<>();
		product3 = new productmodel().get_Just_Arrived_product(datasource1);
		request.setAttribute("get_product", product3);

	}

	private void get_items_photo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<Integer, String[]> photo = new HashMap<Integer, String[]>();
		photo = new productmodel().get_product_poto(datasource1);

		request.setAttribute("get_product_poto", photo);

	}

	private void test_if_the_product_in_widhlist(HttpServletRequest request, HttpServletResponse response,int userid , int item)
			throws ServletException, IOException {
		
		if(new wishlistmodel().is_product_in_wishlist(datasource1, userid, item)) {
			request.setAttribute("inwishlist", "true");
			System.out.println("meeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
		}

	}

}
