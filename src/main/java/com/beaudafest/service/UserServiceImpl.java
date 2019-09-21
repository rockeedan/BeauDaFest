package com.beaudafest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beaudafest.domain.UserVO;
import com.beaudafest.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO dao;

	@Override
	public int memberJoin(UserVO vo) {
		return dao.memberJoin(vo);
	}

	@Override
	public int modify(UserVO vo) {
		return dao.modify(vo);
	}

	@Override
	public int delete(String userId) {
		return dao.delete(userId);
	}

	@Override
	public UserVO findUser(String userId) {
		return dao.findUser(userId);
	}
	
}
