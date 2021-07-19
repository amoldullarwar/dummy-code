<%@page import="com.base.placement.model.User"%>
<%@page import="com.base.placement.dao.EducationDetaillDAO"%>
<%@page import="com.base.placement.model.EducationDetails"%>
<%@page import="com.base.placement.model.Constant"%>
<%@include file="header.jsp" %>
<%
	EducationDetails ed = null;
	if(user!=null) {
		ed = EducationDetaillDAO.getByUserId(user.getId());
	}	
%>

<body>

<%if(ed!=null) {%>
	<form id="register" action="action.jsp" method="post" >	
			<input type="hidden" name="operation" value="education"/>
			<input type="hidden" name="action" value="update"/>
			<input type="hidden" name="id" value="<%=ed.getId()%>"/>
			<table id="tabl1" >
				<tr>
				<th colspan="3">Educational Details</a></th>
				</tr>
				<tr>
					<td>SSC </td>
					<td><input type="number" id="sscPercentage" name="sscPercentage" value="<%=ed.getSscPercentage()%>" step="0.01" min="0" max="100.00"></td>
					<td><input type="text" id="sscSchoolDetails" name="sscSchoolDetails" value="<%=ed.getSccSchoolDetails()%>"></td>
				</tr>
				<tr>
				<td>	HSC <%=ed.getHscType()%>
				</td>
					<td><input type="number" id="hscPercentage" name="hscPercentage" value="<%=ed.getHscPercentage()%>" step="0.01" min="0" max="100.00"></td>
					<td><input type="text" id="hscCollegeDetails" name="hscCollegeDetails" value="<%=ed.getHccCollegeDetails()%>"></td>
				</tr>
				<tr>
				<td>
						GRAD <%=ed.getGradType()%>
				</td>
					<td><input type="number" id="gradPercentage" name="gradPercentage" value="<%=ed.getGradPercentage()%>" step="0.01" min="0" max="100.00"></td>
					<td><input type="text" id="gradCollegeDetails" name="gradCollegeDetails" value="<%=ed.getGradCollegeDetails()%>"></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><input type="text" id="skills" name="skills" value="<%=ed.getSkills()%>"></td>
				</tr>
				<tr><td></td><td colspan="2"> <input type="submit" value="Update"></td></tr>				
			</table>
			</form>
<%} else {%>
<form id="register" action="action.jsp" method="post" >	
			<input type="hidden" name="operation" value="education"/>
			<input type="hidden" name="action" value="add"/>
			<table id="tabl1" width="30%">
				<tr>
				<th colspan="3">Educational Details</a></th>
				</tr>
				<tr>
					<td>SSC </td>
					<td><input type="number" id="sscPercentage" name="sscPercentage" placeholder="SSC % Percentage" required="required" step="0.01" min="0" max="100.00"></td>
					<td><input type="text" id="sscSchoolDetails" name="sscSchoolDetails" placeholder="SSC School" required="required" maxlength="50"></td>
				</tr>
				<tr>
				<td>
						<select name="hscType" id="hscType">
						  <option value="">HSC Stream</option>
						  <%for(String hscTypes : Constant.getHSCTypes()){%>
						  <option value="<%=hscTypes%>"><%=hscTypes%></option>
						  <%}%>
						 </select>
				</td>
					<td><input type="number" id="hscPercentage" name="hscPercentage" placeholder="HSC % Percentage"  step="0.01" min="0" max="100.00"></td>
					<td><input type="text" id="hscCollegeDetails" name="hscCollegeDetails" placeholder="HSC College" maxlength="50"></td>
				</tr>
				<tr>
				<td>
						<select name="gradType" id="gradType">
						  <option value="">Graduation Stream</option>
						  <%for(String gradTypes : Constant.getGRADTypes()){%>
						  <option value="<%=gradTypes%>"><%=gradTypes%></option>
						  <%}%>
						 </select>
				</td>
					<td><input type="number" id="gradPercentage" name="gradPercentage" placeholder="Grad % Percentage" step="0.01" min="0" max="100.00"></td>
					<td><input type="text" id="gradCollegeDetails" name="gradCollegeDetails" placeholder="Graduation College" maxlength="50"></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><input type="text" id="skills" name="skills" placeholder="Skills : C,C++,Java etc" maxlength="50"></td>
				</tr>				
				<tr><td></td><td colspan="2"> <input type="submit" value="Submit"></td></tr>
			</table>	
</form>
<%}%>



</body>
</html>