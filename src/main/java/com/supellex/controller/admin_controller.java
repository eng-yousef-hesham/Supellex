package com.supellex.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.FileUtils;

import com.supellex.model.productmodel;


@WebServlet("/admin_controller")
@MultipartConfig
public class admin_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/project")
	private DataSource datasource1;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getSession().getAttribute("isadmin") == null)
		{
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}
		String page = request.getParameter("page");
		if (page == null) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}
		page = page.toLowerCase();
		switch (page) {
		case ("admin"):
			request.getRequestDispatcher("admin.jsp").forward(request, response);
			break;

		default:
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	String	product_name = request.getParameter("product_name");
	int	product_price = Integer.parseInt(request.getParameter("product_price"));
	String	category = request.getParameter("category");
	String	description = request.getParameter("description");
	int rate = Integer.parseInt(request.getParameter("rate"));
	int product_discount = Integer.parseInt(request.getParameter("product_discount"));
	
	

	
	new productmodel().insert_product(datasource1, product_name, product_price, category, description,rate,product_discount);
	response.sendRedirect(request.getContextPath()+"/admin_photo_controller?page=admin_photo");
	//request.getRequestDispatcher("admin_photo.jsp").forward(request, response);
	return;

	}

}
