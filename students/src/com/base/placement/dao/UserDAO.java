package com.base.placement.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.base.placement.model.User;

public class UserDAO {

	public static boolean register(User u) {
		String insQuery = "INSERT INTO USERS (email, password,first_name,last_name,role_id,status) values('"+u.getEmail()+"','"+u.getPassword()+"','"+u.getFirstName()+"','"+u.getLastName()+"','"+u.getRole()+"','"+u.getStatus()+"')";
		return DBUtil.create(insQuery);
	}
	
	public static User getByEmail(String email) {
		String selQuery = "SELECT * FROM USERS where email='"+email+"'";
		User user = null;
		try {
			ResultSet rs = DBUtil.getStatement().executeQuery(selQuery);
			if(rs!=null && rs.next()) {
				user = new User();
				user.setId(rs.getInt("ID"));
				user.setEmail(rs.getString("EMAIL"));
				user.setFirstName(rs.getString("FIRST_NAME"));
				user.setLastName(rs.getString("LAST_NAME"));
				user.setRole(rs.getInt("ROLE_ID"));
				user.setStatus(rs.getString("STATUS"));
				user.setPassword(rs.getString("PASSWORD"));
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(user);
		return user;
	}
	
	public static User login(User user) {
		String selQuery = "SELECT * FROM USERS where email='"+user.getEmail()+"' AND password = '" +user.getPassword()+"';";
		User user2 = null;
		try {
			ResultSet rs = DBUtil.getStatement().executeQuery(selQuery);
			if(rs!=null && rs.next()) {
				user2 = new User();
				user2.setEmail(rs.getString("email"));
				user2.setFirstName(rs.getString("first_name"));
				user2.setLastName(rs.getString("last_name"));
				user2.setRole(rs.getInt("role_id"));
				user2.setFirstName(rs.getString("status"));
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user2;
		
	}

}
