package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Bean.PatientBean;
import Util.ConnectionManager;

public class PatientDao {
	
	ConnectionManager cm = new ConnectionManager();
	static int patient_id = 100000000;
	
	public PatientDao(){
		patient_id += 1;
	}
	
	public boolean insertPatient(PatientBean patient)
	{
		boolean status = false;
		String sql = "insert into patientstatus(ws_pat_id, ws_ssn, ws_pat_name, ws_age, ws_doj, ws_rtype, ws_adrs, state, city, status) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			Connection con = cm.getConnection();
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, patient_id);
			st.setInt(2, patient.getSsn_id());
			st.setString(3, patient.getName());
			st.setInt(4, patient.getAge());
			st.setDate(5, java.sql.Date.valueOf(patient.getDate()));
			st.setString(6, patient.getBed());
			st.setString(7, patient.getAddress());
			st.setString(8, patient.getState());
			st.setString(9, patient.getCity());
			st.setString(10, "Active");
			status = st.execute();
			status = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public String findPatientBySsnId(int ssn_id)
	{
		String sql = "select * from patientstatus where ws_ssn=?";
		ResultSet result;
		String ws_pat_id="";
		
		try {
			Connection con = cm.getConnection();
			PreparedStatement st = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, 
					  ResultSet.CONCUR_READ_ONLY);
			st.setInt(1, ssn_id);
			 result = st.executeQuery();
			 while (result.next()) {
				 ws_pat_id = result.getString(1);
		            return ws_pat_id;
		        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
