package com.beaudafest.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface ReservationDAO {
	
	//예약 리스트 조회
	public int createSchedule(Map map);
	
	//예약 생성
	public List<Map<String, Object>> selectRsvnList(int shopnum);

}
