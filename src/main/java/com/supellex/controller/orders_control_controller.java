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

import com.supellex.entity.address;
import com.supellex.entity.product;
import com.supellex.entity.user;
import com.supellex.model.checkoutmodel;
import com.supellex.model.orders_controlmodel;
import com.supellex.model.productmodel;
import com.supellex.model.usertableModel;


@WebServlet("/orders_control_controller")
public class orders_control_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/project")
	private DataSource datasource1;   
    
    public orders_control_controller() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession().getAttribute("isadmin") == null)
		{
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}
		
		
		String page = request.getParameter("page");
		if (page == null) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
		
		
		
		if (request.getParameter("delete") != null) {
			int delete_id =Integer.parseInt(request.getParameter("delete"));
			new orders_controlmodel().delete_items_from_order_by_userid(datasource1, delete_id);
		}
		
		
		
		page = page.toLowerCase();
		
		switch (page) {
		
		case ("orderscontrol"):
			get_order(request,response);
			
			
			request.getRequestDispatcher("orders_control.jsp").forward(request, response);
			break;
		default:
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	private void get_order(HttpServletRequest request, HttpServletResponse response)
	{
	List<Integer> ids = 	new orders_controlmodel().get_users_id_from_orders(datasource1);
	Map<Integer, List<product>> map = new HashMap<>();
	List<user> users = new ArrayList<user>();
	List<address> address = new ArrayList<address>();
	for(int i = 0 ; i<ids.size();i++)
	{
		System.out.println(ids.get(i));
		List<Integer> items = new orders_controlmodel().get_items_from_order_by_userid(datasource1, ids.get(i));
		List<address> address2 = new checkoutmodel().get_address_by_user_id(datasource1, ids.get(i));
		System.out.println(address2.get(0).getAddress1());
		address.add(address2.get(0));
		int size2  = items.size();
		List<product> product2 = new ArrayList<product>();
		for(int t = 0;t<size2 ; t++)
		{
			product2.add( new productmodel().get_product_by_id(datasource1, items.get(t)));
		}
		
		map.put(ids.get(i),product2 );
		users.add(new usertableModel().get_user_by_userid(datasource1, ids.get(i)));
		
		
	}
	//System.out.println(map.get(32));
	request.setAttribute("ids_from_order", ids);
	request.setAttribute("products_from_order", map);
	request.setAttribute("user_from_order", users);
	request.setAttribute("address_from_order", address);
	
	}

}
