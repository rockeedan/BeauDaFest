package com.beaudafest.service;

import java.sql.SQLException;
import java.util.Map;

import javax.inject.Inject;

import org.omg.CORBA.TRANSACTION_ROLLEDBACK;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.TransactionManagementConfigurationSelector;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import com.beaudafest.persistence.ReservationDAO;
@Service
public class ReservationServiceImpl implements ReservationService{

	@Inject
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

}
