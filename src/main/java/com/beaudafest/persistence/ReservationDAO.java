package com.beaudafest.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.Param;


@Repository
public interface ReservationDAO {
	
	//예약 리스트 조회
	public int createSchedule(Map map);
	
	public List<Map<String, Object>> selectRsvnList(int shopnum);
	
	//월별 총 수익, area chart 조회
	public List<Map<String, Object>> selectMonthlyRsvnProfits(int shopnum);

	//월별 예약 수, bar chart 조회
	public List<Map<String, Object>> selectMonthlyRsvnCount(int shopnum);
	
}
