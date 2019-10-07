package com.beaudafest.service;

import java.util.Date;
import java.util.List;

import com.beaudafest.domain.ReservationTableVO;
import com.beaudafest.domain.newReservationTableVO;

public interface ReservationTableService {
	
	public boolean selectMonthSchedule(int shopNum,String addDate);
	
	public boolean insertTimeSchedule(int shopNum,String addDate,String open[],String close[]);
	public boolean insertWeekSchedule(int shopNum,String weekStart,String weekEnd,String open,String close);
	public List<ReservationTableVO> selectWeekScheduleList(int shopNum,Date weekStart);
	public List<newReservationTableVO> event();
	public int hihi();
}
