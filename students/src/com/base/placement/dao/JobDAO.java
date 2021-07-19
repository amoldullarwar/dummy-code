package com.base.placement.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.base.placement.model.Job;

public class JobDAO {

	public boolean add(Job job) {
		
		String insQuery = "INSERT INTO JOB ";
		String insColumn = " (";
		String insValue = " VALUES (";
		
		if(job.getCompanyId()!=0) {
			insColumn+= "COMPANY_ID,";
			insValue+="'"+job.getCompanyId()+"',";
		} 
		
		if(job.getName()!=null) {
			insColumn+= "NAME,";
			insValue+="'"+job.getName()+"',";
		} 
		
		if(job.getDescription()!=null) {
			insColumn+= "DESCRIPTION,";
			insValue+="'"+job.getDescription()+"',";
		}
		
		if(job.getSkills()!=null) {
			insColumn+= "SKILLS,";
			insValue+="'"+job.getSkills()+"',";
		}
		
		if(job.getPostedDate()!=null) {
			insColumn+= "POSTEDDATE,";
			insValue+="'"+DateUtil.formatDateyyyyMMdd(job.getPostedDate())+"',";
		}
		
		if(job.getLastDate()!=null) {
			insColumn+= "LASTDATE,";
			insValue+="'"+DateUtil.formatDateyyyyMMdd(job.getLastDate())+"',";
		}
		
		if(job.getStatus()!=null) {
			insColumn+= "STATUS,";
			insValue+="'"+job.getStatus()+"',";
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

	public boolean update(Job job) {


		String updateQuery = "UPDATE JOB SET ";
		
		if(job.getName()!=null) {
			updateQuery+=" NAME='"+job.getName()+"' ,";	
		}
		
		if(job.getDescription()!=null) {
			updateQuery+=" DESCRIPTION='"+job.getDescription()+"' ,";	
		}
 
		
		if(job.getSkills()!=null) {
			updateQuery+=" SKILLS ='"+job.getSkills()+"' ,";	
		}
		
		if(job.getPostedDate()!=null) {
			updateQuery+=" POSTEDDATE ='"+DateUtil.formatDateyyyyMMdd(job.getPostedDate())+"' ,";	
		}
		
		if(job.getLastDate()!=null) {
			updateQuery+=" LASTDATE ='"+DateUtil.formatDateyyyyMMdd(job.getLastDate())+"' ,";	
		}
		
		if(job.getCompanyId()!=0) {
			updateQuery+=" COMPANY_ID="+job.getCompanyId()+",";	
		}
		
		if(updateQuery.lastIndexOf(',')>0) {
			updateQuery=updateQuery.substring(0,updateQuery.lastIndexOf(','));
		}
		
		updateQuery+= " WHERE ID = " +job.getId();

		return DBUtil.update(updateQuery)!=0;
	}

	public boolean delete(Job u) {
		// TODO Auto-generated method stub
		return false;
	}

	public static List<Job> getAll() {
		String selQuery ="SELECT job.*, cmp.name as cmp_name FROM JOB job, Company cmp where job.company_id=cmp.id ";
		List<Job> jobList = new ArrayList<Job>();
		try {
			ResultSet rs = DBUtil.getStatement().executeQuery(selQuery);
			while(rs.next()) {
				Job job = new Job();
				job.setName(rs.getString("name"));
				job.setDescription(rs.getString("description"));
				job.setId(rs.getInt("id"));
				job.setCompanyId(rs.getInt("company_id"));
				job.setStatus(rs.getString("status"));
				job.setSkills(rs.getString("skills"));
				job.setCompanyName(rs.getString("cmp_name"));
				job.setPostedDate(rs.getDate("posteddate"));
				job.setLastDate(rs.getDate("lastdate"));
				jobList.add(job);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return jobList;
	
	}
	
	public static List<Job> getAllActive() {
		String selQuery ="SELECT job.*, cmp.name as cmp_name FROM JOB job, Company cmp where job.company_id=cmp.id and job.status='A'";
		List<Job> jobList = new ArrayList<Job>();
		try {
			ResultSet rs = DBUtil.getStatement().executeQuery(selQuery);
			while(rs.next()) {
				Job job = new Job();
				job.setName(rs.getString("name"));
				job.setDescription(rs.getString("description"));
				job.setId(rs.getInt("id"));
				job.setCompanyId(rs.getInt("company_id"));
				job.setStatus(rs.getString("status"));
				job.setSkills(rs.getString("skills"));
				job.setCompanyName(rs.getString("cmp_name"));
				job.setPostedDate(rs.getDate("posteddate"));
				job.setLastDate(rs.getDate("lastdate"));
				jobList.add(job);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return jobList;
	
	}

	public static Job getById(int id) {
		String selQuery ="SELECT job.*, cmp.name as cmp_name FROM JOB job, Company cmp where job.company_id=cmp.id and job.id= "+id;
		Job job = null;
		try {
			ResultSet rs = DBUtil.getStatement().executeQuery(selQuery);
			while(rs.next()) {
				job = new Job();
				job.setName(rs.getString("name"));
				job.setDescription(rs.getString("description"));
				job.setId(rs.getInt("id"));
				job.setCompanyId(rs.getInt("company_id"));
				job.setSkills(rs.getString("skills"));
				job.setCompanyName(rs.getString("cmp_name"));
				job.setPostedDate(rs.getDate("posteddate"));
				job.setLastDate(rs.getDate("lastdate"));
				job.setStatus(rs.getString("status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return job;
	}
	

}
