package com.beaudafest.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beaudafest.domain.ReservationTableVO;
import com.beaudafest.domain.newReservationTableVO;

@Repository
public class ReservationTableDAOImpl implements ReservationTableDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	
	@Override
	public int selectMonthSchedule(Map map) {
		return sqlsession.selectOne("reservation.selectMonthSchedule",map);
	}
	@Override
	public int insertTimeSchedule(Map map) {
		return sqlsession.insert("reservation.insertTimeSchedule",map);
	}
	
	@Override
	public int insertWeekSchedule(Map map) {
		return sqlsession.insert("reservation.insertWeekSchedule",map);
	}

	@Override
	public List<ReservationTableVO> selectWeekScheduleList(Map map) {
		return sqlsession.selectList("reservation.selectWeekScheduleList", map);
	}
	@Override
	public List<newReservationTableVO> event() {
		return sqlsession.selectList("reservation.selectEvent");
	}
	@Override
	public int hihi() {
		return sqlsession.selectOne("reservation.hihi");
	}
}
