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


@WebServlet("/wishlist_controller")
public class wishlist_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/project")
	private DataSource datasource1;
    
    public wishlist_controller() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String page = request.getParameter("page");
		if (page == null) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
		if (request.getSession().getAttribute("login_user") == null) {
			response.sendRedirect(request.getContextPath() + "/login_controller?page=login&error=Login First");
			return;
		}
		
		if(request.getParameter("item_id") != null)
		{
			int item_id = Integer.parseInt(request.getParameter("item_id"));
			add_to_wishlist(request, response, item_id);
			response.sendRedirect(request.getContextPath()+"/shopdetail_controller?page=shopdetail&item="+item_id);
			System.out.println("qweqweqwe");
			return;
		}
		
		
		page = page.toLowerCase();
		switch (page) {
		case ("wishlist"):
			
			get_wishlist_product(request, response);
			get_items_photo(request, response);
			request.getRequestDispatcher("wishlist.jsp").forward(request, response);

			break;
		
		default:
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
	
	private void add_to_wishlist(HttpServletRequest request, HttpServletResponse response,int product_id)throws ServletException, IOException
	{
		int user_id = (int) request.getSession().getAttribute("login_user");
		new wishlistmodel().add_to_wishlist(datasource1, user_id, product_id);
	}
	private void get_wishlist_product(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		int user_id = (int) request.getSession().getAttribute("login_user");
		List<Integer>products = new wishlistmodel().wishlist_products(datasource1, user_id);
		int size = products.size();
		List<product> product2 = new ArrayList<product>();
		for(int i=0;i<size;i++)
		{
			product2.add(new productmodel().get_product_by_id(datasource1, products.get(i)));
		}
		request.setAttribute("products", product2);
	}
	private void get_items_photo(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		
		Map<Integer,String[]> photo = new HashMap<Integer,String[]>();
		photo = new productmodel().get_product_poto(datasource1);
		
		
		request.setAttribute("get_product_poto", photo);
		System.out.println("wwqqwwaas");
		
	}

}
