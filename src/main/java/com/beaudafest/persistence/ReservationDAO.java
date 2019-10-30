package com.beaudafest.persistence;

import java.util.List;
import java.util.Map;



public interface ReservationDAO {
	
	//예약 리스트 조회
	public int createSchedule(Map map);
	
	public List<Map<String, Object>> selectRsvnList(int shopnum);
	
	//월별 총 수익, area chart 조회
	public List<Map<String, Object>> selectMonthlyRsvnProfits(int shopnum);

	//월별 예약 수, bar chart 조회
	public List<Map<String, Object>> selectMonthlyRsvnCount(int shopnum);

	
	
	//사용자 예약 리스트 조회
	//bookingdate가 rsvndate넘지 않은 예약 조회 : 지나지 않은 날짜
	public List<Map<String, Object>> selectUserRsvnList(String memberId);
	
	//사용자 예약 히스토리 조회
	//bookingdate가 rsvndate넘은 예약 조회 : 지난날짜
	public List<Map<String, Object>> selectUserRsvnHistory(String memberId);


}
