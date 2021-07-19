<%@page import="com.base.placement.dao.DateUtil"%>
<%@include file="header.jsp" %>

<body>
		<table id="tabl2">
		<tr>
		    <td width="20%"></td>	
			<td><%if(request.getSession().getAttribute("message")!=null) {%>
			<%=request.getSession().getAttribute("message").toString()%>
		<%}%></td>
		</tr>
		<tr>
		<td>
		<% String action = request.getParameter("action");  
		if("add".equals(action)) {
			List<Company> companyList = CompanyDAO.getAll();
		%> 
		<form method="post" action="action.jsp">
		<table id="tabl1">
		<input type="hidden" name="operation" value="job">
		<input type="hidden" name="action" value="add">
		<tr><td colspan="2">Add Job</td></tr>
		<tr><td> 
				<select name="company" id="company" required="required">
				  <option value="">Company Name</option>
				  <%for(Company cmp : companyList){%>
				  <option value="<%=cmp.getId()%>"><%=cmp.getName()%></option>
				  <%}%>
				 </select>
			</td>
		</tr>
		<tr><td><input type="text" id="name" name="name" placeholder="Job Name" required="required" maxlength="100"></td></tr>
		<tr><td><textarea  id="description" name="description" placeholder="Job Description" width="100px" height="40px" required="required" maxlength="500"></textarea></td></tr>
		<tr><td><input type="text" id="skills" name="skills" placeholder="Skills" maxlength="50"></td></tr>
		<tr><td>  <input type="text"  name="postedDate" id="postedDate" placeholder="Posted Date"/></td></tr>
		<tr><td>  <input type="text"  name="lastDate" id="lastDate" placeholder="Last Date"/></td></tr>
		<tr><td><input type="submit" value="Submit"></td></tr>
		</table>
		</form>
		<%} %>
		
		<% if("update".equals(action)) {
		Job job  = JobDAO.getById(Integer.parseInt(request.getParameter("id")));
		List<Company> companyList = CompanyDAO.getAll();
		//Company company = companyDAO.getCompanyByID(request.getParameter("id"));
		
		%>
		<form method="post" action="action.jsp">
		<table id="tabl1">
		<input type="hidden" name="operation" value="job">
		<input type="hidden" name="id" value="<%=job.getId()%>">
		<input type="hidden" name="action" value="update">
		<tr><td colspan="2">Update Job</td></tr>
		<tr><td> 
				<select name="company" id="company" required="required">
				  <option value="<%=job.getCompanyId()%>"><%=job.getCompanyName()%></option>
				  <%for(Company cmp : companyList){%>
				  <option value="<%=cmp.getId()%>"><%=cmp.getName()%></option>
				  <%}%>
				 </select>
			</td>
		</tr>
		<tr><td><input type="text" id="name" name="name" placeholder="Job Name" required="required" maxlength="100" value="<%=job.getName()%>"></td></tr>
		<tr><td><textarea  id="description" name="description" placeholder="Job Description" width="100px" height="40px" required="required" maxlength="500">value="<%=job.getDescription()%> </textarea></td></tr>
		<tr><td><input type="text" id="skills" name="skills" placeholder="Skills" maxlength="50" value="<%=job.getSkills()%>"></td></tr>
		<tr><td>  <input type="text"  name="postedDate" id="postedDate" placeholder="Posted Date" value="<%= job.getPostedDate() != null ? DateUtil.formatDate(job.getPostedDate()) : "" %>"/></td></tr>
		<tr><td>  <input type="text"  name="lastDate" id="lastDate" placeholder="Last Date" value="<%= job.getLastDate() != null ? DateUtil.formatDate(job.getLastDate()) : "" %>"/></td></tr>
		<tr><td> 
				<select name="status" id=""status"" required="required">
				  <option value="<%=job.getStatus()%>"><%=job.getStatus()%></option>
				  <option value="A">A</option>
				  <option value="D">D</option>
				 </select>
			</td>
		</tr>	
		<tr><td><input type="submit" value="Submit"></td></tr>
		</table>
		</form>
		
		<%} %>
		</td>
		<td>
		

		<table id="tabl1">
		<tr><td><a href="job.jsp?action=add">Add Job</a><td colspan="4"><a href="job.jsp">Hide Add/Update Job form</a></td></tr>
		<% List<Job> jobList = JobDAO.getAll(); 
		    if(jobList!=null && jobList.size()>0){
		%>
		<tr><th>Company Name</th><th>Job Name</th><th>Job Status</th><th>Job Description</th><th>Skills</th><th>Posted Date</th><th>Last Date</th>
			<th>Update</th>
		</tr>
		<%		    	
			for(Job job : jobList) {
		%>
			<tr><td><%=job.getCompanyName()%></td>
			<td><%=job.getName()%></td>
			<td><%=job.getStatus()%></td>
			<td><%=job.getDescription()%></td><td><%=job.getSkills()%></td>
			<td><%= job.getPostedDate() != null ? DateUtil.formatDate(job.getPostedDate()) : "" %></td>
			<td><%= job.getLastDate() != null ? DateUtil.formatDate(job.getLastDate()) : ""%></td>
			<td><a href="job.jsp?action=update&id=<%=job.getId()%>">Update</a></td>
			</tr>
		<%}} else {%>
		<h4>No Jobs available, please add new jobs in list </h4>
		<%}%> 
		
		</table>
		</td>
		</tr>
		</table>	
</body>
</html>