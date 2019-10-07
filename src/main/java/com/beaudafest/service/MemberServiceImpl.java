package com.beaudafest.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beaudafest.domain.MemberVO;
import com.beaudafest.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO dao;

	@Override
	public int memberJoin(MemberVO vo) {
		return dao.memberJoin(vo);
	}

	@Override
	public int modifyMemberInfo(MemberVO vo) {
		return dao.modifyMemberInfo(vo);
	}

	@Override
	public int deleteMember(String memberId) {
		return dao.deleteMember(memberId);
	}

	@Override
	public MemberVO findMember(String memberId) {
		return dao.findMember(memberId);
	}

	@Override
	public Map<String, Integer> login(MemberVO vo) {
		return dao.login(vo);
	}
	
}
