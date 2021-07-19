package com.base.placement.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
		// STEP 1: Declare and initialize 
	    // JDBC driver name and database URL
	   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	   static final String DB_URL = "jdbc:mysql://localhost/sp";
	   
	   //  Database credentials
	   static final String USER = "root";
	   static final String PASS = "admin";

	   public static Connection getConnection() {
		   Connection conn = null;
			   try{
				      //STEP 2: Register JDBC driver
				      Class.forName("com.mysql.jdbc.Driver");
				      //STEP 3: Open a connection
				      //System.out.println("Connecting to database...");
				      conn = DriverManager.getConnection(DB_URL,USER,PASS);
				  }catch(SQLException se){
				      //Handle errors for JDBC
				      se.printStackTrace();
				   }catch(Exception e){
				      //Handle errors for Class.forName
				      e.printStackTrace();
				   }
		   
		   return conn;
	   }
	   
	   public  static Statement getStatement() {
		   Statement stmt = null;
			   try{
				      stmt =  getConnection().createStatement();
				  }catch(SQLException se){
				      //Handle errors for JDBC
				      se.printStackTrace();
				   }catch(Exception e){
				      //Handle errors for Class.forName
				      e.printStackTrace();
				   }
		   return stmt;
	   }

	   public static boolean create(String sql) {
		 boolean recNum = true;
			try {	
				getStatement().execute(sql);
		   }catch(SQLException se){
		      //Handle errors for JDBC
			   recNum = false;
		      se.printStackTrace();
		   }catch(Exception e){
		      //Handle errors for Class.forName
			   recNum = false;
		      e.printStackTrace();
		   } finally {
				try {
			    	  if(getStatement()!=null)
			    		  getStatement().close();
					 if(getConnection()!=null)
			    		  getConnection().close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    	}//end try
		   return recNum;
		}	   
	
	public static int update(String sql) {
		 int recNum = 0;
			try {	
				recNum = getStatement().executeUpdate(sql);
		   }catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		   }catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		   } finally {
				try {
			    	  if(getStatement()!=null)
			    		  getStatement().close();
					 if(getConnection()!=null)
			    		  getConnection().close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    	}//end try
		   return recNum;
		}	 
}
