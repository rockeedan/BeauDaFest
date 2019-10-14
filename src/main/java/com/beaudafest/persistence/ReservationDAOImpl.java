package com.beaudafest.persistence;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ReservationDAOImpl implements ReservationDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	//예약 리스트 조회
	@Override
	public List<Map<String, Object>> selectRsvnList(int shopnum){
		return sqlSession.selectList("reservation.selectRsvnList", shopnum);
		
	}

	@Override
	public int createSchedule(Map map) {
		return sqlSession.update("reservation.createSchedule",map);
	}
	

}
