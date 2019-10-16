package com.beaudafest.service;

import java.util.Map;

import com.beaudafest.domain.MemberVO;

public interface MemberService {
	public int memberJoin(MemberVO vo);//회원 가입
	public int modifyMemberInfo(MemberVO vo);//회원 수정
	public int deleteMember(String memberId);//회원 삭제
	
	public MemberVO findMember(String memberId); //특정 회원 id로 조회
	public Map<String, Integer> login(MemberVO vo); //로그인
	public MemberVO login2(String memberId); //로그인
}
