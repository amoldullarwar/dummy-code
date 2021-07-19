package com.base.placement.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.base.placement.model.EducationDetails;

public class EducationDetaillDAO {
	
	public static boolean add(EducationDetails ed) {

		String insQuery = "INSERT INTO EDUCATION_DETAILS ";

		String insColumn = " (";
		String insValue = " VALUES (";
		
		if(ed.getUserId()!=0) {
			insColumn+= "USER_ID,";
			insValue+="'"+ed.getUserId()+"',";
		} 
		
		if(ed.getSscPercentage()>0) {
			insColumn+= "SSC_PERC,";
			insValue+="'"+ed.getSscPercentage()+"',";
		} 
		
		if(ed.getHscPercentage()>0) {
			insColumn+= " HSC_PERC,";
			insValue+="'"+ed.getHscPercentage()+"',";
		} 
		
		if(ed.getGradPercentage()>0) {
			insColumn+= "GRAD_PERC,";
			insValue+="'"+ed.getGradPercentage()+"',";
		} 

	
		if(ed.getHscType()!=null) {
			insColumn+= " HSC_TYPE,";
			insValue+="'"+ed.getHscType()+"',";
		}
		
		if(ed.getGradType()!=null) {
			insColumn+= " GRAD_TYPE,";
			insValue+="'"+ed.getGradType()+"',";
		}
		
		if(ed.getSccSchoolDetails()!=null) {
			insColumn+= "  SSC_SCHOOL,";
			insValue+="'"+ed.getSccSchoolDetails()+"',";
		}

		if(ed.getHccCollegeDetails()!=null) {
			insColumn+= "   HSC_COLLEGE,";
			insValue+="'"+ed.getHccCollegeDetails()+"',";
		}
		
		if(ed.getGradCollegeDetails()!=null) {
			insColumn+= "   GRAD_COLLEGE,";
			insValue+="'"+ed.getGradCollegeDetails()+"',";
		}
		
		if(ed.getSkills()!=null) {
			insColumn+= "   SKILLS,";
			insValue+="'"+ed.getSkills()+"',";
		}
		
		if(insColumn.lastIndexOf(',')>0) {
			insColumn=insColumn.substring(0,insColumn.lastIndexOf(','))	;
		}
		if(insValue.lastIndexOf(',')>0) {
			insValue=insValue.substring(0,insValue.lastIndexOf(','))	;
		}

		insColumn+= ") ";
		insValue+= ") ";
		insQuery = insQuery + insColumn + insValue;
		
		System.out.print(insQuery);
		return DBUtil.create(insQuery);
	}
	
	public static boolean update (EducationDetails ed) {
		String updQuerry = "UPDATE EDUCATION_DETAILS SET ";



		if(ed.getSscPercentage()>0) {
			updQuerry+= "SSC_PERC='"+ed.getSscPercentage()+"',";
		} 
		
		if(ed.getHscPercentage()>0) {
			updQuerry+= " HSC_PERC='"+ed.getHscPercentage()+"',";
		} 
		
		if(ed.getGradPercentage()>0) {
			updQuerry+= " GRAD_PERC ='"+ed.getGradPercentage()+"', ";
		} 

	
		if(ed.getHscType()!=null) {
			updQuerry+= " HSC_TYPE ='"+ed.getHscType()+"',";
		}
		
		if(ed.getGradType()!=null) {
			updQuerry+= " GRAD_TYPE ='"+ed.getGradType()+"',";
		}
		
		if(ed.getSccSchoolDetails()!=null) {
			updQuerry+= "  SSC_SCHOOL ='"+ed.getSccSchoolDetails()+"',";
		}

		if(ed.getHccCollegeDetails()!=null) {
			updQuerry+= "   HSC_COLLEGE='"+ed.getHccCollegeDetails()+"',";
		}
		
		if(ed.getGradCollegeDetails()!=null) {
			updQuerry+= "   GRAD_COLLEGE ='"+ed.getGradCollegeDetails()+"',";
		}
		
		if(ed.getSkills()!=null) {
			updQuerry+= "   SKILLS ='"+ed.getSkills()+"',";
		}
		
		if(updQuerry.lastIndexOf(',')>0) {
			updQuerry=updQuerry.substring(0,updQuerry.lastIndexOf(','))	;
		}
		updQuerry += " WHERE ID = "+ed.getId();
		System.out.println(updQuerry);
		return DBUtil.update(updQuerry)>0;
	
	}
	public static EducationDetails getByUserId(int userId) {
		
		String selQuery = "SELECT * FROM EDUCATION_DETAILS WHERE USER_ID="+userId;
		
		EducationDetails ed = null;
		try {
			ResultSet rs = DBUtil.getStatement().executeQuery(selQuery);
			while(rs.next()) {
				ed = new EducationDetails();
				
				ed.setId(rs.getInt("id"));
				ed.setUserId(rs.getInt("user_id"));
				
				ed.setSscPercentage(rs.getFloat("ssc_perc"));
				ed.setHscPercentage(rs.getFloat("hsc_perc"));
				ed.setGradPercentage(rs.getFloat("grad_perc"));
				
				ed.setHscType(rs.getString("hsc_type"));
				ed.setGradType(rs.getString("grad_type"));
				
				ed.setSscSchoolDetails(rs.getString("ssc_school"));
				ed.setHscCollegeDetails(rs.getString("hsc_college"));
				ed.setGradCollegeDetails(rs.getString("grad_college"));
				ed.setSkills(rs.getString("skills"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ed;
	}

}
