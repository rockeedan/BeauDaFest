package com.beaudafest.persistence;

import java.util.Map;

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
		return sqlSession.insert("member.memberJoin", vo);
	}

	@Override
	public int modifyMemberInfo(MemberVO vo) {
		return sqlSession.update("member.modifyMemberInfo",vo);
	}

	@Override
	public int deleteMember(String memberId) {
		return sqlSession.delete("member.deleteMember", memberId);
	}

	@Override
	public MemberVO findMember(String memberId) {
		return sqlSession.selectOne("member.findMember", memberId);
	}

	@Override
	public Map<String, Integer> login(MemberVO vo) {
		return sqlSession.selectOne("member.login", vo);
	}

	@Override
	public MemberVO login2(String memberId) {
		return sqlSession.selectOne("member.findPassword", memberId);
	}
	
	
	
}
