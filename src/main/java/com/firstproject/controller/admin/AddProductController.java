package com.firstproject.controller.admin;

import java.io.IOException;

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

@WebServlet(urlPatterns = { "/admin-addproduct" })
public class AddProductController extends HttpServlet {

	private static final long serialVersionUID = 6877710742647768982L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "USER");
		if (user == null || "customer".equals(user.getUser_authorization()))
			response.sendRedirect(request.getContextPath() + "/web-trang-chu");
		else {
			String state = request.getParameter("state");
			if (state != null) {
				if (state.equals("error")) {
					String message = "Thao tác thất bại!";
					request.setAttribute("smessage", message);
				} else {
					String message = "Thao tác thành công!";
					request.setAttribute("smessage", message);
				}
			}
			String id = request.getParameter("id");
			if (id != null) {
				ProductModel product = ProductDAO.getProductById(Integer.valueOf(id));
				request.setAttribute("product", product);
			}
			String type = request.getParameter("type");
			if (type != null) request.setAttribute("type", "Cập nhật");
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/addProduct.jsp");
			rd.forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
