package tw.wantinglo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/membership/LogoutServlet.do")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	LogoutAction(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	LogoutAction(request,response);
	}


	private void LogoutAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    HttpSession session= request.getSession();
		session.removeAttribute("LoginOK");   
	    session.invalidate(); 
	    response.sendRedirect("http://localhost:8080/HibernateWebProject/membership/Login.jsp");      
	}

}
