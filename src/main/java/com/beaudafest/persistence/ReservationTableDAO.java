package com.beaudafest.persistence;

import java.util.List;
import java.util.Map;

import com.beaudafest.domain.ReservationTableVO;

public interface ReservationTableDAO {

	public int insertTimeSchedule(Map map);
	public int insertWeekSchedule(Map map);
	public List<ReservationTableVO> selectWeekScheduleList(Map map);
}
