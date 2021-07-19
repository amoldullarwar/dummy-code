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
		
		#tabl2 {
		width: 90%;
		}
    </style>
</head>

<body>

<%if(request.getSession().getAttribute("message")!=null) {%>
	<%=request.getSession().getAttribute("message").toString()%>
<%}%>
<table id="tabl2">
<tr height="80%"><td width="30%" ><td>
<form id="register" action="action.jsp" method="post" >	
			<input type="hidden" name="operation" value="register"/>
			<table id="tabl1" width="30%">
				<tr>
				<th><a href="login.jsp">Sign In</a></th>
				<th><a href="register.jsp">Sign Up</a></th>
				</tr>
				<tr><td><input type="text" id="firstName" name="firstName" placeholder="First name" required="required" maxlength="50"></td>
					<td><input type="text" id="lastName" name="lastName" placeholder="Last name" required="required" maxlength="50"></td>
				</tr>
				<tr><td colspan="2"><input type="email" id="email" name="email" placeholder="Email" required="required" maxlength="50" ></td></tr>
				<tr><td><input type="password" id="password" name="password" placeholder="Password" required="required" maxlength="50"></td>
					<td><input type="password" id="confirm" name="confirm" placeholder="Confirm" required="required" maxlength="50"></td>
				</tr>
				<tr><td colspan="2"><input type="submit" value="Submit"></td></tr>
				
			</table>	
			
</form>
</td>
</tr>
</table>
</body>
</html>