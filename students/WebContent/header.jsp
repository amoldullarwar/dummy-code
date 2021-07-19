<%@page import="com.base.placement.model.User"%>
<%@page import="com.base.placement.dao.JobDAO"%>
<%@page import="com.base.placement.model.Job"%>
<%@page import="java.util.List"%>
<%@page import="com.base.placement.dao.CompanyDAO"%>
<%@page import="com.base.placement.model.Company"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Placement</title>
	<link rel="stylesheet" href="css/jquery-ui.css">
    <script src="js/jquery-1.12.4.js"></script>
    <script src="js/jquery-ui.js"></script>

    <script>
        $(function () {
            $("#postedDate").datepicker();
        });
        $(function () {
            $("#lastDate").datepicker();
        });
    </script>
    <style>
    	body {
    		background: #f7ff78d9;
    	}
    	
    	#tabl1 tr:nth-child(even) {
		  background-color: #eee;
		}
		#tabl1 tr:nth-child(odd) {
		  background-color: #fff;
		}
		#tabl1 th {
		  color: white;
		  background-color: #990000;
		}
		
		table {
		  border: 1px solid black;
		}
		
		#tabl2 {
		width: 90%;
		}
    </style>
    
</head>
<body>
<table id="tabl2">
<% User user = ((User)session.getAttribute("user"));
if(user==null) 
	response.sendRedirect("login.jsp");
if(user!=null && user.getRole()==1){%>
<tr><td width="10%"></td><td width="70%">|<a href="index.jsp"> Home </a>|<a href="education.jsp"> Education </a>|<a href="jobapplication.jsp"> Job To Apply </a></td><td width="20%">Welcome <%=user.getFirstName() %> | <a href="action.jsp?operation=logout"> Logout </a>|</td></tr>
<%} else {%>
<tr><td width="10%"></td><td width="70%">|<a href="index.jsp"> Home </a>|<a href="company.jsp">Company</a> |<a href="job.jsp"> Job </a></td><td width="20%"><%if(user!=null){%>Welcome <%=user.getFirstName()%> | <a href="action.jsp?operation=logout"> Logout </a> <%}%> </td></tr>
<%}%>
</table>
