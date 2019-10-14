package com.beaudafest.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationManager;

@Repository
public class ReservationDAOImpl implements ReservationDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Transactional
	@Override
	public int createSchedule(Map map) {
		System.out.println("dao : "+TransactionSynchronizationManager.getCurrentTransactionName());
		return sqlSession.update("reservation.createSchedule", map);
	}

}
