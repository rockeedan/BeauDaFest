package com.beaudafest.persistence;

import com.beaudafest.domain.MemberVO;

public interface MemberDAO {
	public int memberJoin(MemberVO vo);//회원 가입
	public int deleteMember(String memberId);//회원 삭제
	public int modifyMemberInfo(MemberVO vo);//회원 정보 수정
	
	public MemberVO findMember(String memberId);//id로 특정 회원 조회
	public int login(MemberVO vo); //로그인
}
