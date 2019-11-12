package com.beaudafest.persistence;

import java.util.List;
import java.util.Map;

import com.beaudafest.domain.ReservationTableVO;
import com.beaudafest.domain.newReservationTableVO;

public interface ReservationTableDAO {
	
	public int selectMonthSchedule(Map map);
	
	public int insertTimeSchedule(Map map);
	public int insertWeekSchedule(Map map);
	public List<ReservationTableVO> selectWeekScheduleList(Map map);
	public List<newReservationTableVO> event(int shopNum);
	public int deleteTimeSchedule(Map map);
	public int countTimeSchedule(Map map);
	public int deleteMonthSchedule(Map map);
	public List<newReservationTableVO> reservationEvent(Map map);
}
