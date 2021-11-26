package com.firstproject.controller.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.firstproject.DAO.UserDAO;
import com.firstproject.model.UserModel;
import com.firstproject.util.SessionUtil;

@WebServlet(urlPatterns = { "/login" })
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 184636107109297749L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error = null;
		error = request.getParameter("error");
		if (error != null) {
			String message = "Tên đăng nhập hoặc mật khẩu không hợp lệ!";
			request.setAttribute("message", message);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/login.jsp");
		rd.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_username = request.getParameter("username");
		String user_password = request.getParameter("password");
		UserModel userModel = UserDAO.getUser(user_username, user_password);
		if (userModel == null) {
			response.sendRedirect(request.getContextPath() + "/login?error=error");
		}
		else {
			SessionUtil.getInstance().addValue(request, "USER", userModel);
			if (userModel.getUser_authorization().equals("admin")) {
				response.sendRedirect(request.getContextPath() + "/admin-addproduct");
			}
			else {
				response.sendRedirect(request.getContextPath() + "/web-trang-chu");
			}
		}
	}
}
