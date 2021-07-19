<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Placement</title>
<style>
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
		
		#tabl3 {
		width: 90%;
		}
    </style>
</head>
<body>	
	<%if(request.getSession().getAttribute("message")!=null) {%>
	<%=request.getSession().getAttribute("message").toString()%>
<%}%>
<table id="tabl3">
<tr height="80%"><td width="30%" ><td>
			<form action="action.jsp" method="post">
			<input type="hidden" name="operation" value="login"/>
			<table id="tabl1">
				<tr><th>Sign In</th><th><a href="register.jsp">Sign Up</a></th></tr>
				<tr><td colspan="2"><input type="email" id="email" name="email" placeholder="Email" required="required" maxlength="50"></td></tr>
				<tr><td colspan="2"><input type="password" id="password" name="password" placeholder="Password" required="required" maxlength="50"></td></tr>
				<tr><td colspan="2"><input type="submit" value="Log In"></td></tr>

			</table>
			</form>
</td></tr>
</table>			
</body>
</html>