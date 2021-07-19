package com.base.placement.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	private final static SimpleDateFormat dateFormatMM_dd_yyyy = new SimpleDateFormat("MM/dd/yyyy");
	private final static SimpleDateFormat dateFormatyyyy_MM_dd = new SimpleDateFormat("yyyy-MM-dd");
	
	public static Date formatDate (String date) throws ParseException {
		return dateFormatMM_dd_yyyy.parse(date);
	}
	
	public static String formatDate (Date date) throws ParseException {
		return dateFormatMM_dd_yyyy.format(date);
	}
	
	public static String formatDateyyyyMMdd (Date date){
		return dateFormatyyyy_MM_dd.format(date);
	}
	/*
	 * 
	 * public static void main(String[] args) { //String dt="07/18/2021"; Date d =
	 * new Date(); System.out.println(d); try { String sd =
	 * DateUtil.formatDateyyyyMMdd(d); System.out.println(sd); } catch
	 * (ParseException e) { // TODO Auto-generated catch block e.printStackTrace();
	 * }
	 * 
	 * }
	 */
}
