<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="org.json.JSONArray" %>
<%@page import="org.json.JSONObject" %>
<%@page import="Util.ConnectionManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>




<%
	
	ConnectionManager cm = new ConnectionManager();
	Connection con = cm.getConnection();
	PreparedStatement ps;
	ResultSet rs;
	JSONArray list = new JSONArray();
	String sql = "select * from patientstatus";
	
	PreparedStatement st = con.prepareStatement(sql);
//	st.setString(1, "Active");
	rs = st.executeQuery();
	while(rs.next())
	{
	//	System.out.println("data found");
		JSONObject obj = new JSONObject();
		int patient_id = rs.getInt(1);
		//System.out.println(patient_id);
        String name = rs.getString(3);
        //System.out.println(name);
        int age = rs.getInt(4);
        //System.out.println(age);
        String address = rs.getString(7);
        //System.out.println(address);
        Date date = rs.getDate(5);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = formatter.format(date);
        //System.out.println(strDate);
        String bed = rs.getString(6);
        //System.out.println(bed);
        
        obj.put("patient_id", patient_id);
        obj.put("name",name);
        obj.put("age", age);
        obj.put("address", address);
        obj.put("date", strDate);
        obj.put("bed", bed);
        System.out.println(obj.getString("bed"));
        list.put(obj);
        System.out.println(list.getJSONObject(0));
        System.out.println(list.toString());

	}
	
	out.print(list.toString());
	out.flush();
%>









