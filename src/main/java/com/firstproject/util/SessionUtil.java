package com.firstproject.util;

import javax.servlet.http.HttpServletRequest;

import com.firstproject.model.UserModel;

public class SessionUtil {
	public static SessionUtil sessionUtil = null;

	public SessionUtil() {
	}

	public static SessionUtil getInstance() {
		if (sessionUtil != null) return sessionUtil;
		else {
			sessionUtil = new SessionUtil();
			return sessionUtil;
		}
	}
	
	public void addValue(HttpServletRequest request, String name, Object value) {
		request.getSession().setAttribute(name, value);
	}
	
	public Object getValue(HttpServletRequest request, String name) {
		return request.getSession().getAttribute(name);
	}
	
	public void removeValue(HttpServletRequest request, String name) {
		request.getSession().removeAttribute(name);
	}
}
