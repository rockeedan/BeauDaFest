package com.beaudafest.service;

import java.util.List;
import java.util.Map;

public interface ReservationService {

	// 예약 리스트 조회
	public boolean createSchedule(Map map);
	// 예약 생성
	public List<Map<String, Object>> selectRsvnList(int shopnum);

	// 월별 총 수익, area chart 조회
	public List<Map<String, Object>> selectMonthlyRsvnProfits(int shopnum);

	// 월별 예약 수, bar chart 조회
	public List<Map<String, Object>> selectMonthlyRsvnCount(int shopnum);

	//사용자 예약 리스트 조회
	public List<Map<String, Object>> selectUserRsvnList(String memberId);
	
	//사용자 예약 히스토리 조회
	public List<Map<String, Object>> selectUserRsvnHistory(String memberId);

}
