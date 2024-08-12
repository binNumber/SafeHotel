package com.app.utiil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginManager {
	private static final String SESSION_LOGIN_ID = "loginUserId";

	public static void setSessionLogin(String id, HttpSession session) {
		session.setAttribute(SESSION_LOGIN_ID, id);
	}

	public static void setSessionLogin(String id, HttpServletRequest request) {
		setSessionLogin(id, request.getSession());
	}

	public static boolean isLogin(HttpSession session) {
		if (session != null && session.getAttribute(SESSION_LOGIN_ID) != null) {
			return true;
		}

		return false;
	}

	public static boolean isLogin(HttpServletRequest request) {
		return isLogin(request.getSession());
	}

	public static String getLoginUserId(HttpSession session) {
		if (session != null) {
			return (String) session.getAttribute(SESSION_LOGIN_ID);
		}
		return null;
	}

	public static void logout(HttpSession session) {
		session.invalidate();
	}

	public static void logout(HttpServletRequest request) {
		logout(request.getSession());
	}
}
