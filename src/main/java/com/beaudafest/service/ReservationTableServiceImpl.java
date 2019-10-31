package com.beaudafest.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.xml.bind.ParseConversionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.beaudafest.domain.ReservationTableVO;
import com.beaudafest.domain.newReservationTableVO;
import com.beaudafest.persistence.ReservationTableDAO;

@Service
public class ReservationTableServiceImpl implements ReservationTableService{
	
	@Autowired
	ReservationTableDAO dao;
	
	@Override
	public boolean selectMonthSchedule(int shopNum, String addDate) {
		Map<String,Object> map = new HashMap<>();
		map.put("shopNum",shopNum);
		map.put("addDate",addDate);
		if(dao.selectMonthSchedule(map)==0) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean insertTimeSchedule(int shopNum, String addDate, String[] open, String[] close) {
		
		Map<String,Object> map = new HashMap<>();
		map.put("shopNum",shopNum);
		map.put("addDate",addDate);
		map.put("start",open);
		map.put("end",close);
//			List<Map<String,String>> timeList = new ArrayList<>();//시간테이블에 전달할 리스트
//			for (int i = 0; i < open.length;i++) {//오픈시간부터 마감시간까지 시간 Map을 생성하여 리스트에 담기
//				Map<String,String> timeMap = new HashMap<>();//리스트에 담을 시작시간과 끝시간
//				timeMap.put("start",open[i]);
//				timeMap.put("end",close[i]);
//				timeList.add(timeMap);
//			}
//		map.put("timeList",timeList);
		
		if(dao.insertTimeSchedule(map)!=0) {
			return true;
		};
		return false;
	}
	
	@Override
	public boolean insertWeekSchedule(int shopNum, String weekStart, String weekEnd, String open, String close) {
		try {
			Map<String,Object> map = new HashMap<>();
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
			Date startDate = format.parse(weekStart);
			Calendar cal = new GregorianCalendar(Locale.KOREA);
			cal.setTime(format.parse(weekStart));
			
			map.put("shopNum",shopNum);
				List<Map<String,String>> timeList = new ArrayList<>();//시간테이블에 전달할 리스트
				int openT = Integer.parseInt(open.substring(0, 2));//오픈시간
				int closeT = Integer.parseInt(close.substring(0, 2));//마감시간
				for (int j = 0;j<7;j++) {
					for (int i = openT; i < closeT;i++) {//오픈시간부터 마감시간까지 시간 Map을 생성하여 리스트에 담기
						Map<String,String> timeMap = new HashMap<>();//리스트에 담을 시작시간과 끝시간
						timeMap.put("addDate",format.format(cal.getTime()));
						timeMap.put("start",format.format(cal.getTime())+" "+i+":00");
						timeMap.put("end",format.format(cal.getTime())+" "+i+":30");
						timeList.add(timeMap);
						Map<String,String> timeMap2 = new HashMap<>();//리스트에 담을 시작시간과 끝시간
						timeMap2.put("addDate",format.format(cal.getTime()));
						timeMap2.put("start",format.format(cal.getTime())+" "+i+":30");
						timeMap2.put("end",format.format(cal.getTime())+" "+(i+1)+":00");
						timeList.add(timeMap2);
					}
					cal.add(Calendar.DAY_OF_YEAR, 1);
				}
			map.put("timeList",timeList);
			
			if(dao.insertWeekSchedule(map)!=0) {
				return true;
			};
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public List<ReservationTableVO> selectWeekScheduleList(int shopNum, Date weekStart) {
		Map<String,Object> map = new HashMap<>();
		map.put("shopNum",shopNum);
		map.put("weekStart",weekStart);
		return dao.selectWeekScheduleList(map);
	}
	
	@Override
	public List<newReservationTableVO> event(int shopNum) {
		return dao.event(shopNum);
	}
	
	@Override
	public boolean deleteTimeSchedule(int shopNum, String addDate, String startTime) {
		Map<String,Object> map = new HashMap<>();
		map.put("shopNum",shopNum);
		map.put("addDate",addDate);
		map.put("startTime",startTime);
		if(dao.deleteTimeSchedule(map)==1) {
			map.remove("startTime");
			if(dao.countTimeSchedule(map)==0) {
				dao.deleteMonthSchedule(map);
			}
			return true;
		}
		return false;
	}
	@Override
	public int countTimeSchedule(int shopNum, String addDate, String startTime) {
		Map<String,Object> map = new HashMap<>();
		map.put("shopNum",shopNum);
		map.put("addDate",addDate);
		map.put("startTime",startTime);
		return dao.countTimeSchedule(map);
	}
	@Override
	public List<newReservationTableVO> reservationEvent(int shopNum, int rsvnTime) {
		Map<String,Object> map = new HashMap<>();
		map.put("shopNum",shopNum);
		map.put("rsvnTime",rsvnTime);
		return dao.reservationEvent(map);
	}
}
