package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import Bean.PatientBean;
import Util.ConnectionManager;

public class PatientDao {
	
	ConnectionManager cm = new ConnectionManager();
	static int patient_id = 100000011;
	
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
		System.out.println("hiii");
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
	
	public PatientBean findPatientByPatientId(int patient_id) {
		
		String sql = "select * from patientstatus where ws_pat_id=?";
		ResultSet result;
		String ssn_id="";
		PatientBean pb = new PatientBean();
		try {
			Connection con = cm.getConnection();
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, patient_id);
			 result = st.executeQuery();
			 
			 while (result.next()) {
		            pb.setSsn_id(result.getInt(1));
		            pb.setName(result.getString(3));
		            pb.setAge(result.getInt(4));
		            Date date = result.getDate(5);
		            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		            String strDate = formatter.format(date);
		            pb.setDate(strDate);
		            pb.setBed(result.getString(6));
		            pb.setAddress(result.getString(7));
		            pb.setState(result.getString(8));
		            pb.setCity(result.getString(9));
		            return pb;
		        }
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return null;
	}

	public int updatePatient(PatientBean pb, int patient_id) {
		
		int rows_affected;
		
		String sql = "update patientstatus set ws_pat_name=?, ws_age=?, ws_doj=?, ws_rtype=?, ws_adrs=?, state=?, city=? where ws_pat_id=?";

		try {
			Connection con = cm.getConnection();
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, pb.getName());
			st.setInt(2, pb.getAge());
			st.setDate(3, java.sql.Date.valueOf(pb.getDate()));
			st.setString(4, pb.getBed());
			st.setString(5, pb.getAddress());
			st.setString(6, pb.getState());
			st.setString(7, pb.getCity());
			st.setInt(8, patient_id);
			rows_affected = st.executeUpdate();
			return rows_affected;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int deletePatient(int pat_id) {
		int rows_affected;
		String sql = "delete from patientstatus where ws_pat_id=?";
		
		try {
			Connection con = cm.getConnection();
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, pat_id);
			rows_affected = st.executeUpdate();
			return rows_affected;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}
