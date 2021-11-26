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

@WebServlet(urlPatterns = { "/web-trang-chu" })
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 184636107109297749L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "USER");
		ArrayList<ProductModel> products = null;
		products = ProductDAO.getAllProductsByCatelogy(0, 10, 1);
		request.setAttribute("products", products);
		if (user ==null || "customer".equals(user.getUser_authorization())) {
			String type = request.getParameter("type");
			if (type != null && type.equals("logout"))
				SessionUtil.getInstance().removeValue(request, "USER");
			RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
			rd.forward(request, response);
		} else {
			String type = request.getParameter("type");
			if (type != null && type.equals("logout")) {
				SessionUtil.getInstance().removeValue(request, "USER");
				response.sendRedirect(request.getContextPath() + "/web-trang-chu");
			}
			else {
				response.sendRedirect(request.getContextPath() + "/admin-addproduct");
			}
		}
	}

}
