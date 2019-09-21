package com.beaudafest.persistence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationTableDAOImpl implements ReservationTableDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public int insertTimeSchedule(Map map) {
		return sqlsession.insert("reservation.insertTimeSchedule",map);
	}
	
	@Override
	public int insertWeekSchedule(Map map) {
		return sqlsession.insert("reservation.insertWeekSchedule",map);
	}

}
