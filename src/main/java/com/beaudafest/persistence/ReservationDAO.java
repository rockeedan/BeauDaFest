package com.beaudafest.persistence;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;




public interface ReservationDAO {
	
	//예약 리스트 조회
	public List<Map<String, Object>> selectRsvnList(int shopnum);
	
	//area chart 조회
	public List<Map<String, Object>> selectMonthlyRsvnCount(int shopnum);

	
	

}
