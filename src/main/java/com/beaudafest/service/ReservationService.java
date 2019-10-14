package com.beaudafest.service;

import java.util.List;
import java.util.Map;

public interface ReservationService {

	// 예약 리스트 조회
	public boolean createSchedule(Map map);
	// 예약 생성
	public List<Map<String, Object>> selectRsvnList(int shopnum);

}
