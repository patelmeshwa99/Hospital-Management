package Service;

import Bean.PatientBean;
import DAO.PatientDao;

public class PatientService {
	

	PatientDao patDao = new PatientDao();
	
	public boolean insertPatient(PatientBean patient)
	{
		boolean status = patDao.insertPatient(patient);
		return status;
	}
	
	public String findPatientBySsnId(int ssn_id)
	{
		String cId = patDao.findPatientBySsnId(ssn_id);
		return cId;
	}
	
	public PatientBean findPatientByPatientId(int patient_id)
	{
		PatientBean pb = patDao.findPatientByPatientId(patient_id);
		return pb;
	}
	
	public int updatePatient(PatientBean pb, int patient_id) 
	{
		return patDao.updatePatient(pb, patient_id);
	}
	
	public int deletePatient(int pat_id) {
		return patDao.deletePatient(pat_id);
	}
	
}
