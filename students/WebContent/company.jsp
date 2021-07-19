<%@include file="header.jsp" %>
<body>

	<table id="tabl2">
		<tr>
			<td colspan="2"><%if(request.getSession().getAttribute("message")!=null) {%>
			<%=request.getSession().getAttribute("message").toString()%>
		<%}%></td>
		</tr>
		<tr>
		<td width="20%">
		<% String action = request.getParameter("action");  
		if("add".equals(action)) {%>
		<form method="post" action="action.jsp">
		<table id="tabl1">
		<input type="hidden" name="operation" value="company">
		<input type="hidden" name="action" value="add">
		<tr><td colspan="2">Add Company</td></tr>
		<tr><td><input type="text" id="name" name="name" placeholder="Company name" required="required" maxlength="100"></td></tr>
		<tr><td><input type="text" id="address" name="address" placeholder="Company Address" required="required"></td></tr>
		<tr><td><textarea  id="description" name="description" placeholder="Company Description" width="100px" height="40px" required="required" maxlength="500"></textarea></td></tr>
		<tr><td><input type="email" id="email" name="email" placeholder="Email" required="required" maxlength="50"></td></tr>
		<tr><td><input type="text" id="website" name="website" placeholder="website" required="required"></td></tr>
		<tr><td><input type="submit" value="Submit"></td></tr>
		</table>
		</form>
		<%} %>
		
		<% if("update".equals(action)) {
		CompanyDAO companyDAO = new CompanyDAO();
		Company company = companyDAO.getCompanyByID(request.getParameter("id"));
		
		%>
		<form method="post" action="action.jsp">
		<table id="tabl1">
		<input type="hidden" name="operation" value="company">
		<input type="hidden" name="id" value="<%=company.getId()%>">
		<input type="hidden" name="action" value="update">
		<tr><td colspan="2">Update Company</td></tr>
		<tr><td><input type="text" id="name" name="name" placeholder="Company name" value="<%=company.getName() %>" required="required" maxlength="100"></td></tr>
		<tr><td><input type="text" id="address" name="address" placeholder="Company Address" value="<%=company.getAddress() %>" required="required"></td></tr>
		<tr><td><textarea  id="description" name="description" placeholder="Company Description" width="100px" height="40px" required="required" maxlength="500"><%=company.getDescription() %></textarea></td></tr>
		<tr><td><input type="email" id="email" name="email" placeholder="Email" required="required" value="<%=company.getEmail()%>" maxlength="50"></td></tr>
		<tr><td><input type="text" id="website" name="website" placeholder="website" value="<%=company.getWebsite()%>" required="required"></td></tr>
		<tr><td><input type="submit" value="Submit"></td></tr>
		</table>
		</form>
		
		<%} %>
		</td>
		<td>
		<table id="tabl1">
		<tr><td><a href="company.jsp?action=add">Add Company</a></td><td colspan="4"><a href="company.jsp">Hide Company Add/Update form</a></td></tr>	
		<tr><th>Company Name</th><th>Company Address</th><th>Description</th>
			<th>Update</th>
		</tr>		
		<% List<Company> cmpList = CompanyDAO.getAll(); 
		    if(cmpList.size()>0){
			for(Company cmp : cmpList) {
		%>
			<tr>
			<td><%=cmp.getName()%></td><td><%=cmp.getAddress()%></td><td><%=cmp.getDescription()%></td>
			<td><a href="company.jsp?action=update&id=<%=cmp.getId()%>">Update</a></td>
			</tr>
		<%}}%>
		</table>
		</td>
		</tr>
		</table>
</body>
</html>