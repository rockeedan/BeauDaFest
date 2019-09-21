package com.beaudafest.persistence;

import java.util.Map;

public interface ReservationTableDAO {

	public int insertTimeSchedule(Map map);
	public int insertWeekSchedule(Map map);
}
