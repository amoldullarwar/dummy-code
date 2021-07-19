<%@page import="com.base.placement.dao.DateUtil"%>
<%@include file="header.jsp" %>

<body>
		<table>
				<tr>
		    <td></td>	
			<td>
		<table id="tabl1">

		<% List<Job> jobList = JobDAO.getAllActive(); 
		    if(jobList!=null && jobList.size()>0){
		%>
		<tr><th>Company Name</th><th>Job Name</th><th>Job Description</th><th>Skills</th><th>Posted Date</th><th>Last Date</th>
			<th>Apply</th>
		</tr>
		<%		    	
			for(Job job : jobList) {
		%>
			<tr><td><%=job.getCompanyName()%></td>
			<td><%=job.getName()%></td>
			<td><%=job.getDescription()%></td><td><%=job.getSkills()%></td>
			<td><%= job.getPostedDate() != null ? DateUtil.formatDate(job.getPostedDate()) : "" %></td>
			<td><%= job.getLastDate() != null ? DateUtil.formatDate(job.getLastDate()) : ""%></td>
			
			<td><a href="action.jsp?operation=apply&jobId=<%=job.getId()%>">Apply</a></td>
			
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