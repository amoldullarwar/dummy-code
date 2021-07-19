package com.base.placement.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.base.placement.model.Company;

public class CompanyDAO {
	
	public static boolean add (Company comp) {
		String insQuery = "INSERT INTO COMPANY (name, address,description,email,website) values ('"
						+comp.getName()+"','"+comp.getAddress()+"','"+comp.getDescription()+"','"
						+comp.getEmail()+"','"+comp.getWebsite() +"')";
		return DBUtil.create(insQuery);
	}

	public static Company getCompanyByName(String companyName) {
		Company company = null;
		
		String selQuery ="SELECT * FROM COMPANY WHERE NAME = '"+companyName+"'";
		
		try {
			ResultSet rs = DBUtil.getStatement().executeQuery(selQuery);
			
			if(rs!=null && rs.next()) {
				company = new Company();
				company.setName(rs.getString("name"));
				company.setAddress(rs.getString("address"));
				company.setDescription(rs.getString("description"));
				company.setId(rs.getInt("id"));
				company.setEmail(rs.getString("email"));
				company.setWebsite(rs.getString("website"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return company;
	}
	
	public static Company getCompanyByID(String id) {
		Company company = null;
		
		String selQuery ="SELECT * FROM COMPANY WHERE ID = "+id;
		try {
			ResultSet rs = DBUtil.getStatement().executeQuery(selQuery);
			if(rs!=null && rs.next()) {
				company = new Company();
				company.setName(rs.getString("name"));
				company.setAddress(rs.getString("address"));
				company.setDescription(rs.getString("description"));
				company.setId(rs.getInt("id"));
				company.setEmail(rs.getString("email"));
				company.setWebsite(rs.getString("website"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return company;
	}
	
	public static boolean update(Company company) {

		String updateQuery = "UPDATE COMPANY SET ";
		
		if(company.getName()!=null) {
			updateQuery+=" NAME='"+company.getName()+"' ,";	
		}
		
		if(company.getDescription()!=null) {
			updateQuery+=" DESCRIPTION='"+company.getDescription()+"' ,";	
		}
 
		if(company.getAddress()!=null) {
			updateQuery+=" ADDRESS='"+company.getAddress()+"' ,";	
		}
		
		if(company.getEmail()!=null) {
			updateQuery+=" EMAIL='"+company.getEmail()+"' ,";	
		}
		
		if(company.getWebsite()!=null) {
			updateQuery+=" WEBSITE='"+company.getWebsite()+"' ,";	
		}
		
		if(updateQuery.lastIndexOf(',')>0) {
			updateQuery=updateQuery.substring(0,updateQuery.lastIndexOf(','));
		}
		updateQuery+= " WHERE ID = " +company.getId();

		return DBUtil.update(updateQuery)!=0;
		
	
	}
	
	
	public static List<Company> getAll(){
		
		String selQuery ="SELECT * FROM COMPANY ORDER BY NAME ASC ";
		List<Company> listCmp = new ArrayList<Company>();
		try {
			ResultSet rs = DBUtil.getStatement().executeQuery(selQuery);
			
			while(rs.next()) {
				Company company = new Company();
				company.setName(rs.getString("name"));
				company.setAddress(rs.getString("address"));
				company.setDescription(rs.getString("description"));
				company.setId(rs.getInt("id"));
				company.setEmail(rs.getString("email"));
				company.setWebsite(rs.getString("website"));
				listCmp.add(company);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listCmp;
	}
	
public static List<Company> getAll(int startPage, int pageSize){
		
		String selQuery ="SELECT * FROM COMPANY ORDER BY NAME ASC LIMIT "+startPage+","+pageSize;
		List<Company> listCmp = new ArrayList<Company>();
		try {
			ResultSet rs = DBUtil.getStatement().executeQuery(selQuery);
			
			while(rs.next()) {
				Company company = new Company();
				company.setName(rs.getString("name"));
				company.setAddress(rs.getString("address"));
				company.setDescription(rs.getString("description"));
				company.setId(rs.getInt("id"));
				company.setEmail(rs.getString("email"));
				company.setWebsite(rs.getString("website"));
				listCmp.add(company);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listCmp;
	}
}