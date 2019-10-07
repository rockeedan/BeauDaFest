package com.beaudafest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beaudafest.domain.MemberVO;
import com.beaudafest.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	// 일반 회원 가입 페이지로 이동
	@GetMapping("/signUp")
	public String userJoinPage(HttpServletRequest request ) {
		request.setAttribute("memberStatus", 0);
		return "member/signUp"; // 가입 페이지로 이동
	}

	// 일반 회원 가입
	@PostMapping("/signUp")
	public String userJoin(MemberVO vo) {
		memberService.memberJoin(vo);
		return "redirect:/";
	}

	// 오너 회원 가입 페이지로 이동 (오너로 로그인 되어있으면 바로 샵등록으로 가기)
	@GetMapping("/ownerSignUp")
	public String ownerJoinPage(HttpServletRequest request) {
		request.setAttribute("memberStatus", 1);
		return "member/signUp"; // 가입 페이지로 이동
	}

	// 오너 회원 가입
	@PostMapping("/ownerSignUp")
	public String ownerJoin(MemberVO vo,HttpSession session) {
		int result = memberService.memberJoin(vo);
		System.out.println("가입성공 : " + result);
		session.setAttribute("memberId", vo.getMemberId());
		
		return "redirect:/shopSignUp"; //샵 등록 페이지로 이동
	}

	// 회원정보수정 페이지로 이동
	@GetMapping("/modifyMember")
	public String modifyMemberPage() {
		return "modify"; // 페이지로 이동
	}

	// 회원정보수정
	@PostMapping("/modifyMember")
	public String modifyMember(MemberVO vo) {
		MemberVO vo2 = new MemberVO();
		vo2.setMemberId("hana1");
		vo2.setMemberName("둘");
		vo2.setMemberEmail("dul@naver.com");
		vo2.setMemberPhone("010-2222-2222");
		vo2.setMemberPass("2222");
		int result = memberService.modifyMemberInfo(vo2);
		System.out.println("수정 완료 : " + result);
		return "modify"; // 이동페이지넣기
	}

	// 회원삭제
	@PostMapping("/deleteMember")
	public String deleteMember(String memberId) {
		memberId = "hana1";
		int result = memberService.deleteMember(memberId);
		System.out.println(result);
		return "deleteMember"; // 이동페이지넣기
	}

	//memberId로 특정 회원 조회
	@PostMapping("/findMember")
	public String findMember(String memberId, Model m) {
		MemberVO vo = memberService.findMember("hana1");
		System.out.println(vo.toString());
		return "회원조회창"; // 이동페이지넣기
	}
	
	
}

