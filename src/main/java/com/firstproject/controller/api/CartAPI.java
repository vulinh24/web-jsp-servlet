package com.firstproject.controller.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.firstproject.DAO.CartDAO;
import com.firstproject.model.CartModel;
import com.firstproject.util.HttpUtil;

@WebServlet(urlPatterns = {"/api-cart"})
public class CartAPI extends HttpServlet {

	private static final long serialVersionUID = 8830171546749421278L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ObjectMapper objm = new ObjectMapper();
		try {
			CartModel cart = HttpUtil.of(request.getReader()).toModel(CartModel.class);
			int res = CartDAO.addOneProduct(cart);
			if (res == 1) {
				objm.writeValue(response.getOutputStream(),cart);
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
	}
	
}
