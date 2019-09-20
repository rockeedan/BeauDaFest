package com.beaudafest.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beaudafest.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int memberJoin(UserVO vo) {
		return sqlSession.insert("user.memberJoin", vo);
	}

	@Override
	public int modify(UserVO vo) {
		return sqlSession.update("user.modify",vo);
	}

	@Override
	public int delete(String userId) {
		return sqlSession.delete("user.deleteMember", userId);
	}

	@Override
	public UserVO findUser(String userId) {
		return sqlSession.selectOne("user.findUser", userId);
	}
	
}
