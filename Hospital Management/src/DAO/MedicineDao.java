package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Util.ConnectionManager;

public class MedicineDao {

	ConnectionManager cm = new ConnectionManager();
	
	public boolean checkAvailabilityByName(String med_name) {
		
		boolean status = false;
		String sql = "select ws_qty_avail from medicines where ws_med_name=?";
		
		ResultSet result;
		int quantity=0;
		
		try {
			Connection con = cm.getConnection();
			PreparedStatement st = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, 
					  ResultSet.CONCUR_READ_ONLY);
			st.setString(1, med_name);
			 result = st.executeQuery();
			 while (result.next()) {
				 quantity = result.getInt(1);
		        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(quantity > 0) {
			return true;
		}
		
		return status;
	}

}
