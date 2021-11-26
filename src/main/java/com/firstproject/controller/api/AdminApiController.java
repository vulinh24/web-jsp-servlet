package com.firstproject.controller.api;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.firstproject.DAO.ProductDAO;
import com.firstproject.model.ProductModel;
import com.firstproject.util.HttpUtil;

@WebServlet(urlPatterns = {"/api-admin"})
public class AdminApiController extends HttpServlet {

	private static final long serialVersionUID = 2906204444468522011L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductModel productModel = new ProductModel();
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		try { 
			productModel = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
			ProductDAO.addProduct(productModel);
			mapper.writeValue(response.getOutputStream(),productModel); // ajax in client go to success 
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ObjectMapper objm = new ObjectMapper();
		try {
			ProductModel product = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
			ProductModel res = ProductDAO.updateProductById(product);
			objm.writeValue(response.getOutputStream(),res);
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ObjectMapper objm = new ObjectMapper();
		try {
			ProductModel product = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
			int res = ProductDAO.deleteProductById(product.getProd_id());
			if (res != 0)
				objm.writeValue(response.getOutputStream(),product);
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
	}

}
