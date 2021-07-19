package com.base.placement.model;

public class EducationDetails {

	private int id;
	private int userId;

	private float sscPercentage;

	private float hscPercentage;
	private String hscType; 
	
	
	private float gradPercentage;
	private String gradType;
	
	private String sscSchoolDetails;
	private String hscCollegeDetails;
	private String gradCollegeDetails;

	private String skills;
	private String status;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public float getSscPercentage() {
		return sscPercentage;
	}

	public void setSscPercentage(float sscPercentage) {
		this.sscPercentage = sscPercentage;
	}

	public float getHscPercentage() {
		return hscPercentage;
	}

	public void setHscPercentage(float hscPercentage) {
		this.hscPercentage = hscPercentage;
	}

	public float getGradPercentage() {
		return gradPercentage;
	}

	public void setGradPercentage(float gradPercentage) {
		this.gradPercentage = gradPercentage;
	}


	public String getSccSchoolDetails() {
		return sscSchoolDetails;
	}

	public void setSscSchoolDetails(String sscSchoolDetails) {
		this.sscSchoolDetails = sscSchoolDetails;
	}

	public String getHccCollegeDetails() {
		return hscCollegeDetails;
	}

	public void setHscCollegeDetails(String hscCollegeDetails) {
		this.hscCollegeDetails = hscCollegeDetails;
	}

	public String getGradCollegeDetails() {
		return gradCollegeDetails;
	}

	public void setGradCollegeDetails(String gradCollegeDetails) {
		this.gradCollegeDetails = gradCollegeDetails;
	}

	public String getHscType() {
		return hscType;
	}
	
	public void setHscType(String hscType) {
		this.hscType = hscType;
	}
	
	public String getGradType() {
		return gradType;
	}
	
	public void setGradType(String gradType) {
		this.gradType = gradType;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	@Override
	public String toString() {
		return "EducationDetails [id=" + id + ", userId=" + userId + ", sscPercentage=" + sscPercentage
				+ ", hscPercentage=" + hscPercentage + ", hscType=" + hscType + ", gradPercentage=" + gradPercentage
				+ ", gradType=" + gradType + ", sccSchoolDetails=" + sscSchoolDetails + ", hccCollegeDetails="
				+ hscCollegeDetails + ", gradCollegeDetails=" + gradCollegeDetails + ", skills=" + skills + ", status="
				+ status + "]";
	}
	
}
