package com.firstproject.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.firstproject.DAO.ProductDAO;
import com.firstproject.model.ProductModel;

@WebServlet(urlPatterns = {"/admin-editproducts"})
public class EditProductsController extends HttpServlet {

	private static final long serialVersionUID = 6877710742647768982L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		if (type != null && "delete".equals(type)) {
			ProductDAO.deleteProductById(Integer.valueOf(request.getParameter("id")));
		}
		ArrayList<ProductModel> products = ProductDAO.getAllProducts();
		request.setAttribute("products", products);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/editProducts.jsp");
		rd.forward(request, response);
	}
	
}
