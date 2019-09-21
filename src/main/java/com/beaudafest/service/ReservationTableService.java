package com.beaudafest.service;

public interface ReservationTableService {
	
	public boolean insertTimeSchedule(int shopNum,String addDate,String open,String close);
	public boolean insertWeekSchedule(int shopNum,String weekStart,String weekEnd,String open,String close);
}
