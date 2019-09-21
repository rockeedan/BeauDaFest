package com.beaudafest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beaudafest.domain.MemberVO;
import com.beaudafest.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	MemberService memberService;

	// 일반 회원 가입 페이지로 이동
	@GetMapping("/userJoin")
	public String userJoinPage() {
		return "member/userJoinPage"; // 가입 페이지로 이동
	}

	// 일반 회원 가입
	@PostMapping("/userJoin")
	public String userJoin(MemberVO vo) {
		MemberVO vo2 = new MemberVO("hana1", "hana", "하나", "hana1@naver.com", "010-1111-1111", 0);
		vo.setMemberStatus(0);
		int result = memberService.memberJoin(vo2);
		System.out.println("가입성공 : " + result);
		return "redirect:/beaudafest/main"; // 이동페이지넣기(메인)
	}

	// 오너 회원 가입 페이지로 이동
	@GetMapping("/ownerJoin")
	public String ownerJoinPage() {
		return "member/ownerJoinPage"; // 가입 페이지로 이동
	}

	// 오너 회원 가입
	@PostMapping("/ownerJoin")
	public String ownerJoin(MemberVO vo, RedirectAttributes redirectAttributes) {
		vo = new MemberVO("hana3", "set", "셋", "hana3@naver.com", "010-3333-3333", 1);
		vo.setMemberStatus(1);
		int result = memberService.memberJoin(vo);
		System.out.println("가입성공 : " + result);
		redirectAttributes.addAttribute("memberId", vo.getMemberId());
		return "redirect:/beaudafest/shop/shopJoin"; //샵 등록 페이지로 이동
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

