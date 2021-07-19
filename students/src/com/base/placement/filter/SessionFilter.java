package com.base.placement.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession(false);
		
		String requestUrl = req.getRequestURI().substring(req.getRequestURI().lastIndexOf("/"));
		
		//System.out.println(requestUrl);
	    if(!requestUrl.equals("/login.jsp") && !requestUrl.equals("/action.jsp") && !requestUrl.equals("/register.jsp") && session.getAttribute("user") ==null) 
			resp.sendRedirect("login.jsp");
	    else 
	    	chain.doFilter(request, response);//sends request to next resource  
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
