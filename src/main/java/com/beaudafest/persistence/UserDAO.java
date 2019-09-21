package com.beaudafest.persistence;

import com.beaudafest.domain.UserVO;

public interface UserDAO {
	public int memberJoin(UserVO vo);
	public int modify(UserVO vo);
	public int delete(String userId);
	
	public UserVO findUser(String userId);
}
