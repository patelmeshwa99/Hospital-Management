package Service;

import DAO.MedicineDao;

public class MedicineService {
	
	MedicineDao medDao = new MedicineDao();

	public boolean checkAvailabilityByName(String med_name) {
		return medDao.checkAvailabilityByName(med_name);
	}

}
