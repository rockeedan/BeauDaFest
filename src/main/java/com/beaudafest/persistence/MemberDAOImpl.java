package com.beaudafest.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beaudafest.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int memberJoin(MemberVO vo) {
		return sqlSession.insert("user.memberJoin", vo);
	}

	@Override
	public int modifyMemberInfo(MemberVO vo) {
		return sqlSession.update("user.modifyMemberInfo",vo);
	}

	@Override
	public int deleteMember(String memberId) {
		return sqlSession.delete("user.deleteMember", memberId);
	}

	@Override
	public MemberVO findMember(String memberId) {
		return sqlSession.selectOne("user.findMember", memberId);
	}
	
}
