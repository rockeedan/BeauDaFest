package com.beaudafest.service;

import com.beaudafest.domain.UserVO;

public interface UserService {
	public int memberJoin(UserVO vo);
	public int modify(UserVO vo);
	public int delete(String userId);
	
	public UserVO findUser(String userId); //특정 회원 id로 조회
}
