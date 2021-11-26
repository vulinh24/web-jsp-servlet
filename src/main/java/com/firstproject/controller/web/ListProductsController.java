package com.firstproject.controller.web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.firstproject.DAO.CategoryDAO;
import com.firstproject.DAO.ProductDAO;
import com.firstproject.model.CategoryModel;
import com.firstproject.model.ProductModel;

@WebServlet(urlPatterns = { "/web-list-products" })
public class ListProductsController extends HttpServlet {

	private static final long serialVersionUID = 9015671225926994986L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryModel> categorys = CategoryDAO.getAll();
		request.setAttribute("categorys", categorys);
		int cate_id;
		String Cate_id = request.getParameter("cateid");
		if (Cate_id == null) {
			cate_id = 1;
		} else {
			cate_id = Integer.valueOf(Cate_id);
		}
		request.setAttribute("cateid", cate_id);
		int page;
		String strpage = request.getParameter("page");
		if (strpage == null) page = 0;
		else {
			page = Integer.valueOf(request.getParameter("page")) - 1;
		}
		ArrayList<ProductModel> products = ProductDAO.getAllProductsByCatelogy(page*12, 12, cate_id);
		request.setAttribute("products", products);
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/listproducts.jsp");
		rd.forward(request, response);
	}

}
