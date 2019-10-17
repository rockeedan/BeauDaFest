package com.beaudafest.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beaudafest.persistence.ReservationDAO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDAO dao;

	// 예약 리스트 조회
	@Override
	public List<Map<String, Object>> selectRsvnList(int shopnum) {
		return dao.selectRsvnList(shopnum);
	}

	@Override
	public List<Map<String, Object>> selectMonthlyRsvnCount(int shopnum) {
		return dao.selectMonthlyRsvnCount(shopnum);
	}
	
	       

}
