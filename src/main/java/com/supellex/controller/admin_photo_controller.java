package com.supellex.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.catalina.ant.FindLeaksTask;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import com.supellex.model.productmodel;


@WebServlet("/admin_photo_controller")
@MultipartConfig
public class admin_photo_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/project")
	private DataSource datasource1;
  
    public admin_photo_controller() {
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
			return;
		}
		page = page.toLowerCase();
		switch (page) {
		case ("admin_photo"):
			request.getRequestDispatcher("admin_photo.jsp").forward(request, response);
			break;

		default:
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
		
		int x = new productmodel().get_last_product(datasource1);
		
		try {
			List<FileItem> images = upload.parseRequest(request);
			int counter = 0;
			for(FileItem image : images)
			{	
				String name = image.getName();
				boolean flag=false;
				if(name.isEmpty())
				{
					 flag=true;
				}
				try{name = name.substring(name.lastIndexOf("\\")+1);}catch(Exception e) {}
				
				//photo name after edit
				name = "id_"+x+"_photo"+counter+"_"+name;	
				if(flag)
				{
					name = "nothing.png";
				}
				//photo path
				String path1 = getServletContext().getRealPath("product_imgs")+File.separator+name;
				File file1 = new File(path1);
				image.write(file1);
				new productmodel().insert_product_photo(datasource1, x, name);
				counter++;
				System.out.println(path1);
			}
			
			
		} catch (Exception e) {
			
			
			e.printStackTrace();
		}
		
		
		
		System.out.println(x);
		response.sendRedirect(request.getContextPath()+"/admin_controller?page=admin");
	}

}
