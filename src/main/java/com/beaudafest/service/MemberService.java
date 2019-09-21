package com.beaudafest.service;

import com.beaudafest.domain.MemberVO;

public interface MemberService {
	public int memberJoin(MemberVO vo);//회원가입
	public int modifyMemberInfo(MemberVO vo);
	public int deleteMember(String memberId);
	
	public MemberVO findMember(String memberId); //특정 회원 id로 조회
}
