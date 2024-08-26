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

import com.supellex.entity.*;
import com.supellex.model.productmodel;

@WebServlet("/home")
public class home_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/project")
	private DataSource datasource1;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String page = request.getParameter("page");
		if (page == null) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
		
			
		page = page.toLowerCase();
		switch (page) {
		case ("home"):
			request.setAttribute("validindexjsp", "valid");
			get_trandy_products(request, response);
			get_Just_Arrived_products(request, response);
			get_items_photo(request, response);
			request.getRequestDispatcher("index.jsp").forward(request, response);

			break;
			
		default:
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}

	}

	private void get_trandy_products(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<product> product1 = new ArrayList<>();
		product1 = new productmodel().get_trandy_product(datasource1);
		request.setAttribute("trandy_products", product1);
		return;

	}
	private void get_Just_Arrived_products(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		List<product> product2 = new ArrayList<>();
		product2 = new productmodel().get_Just_Arrived_product(datasource1);
		request.setAttribute("Just_Arrived_product", product2);
		return;
		
	}
	private void get_items_photo(HttpServletRequest request, HttpServletResponse response)
	{
		Map<Integer,String[]> photo = new HashMap<Integer,String[]>();
		photo = new productmodel().get_product_poto(datasource1);
		
		
		request.setAttribute("get_product_poto", photo);
	}

}
