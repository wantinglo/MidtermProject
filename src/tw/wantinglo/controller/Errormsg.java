package tw.wantinglo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/membership/errormsg.do")
public class Errormsg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LinkedList<String> ERROR_MSG = (LinkedList<String>)request.getAttribute("errormsg");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write(ERROR_MSG.get(0));
		out.write("3秒後請重新登入");
		response.setHeader("refresh", "3;URL=http://localhost:8080/HibernateWebProject/membership/Login.jsp");
//		response.sendRedirect("http://localhost:8080/JspProject/membership/membership_vertified.jsp");
//		//RequestDispatcher rd = request.getRequestDispatcher("/membership_vertified.jsp");
//		//rd.forward(request, response);
	}

}
