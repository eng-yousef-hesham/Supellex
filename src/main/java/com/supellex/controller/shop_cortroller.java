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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.supellex.entity.product;
import com.supellex.model.productmodel;

@WebServlet("/shop_cortroller")
public class shop_cortroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/project")
	private DataSource datasource1;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int price = 0;
		if (request.getParameter("price") != null) {
			price = Integer.parseInt(request.getParameter("price"));
		}
		String categ = "all";
		if (request.getParameter("categ") != null) {
			categ = request.getParameter("categ");
		}
		System.out.println(categ);
		categ = categ.toLowerCase();

		String page = request.getParameter("page");
		if (page == null) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		page = page.toLowerCase();
		switch (page) {
		case ("shop"):
			get_product(request, response);
			get_items_photo(request,response);
			List<product> product3 = (List) request.getAttribute("get_product");
			int sizee2 = product3.size();
			// price filter
			price_filter(request, response, price, sizee2, product3);

			// categorie filter
			categorie_filter(request, response, categ);

			// get by name
			if(request.getParameter("name") != null)
			{
				String name = request.getParameter("name");
				get_by_name(request, response, name);
			}
			
			request.getRequestDispatcher("shop.jsp").forward(request, response);
			break;

		default:
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	private void get_product(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<product> product3 = new ArrayList<>();
		product3 = new productmodel().get_product(datasource1);
		request.setAttribute("get_product", product3);

	}

	private void price_filter(HttpServletRequest request, HttpServletResponse response, int price, int sizee2,
			List<product> product3) throws ServletException, IOException {
		List<product> product4 = new ArrayList<product>();
		if (price == 100) {

			for (int i = 0; i < sizee2; i++) {
				if (product3.get(i).getPrice() <= 100 && product3.get(i).getPrice() > 0) {
					product4.add(new product(product3.get(i).getIdproduct(), product3.get(i).getPrice(),
							product3.get(i).getDescription(), product3.get(i).getProduct_titel(),
							product3.get(i).getProduct_rate(), product3.get(i).getCategory(),
							product3.get(i).getAdding_date(), product3.get(i).getdiscount()));
				}
			}
		} else if (price == 200) {

			for (int i = 0; i < sizee2; i++) {
				if (product3.get(i).getPrice() <= 200 && product3.get(i).getPrice() > 100) {
					product4.add(new product(product3.get(i).getIdproduct(), product3.get(i).getPrice(),
							product3.get(i).getDescription(), product3.get(i).getProduct_titel(),
							product3.get(i).getProduct_rate(), product3.get(i).getCategory(),
							product3.get(i).getAdding_date(), product3.get(i).getdiscount()));
				}
			}

		} else if (price == 300) {

			for (int i = 0; i < sizee2; i++) {
				if (product3.get(i).getPrice() <= 300 && product3.get(i).getPrice() > 200) {
					product4.add(new product(product3.get(i).getIdproduct(), product3.get(i).getPrice(),
							product3.get(i).getDescription(), product3.get(i).getProduct_titel(),
							product3.get(i).getProduct_rate(), product3.get(i).getCategory(),
							product3.get(i).getAdding_date(), product3.get(i).getdiscount()));
				}
			}

		} else if (price == 400) {

			for (int i = 0; i < sizee2; i++) {
				if (product3.get(i).getPrice() <= 400 && product3.get(i).getPrice() > 300) {
					product4.add(new product(product3.get(i).getIdproduct(), product3.get(i).getPrice(),
							product3.get(i).getDescription(), product3.get(i).getProduct_titel(),
							product3.get(i).getProduct_rate(), product3.get(i).getCategory(),
							product3.get(i).getAdding_date(), product3.get(i).getdiscount()));
				}
			}

		} else if (price == 500) {

			for (int i = 0; i < sizee2; i++) {
				if (product3.get(i).getPrice() <= 500 && product3.get(i).getPrice() > 400) {
					product4.add(new product(product3.get(i).getIdproduct(), product3.get(i).getPrice(),
							product3.get(i).getDescription(), product3.get(i).getProduct_titel(),
							product3.get(i).getProduct_rate(), product3.get(i).getCategory(),
							product3.get(i).getAdding_date(), product3.get(i).getdiscount()));
				}
			}

		} else if (price == 600) {

			for (int i = 0; i < sizee2; i++) {
				if (product3.get(i).getPrice() > 500) {
					product4.add(new product(product3.get(i).getIdproduct(), product3.get(i).getPrice(),
							product3.get(i).getDescription(), product3.get(i).getProduct_titel(),
							product3.get(i).getProduct_rate(), product3.get(i).getCategory(),
							product3.get(i).getAdding_date(), product3.get(i).getdiscount()));
				}
			}

		}
		if (price != 0) {
			request.setAttribute("get_product", product4);
			HttpSession sprice = request.getSession();
			sprice.setAttribute("get_price", price);
		}

		System.out.println(request.getSession().getAttribute("get_price"));

	}

	private void categorie_filter(HttpServletRequest request, HttpServletResponse response, String categ)
			throws ServletException, IOException {
		List<product> product3 = (List) request.getAttribute("get_product");
		List<product> product4 = new ArrayList<product>();
		int sizee2 = product3.size();
		if (categ.equals("chairs")) {

			for (int i = 0; i < sizee2; i++) {
				if (product3.get(i).getCategory().equals("chairs")) {
					product4.add(new product(product3.get(i).getIdproduct(), product3.get(i).getPrice(),
							product3.get(i).getDescription(), product3.get(i).getProduct_titel(),
							product3.get(i).getProduct_rate(), product3.get(i).getCategory(),
							product3.get(i).getAdding_date(), product3.get(i).getdiscount()));
				}
			}
		} else if (categ.equals("sofa")) {

			for (int i = 0; i < sizee2; i++) {
				if (product3.get(i).getCategory().equals("sofa")) {
					product4.add(new product(product3.get(i).getIdproduct(), product3.get(i).getPrice(),
							product3.get(i).getDescription(), product3.get(i).getProduct_titel(),
							product3.get(i).getProduct_rate(), product3.get(i).getCategory(),
							product3.get(i).getAdding_date(), product3.get(i).getdiscount()));
				}
			}

		} else if (categ.equals("tables")) {

			for (int i = 0; i < sizee2; i++) {
				if (product3.get(i).getCategory().equals("tables")) {
					product4.add(new product(product3.get(i).getIdproduct(), product3.get(i).getPrice(),
							product3.get(i).getDescription(), product3.get(i).getProduct_titel(),
							product3.get(i).getProduct_rate(), product3.get(i).getCategory(),
							product3.get(i).getAdding_date(), product3.get(i).getdiscount()));
				}
			}

		} else if (categ.equals("storage")) {

			for (int i = 0; i < sizee2; i++) {
				if (product3.get(i).getCategory().equals("storage")) {
					product4.add(new product(product3.get(i).getIdproduct(), product3.get(i).getPrice(),
							product3.get(i).getDescription(), product3.get(i).getProduct_titel(),
							product3.get(i).getProduct_rate(), product3.get(i).getCategory(),
							product3.get(i).getAdding_date(), product3.get(i).getdiscount()));
				}
			}

		} else if (categ.equals("lights")) {

			for (int i = 0; i < sizee2; i++) {
				if (product3.get(i).getCategory().equals("lights")) {
					product4.add(new product(product3.get(i).getIdproduct(), product3.get(i).getPrice(),
							product3.get(i).getDescription(), product3.get(i).getProduct_titel(),
							product3.get(i).getProduct_rate(), product3.get(i).getCategory(),
							product3.get(i).getAdding_date(), product3.get(i).getdiscount()));
				}
			}

		} else if (categ.equals("portraits")) {

			for (int i = 0; i < sizee2; i++) {
				if (product3.get(i).getCategory().equals("portraits")) {
					product4.add(new product(product3.get(i).getIdproduct(), product3.get(i).getPrice(),
							product3.get(i).getDescription(), product3.get(i).getProduct_titel(),
							product3.get(i).getProduct_rate(), product3.get(i).getCategory(),
							product3.get(i).getAdding_date(), product3.get(i).getdiscount()));
				}
			}

		}

		if (!categ.equals("all")) {
			request.setAttribute("get_product", product4);
		}

	}

	private void get_by_name(HttpServletRequest request, HttpServletResponse response,String name)
			throws ServletException, IOException {
		List<product> product5 = new ArrayList<>();
		product5 = new productmodel().get_product_by_name(datasource1,name);
		request.setAttribute("get_product", product5);
		
		

	}
	private void get_items_photo(HttpServletRequest request, HttpServletResponse response)
	{
		Map<Integer,String[]> photo = new HashMap<Integer,String[]>();
		photo = new productmodel().get_product_poto(datasource1);
		
		
		request.setAttribute("get_product_poto", photo);
		
	}
}
