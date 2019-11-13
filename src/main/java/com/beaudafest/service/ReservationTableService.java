package com.beaudafest.service;

import java.util.Date;
import java.util.List;

import com.beaudafest.domain.ReservationTableVO;
import com.beaudafest.domain.ReservationVO;
import com.beaudafest.domain.newReservationTableVO;

public interface ReservationTableService {
	
	public boolean selectMonthSchedule(int shopNum,String addDate);
	
	public boolean insertTimeSchedule(int shopNum,String addDate,String open[],String close[]);
	public boolean insertWeekSchedule(int shopNum,String weekStart,String weekEnd,String open,String close);
	public List<ReservationTableVO> selectWeekScheduleList(int shopNum,Date weekStart);
	public List<newReservationTableVO> event(int shopNum);
	public boolean deleteTimeSchedule(int shopNum,String addDate,String startTime);
	public int countTimeSchedule(int shopNum,String addDate, String StartTime);
	public List<newReservationTableVO> reservationEvent(int shopNum,int rsvnTime);
	public boolean createReservation(ReservationVO vo);
}
