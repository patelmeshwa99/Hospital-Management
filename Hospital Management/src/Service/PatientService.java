package Service;

import Bean.PatientBean;
import DAO.PatientDao;

public class PatientService {
	

	PatientDao custDao = new PatientDao();
	
	public boolean insertPatient(PatientBean patient)
	{
		boolean status = custDao.insertPatient(patient);
		return status;
	}
	
	public String findPatientBySsnId(int ssn_id)
	{
		String cId = custDao.findPatientBySsnId(ssn_id);
		return cId;
	}
	
}
