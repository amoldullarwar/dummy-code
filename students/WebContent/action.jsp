<%@page import="java.util.Date"%>
<%@page import="com.base.placement.model.JobApplication"%>
<%@page import="com.base.placement.dao.JobApplicationDAO"%>
<%@page import="com.base.placement.dao.EducationDetaillDAO"%>
<%@page import="com.base.placement.model.EducationDetails"%>
<%@page import="com.base.placement.dao.DateUtil"%>
<%@page import="com.base.placement.model.Job"%>
<%@page import="com.base.placement.dao.JobDAO"%>
<%@page import="com.base.placement.model.Company"%>
<%@page import="com.base.placement.dao.CompanyDAO"%>
<%@page import="com.base.placement.dao.UserDAO"%>
<%@page import="com.base.placement.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String operation = request.getParameter("operation");

	if("logout".equals(operation)) {
		session.invalidate();
		response.sendRedirect("login.jsp");
	}
		

	
	if("register".equals(operation)) {				// User Registration Actions 
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lasttName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");
		
		UserDAO userDao = new UserDAO();
		User user = new User();
		
		if(!password.equals(confirm)) {
			request.getSession().setAttribute("message", "Password and Confirm Password not matching");
			response.sendRedirect("register.jsp");
		} else if(userDao.getByEmail(email)!=null) {
			request.getSession().setAttribute("message", "User with email id :" + email+ " already registered, try another email id");
			response.sendRedirect("register.jsp");
		} else {
			user.setEmail(email);
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setRole(1);
			user.setPassword(password);
			user.setStatus("A");
			userDao.register(user);	
			session.setAttribute("message","<h3>User registered successfully, login by using Sing In link</h3>");
			response.sendRedirect("register.jsp");
		}
	} else if ("login".equals(operation)){   			// User Login Action 
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserDAO userDao = new UserDAO();
		User user = userDao.getByEmail(email);
		System.out.println("in Action " + user);
		if(user==null) {
			session.setAttribute("message","<h4>User not exist with email id :" + email+" check email id correct or register new user</h4>");
			response.sendRedirect("login.jsp");
		} else if(user!=null && !user.getPassword().equals(password)) {
			session.setAttribute("message","<h4>wrong password entered, please try with correct password </h4>");
			response.sendRedirect("login.jsp");	
		} else if(user!=null && user.getPassword().equals(password)) {
			session.setAttribute("user", user);
			response.sendRedirect("index.jsp");
		}
	} else if ("company".equals(operation)){
		
		String action = request.getParameter("action");
		CompanyDAO companyDAO = new CompanyDAO();
		
		
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String description = request.getParameter("description");
		String email = request.getParameter("email");
		String website = request.getParameter("website");

		Company company =  new Company();
		company.setName(name);
		company.setAddress(address);
		company.setDescription(description);
		company.setEmail(email);
		company.setWebsite(website);
		
			if("add".equals(action)) {
				if(companyDAO.getCompanyByName(name)!=null) {
					session.setAttribute("message","<h4>Company with name :" + name+" is already registered, if you want to update details, perform update operation</h4>");
					response.sendRedirect("company.jsp");
				} else {
					companyDAO.add(company);
					session.removeAttribute("message");
					response.sendRedirect("company.jsp");
				}
			} else if("update".equals(action)) {
				String id = request.getParameter("id");
				company.setId(Integer.parseInt(id));
				companyDAO.update(company);
				session.removeAttribute("message");
				response.sendRedirect("company.jsp");
			}


	} else if ("job".equals(operation)){
		String action = request.getParameter("action");
		JobDAO jobDAO = new JobDAO();
		
		String name = request.getParameter("name");
		String companyId = request.getParameter("company");
		String description = request.getParameter("description");
		String skills = request.getParameter("skills");
		String postedDate = request.getParameter("postedDate");
		String lastDate = request.getParameter("lastDate");
		
		
		Job job = new Job();
		job.setCompanyId(Integer.parseInt(companyId));
		job.setName(name);
		job.setDescription(description);
		job.setSkills(skills);
		job.setPostedDate(DateUtil.formatDate(postedDate));
		job.setLastDate(DateUtil.formatDate(lastDate));
		
		if("add".equals(action)){
			job.setStatus("A");
			jobDAO.add(job);
			response.sendRedirect("job.jsp");
		} else if("update".equals(action)){
			String id = request.getParameter("id");
			job.setId(Integer.parseInt(id));
			jobDAO.update(job);
			response.sendRedirect("job.jsp");
		}
	} else if("education".equals(operation)){
		int userId = ((User)session.getAttribute("user")).getId();
		String sscPercentage = request.getParameter("sscPercentage");
		String hscPercentage = request.getParameter("hscPercentage");
		String gradPercentage = request.getParameter("gradPercentage");
		
		String sscSchoolDetails = request.getParameter("sscSchoolDetails");
		String hscCollegeDetails = request.getParameter("hscCollegeDetails");
		String gradCollegeDetails = request.getParameter("gradCollegeDetails");
		
		String hscType = request.getParameter("hscType");
		String gradType = request.getParameter("gradType");
		String skills = request.getParameter("skills");
		
		EducationDetails ed = new EducationDetails();
		
		ed.setUserId(userId);

		if(sscPercentage!=null)
			ed.setSscPercentage(Float.parseFloat(sscPercentage));
		
		if(hscPercentage!=null && !"".equals(hscPercentage.trim()) ) 
			ed.setHscPercentage(Float.parseFloat(hscPercentage));
		
		if(gradPercentage!=null && !"".equals(gradPercentage.trim())) 
			ed.setGradPercentage(Float.parseFloat(gradPercentage));

		if(sscSchoolDetails!=null && !"".equals(sscSchoolDetails.trim()))
			ed.setSscSchoolDetails(sscSchoolDetails);
		
		if(hscCollegeDetails!=null && !"".equals(hscCollegeDetails.trim()))
			ed.setHscCollegeDetails(hscCollegeDetails);
		
		if(gradCollegeDetails!=null && !"".equals(gradCollegeDetails.trim()))
			ed.setGradCollegeDetails(gradCollegeDetails);
		
		if(hscType!=null && !"".equals(hscType.trim())) 
			ed.setHscType(hscType);
		
		if(gradType!=null && !"".equals(gradType.trim())) 
			ed.setGradType(gradType);
		
		if(skills!=null && !"".equals(skills.trim())) 
			ed.setSkills(skills);
		
		String action = request.getParameter("action");
		if("add".equals(action)){
			EducationDetaillDAO.add(ed);
			System.out.print(ed);
			response.sendRedirect("education.jsp");
		} else if("update".equals(action)){
			int id = Integer.parseInt( request.getParameter("id"));
			ed.setId(id);
			EducationDetaillDAO.update(ed);
			response.sendRedirect("education.jsp");
		
		}
	} else if("apply".equals(operation)){
		String jobId = request.getParameter("jobId");
		int userId= ((User)(session.getAttribute("user"))).getId();
		Date applicationDate = new Date();
		
		JobApplication job = new JobApplication();
		job.setApplicationDate(applicationDate);
		job.setApplicationStatus("APPLIED");
		job.setStatus("A");
		job.setUserId(userId);
		job.setJobId(Integer.parseInt(jobId));
		
		JobApplicationDAO.add(job);
		response.sendRedirect("jobapplication.jsp");
	}
%>