package com.beaudafest.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAOimpl implements ReservationDAO {

	@Autowired
	private SqlSession sqlSession;

	// 예약 리스트 조회
	@Override
	public List<Map<String, Object>> selectRsvnList(int shopnum) {
		return sqlSession.selectList("reservation.selectRsvnList", shopnum);

	}

	// 월별 총 수익, area chart 조회
	@Override
	public List<Map<String, Object>> selectMonthlyRsvnProfits(int shopnum) {
		return sqlSession.selectList("reservation.selectMonthlyRsvnProfits", shopnum);
	}

	// 월별 예약 수, bar chart 조회
	@Override
	public List<Map<String, Object>> selectMonthlyRsvnCount(int shopnum) {
		return sqlSession.selectList("reservation.selectMonthlyRsvnCount", shopnum);
	}

	//사용자 예약 리스트 조회
	@Override
	public List<Map<String, Object>> selectUserRsvnList(String memberId) {
		return sqlSession.selectList("reservation.selectUserRsvnList", memberId);
	}

	//사용자 예약 히스토리 조회
	@Override
	public List<Map<String, Object>> selectUserRsvnHistory(String memberId) {
		return sqlSession.selectList("reservation.selectUserRsvnHistory", memberId);
	}

}
