package com.beaudafest.service;

import java.util.List;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import com.beaudafest.persistence.ReservationDAO;


@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	ReservationDAO dao;
	
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	@Override
	public boolean createSchedule(Map map) {
		System.out.println(TransactionSynchronizationManager.getCurrentTransactionName());
		int a = dao.createSchedule(map);
		System.out.println(a);
		if(dao.createSchedule(map)==3) {
			return true;
		}else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return false;
	}

	// 예약 리스트 조회
	@Override
	public List<Map<String, Object>> selectRsvnList(int shopnum) {
		return dao.selectRsvnList(shopnum);
	}

	//월별 총 수익, area chart 조회
	@Override
	public List<Map<String, Object>> selectMonthlyRsvnProfits(int shopnum) {
		return dao.selectMonthlyRsvnProfits(shopnum);
	}
	
	//월별 예약 수, bar chart 조회
	@Override
	public List<Map<String, Object>> selectMonthlyRsvnCount(int shopnum) {
		return dao.selectMonthlyRsvnCount(shopnum);
	}

	//사용자 예약 리스트 조회
	@Override
	public List<Map<String, Object>> selectUserRsvnList(String memberId) {
		return dao.selectUserRsvnList(memberId);
	}

	//사용자 예약 히스토리 조회
	@Override
	public List<Map<String, Object>> selectUserRsvnHistory(String memberId) {
		return dao.selectUserRsvnHistory(memberId);
	}
	
}
