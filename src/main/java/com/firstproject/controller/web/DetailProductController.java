package com.firstproject.controller.web;

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
import com.firstproject.model.UserModel;
import com.firstproject.util.SessionUtil;

@WebServlet(urlPatterns = {"/web-detailproduct"})
public class DetailProductController extends HttpServlet{

	private static final long serialVersionUID = -6516488365162395464L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer prod_id = Integer.valueOf(request.getParameter("id"));
		ProductModel product = ProductDAO.getProductById(prod_id);
		request.setAttribute("product", product);
		
		UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "USER");
		request.setAttribute("USER", user);
		ArrayList<ProductModel> products = ProductDAO.getAllProductsAtDistance(0, 4);
		request.setAttribute("products", products);
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/detailproduct.jsp");
		rd.forward(request, response);
	}

}
