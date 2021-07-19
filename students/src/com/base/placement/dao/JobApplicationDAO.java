package com.base.placement.dao;

import com.base.placement.model.JobApplication;

public class JobApplicationDAO {

public static boolean  add(JobApplication job) {
		
		String insQuery = "INSERT INTO JOB_APPLICATION ";
		String insColumn = " (";
		String insValue = " VALUES (";
		
		if(job.getJobId()!=0) {
			insColumn+= "JOB_ID,";
			insValue+="'"+job.getJobId()+"',";
		} 
		
		if(job.getUserId()>0) {
			insColumn+= "USER_ID,";
			insValue+="'"+job.getUserId()+"',";
		} 
		
		
		if(job.getApplicationDate()!=null) {
			insColumn+= "APPLICATION_DATE,";
			insValue+="'"+DateUtil.formatDateyyyyMMdd(job.getApplicationDate())+"',";
		}
		
		if(job.getApplicationStatus()!=null) {
			insColumn+= "APPLICATION_STATUS,";
			insValue+="'"+job.getApplicationStatus()+"',";
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
}
