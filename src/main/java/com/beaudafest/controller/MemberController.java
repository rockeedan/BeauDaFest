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
@RequestMapping("/*")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	//로그인
	@PostMapping("/member/login")
	public String login(MemberVO vo, HttpSession session) {
		int success = memberService.login(vo);
		if(success == 0) {
			System.out.println("ㄴㄴ");
		} else {
			System.out.println("로그인 성공");
			session.setAttribute("login", "success");
			session.setAttribute("loginId", vo.getMemberId());
		}
		return "redirect:/main";
	}
	

	// 일반 회원 가입 페이지로 이동
	@GetMapping("/member/userJoin")
	public String userJoinPage(HttpServletRequest request ) {
		request.setAttribute("memberStatus", 0);
		return "member/signUp"; // 가입 페이지로 이동
	}

	// 일반 회원 가입
	@PostMapping("/member/userJoin")
	public String userJoin(MemberVO vo) {
		memberService.memberJoin(vo);
		return "redirect:/main";
	}

	// 오너 회원 가입 페이지로 이동
	@GetMapping("/member/ownerJoin")
	public String ownerJoinPage(HttpServletRequest request) {
		request.setAttribute("memberStatus", 1);
		return "member/signUp"; // 가입 페이지로 이동
	}

	// 오너 회원 가입
	@PostMapping("/member/ownerJoin")
	public String ownerJoin(MemberVO vo,HttpSession session) {
		int result = memberService.memberJoin(vo);
		System.out.println("가입성공 : " + result);
		session.setAttribute("memberId", vo.getMemberId());
		
		return "redirect:/shop/shopJoin"; //샵 등록 페이지로 이동
	}

	// 회원정보수정 페이지로 이동
	@GetMapping("/member/modifyMember")
	public String modifyMemberPage() {
		return "modify"; // 페이지로 이동
	}

	// 회원정보수정
	@PostMapping("/member/modifyMember")
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
	@PostMapping("/member/deleteMember")
	public String deleteMember(String memberId) {
		memberId = "hana1";
		int result = memberService.deleteMember(memberId);
		System.out.println(result);
		return "deleteMember"; // 이동페이지넣기
	}

	//memberId로 특정 회원 조회
	@PostMapping("/member/findMember")
	public String findMember(String memberId, Model m) {
		MemberVO vo = memberService.findMember("hana1");
		System.out.println(vo.toString());
		return "회원조회창"; // 이동페이지넣기
	}
	
	
}

