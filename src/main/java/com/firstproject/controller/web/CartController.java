package com.firstproject.controller.web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.firstproject.DAO.CartDAO;
import com.firstproject.DAO.CartDisplayModel;
import com.firstproject.DAO.ProductDAO;
import com.firstproject.model.CartProductModel;
import com.firstproject.model.ProductModel;
import com.firstproject.model.UserModel;
import com.firstproject.util.SessionUtil;

@WebServlet(urlPatterns = {"/web-cart"})
public class CartController extends HttpServlet{

	private static final long serialVersionUID = -6516488365162395464L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "USER");
		String strid = request.getParameter("id");
		if(strid != null) {
			int prodid = Integer.valueOf(strid);
			CartDAO.deleteOneProduct(user.getUser_username(), prodid);
		}
		CartDisplayModel carts = CartDAO.getProductByUsername(user.getUser_username());
		float amount = 0;
		for (CartProductModel product : carts.getProducts()) {
			amount += product.getProd_price() * product.getQuantity();
		}
		request.setAttribute("amount", amount);
		request.setAttribute("carts", carts);
		request.setAttribute("USER", user);
		ArrayList<ProductModel> products = ProductDAO.getAllProductsAtDistance(0, 4);
		request.setAttribute("products", products);
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/cart.jsp");
		rd.forward(request, response);
	}

}
