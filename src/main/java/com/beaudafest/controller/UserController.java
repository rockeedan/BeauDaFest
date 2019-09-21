package com.beaudafest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beaudafest.domain.UserVO;
import com.beaudafest.service.UserService;

@Controller
@RequestMapping("/beaudafest/member/*")
public class UserController {

	@Autowired
	UserService service;

	// 일반 회원 가입 페이지로 이동
	@GetMapping("/userJoin")
	public String userJoinPage() {
		return "member/userJoinPage"; // 가입 페이지로 이동
	}

	// 일반 회원 가입
	@PostMapping("/userJoin")
	public String userJoin(UserVO vo) {
		UserVO vo2 = new UserVO("hana1", "hana", "하나", "hana1@naver.com", "010-1111-1111", 0);
		vo.setUserStatus(0);
		int result = service.memberJoin(vo2);
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
	public String ownerJoin(UserVO vo) {
		UserVO vo2 = new UserVO("hana3", "set", "셋", "hana3@naver.com", "010-3333-3333", 1);
		vo.setUserStatus(1);
		int result = service.memberJoin(vo2);
		System.out.println("가입성공 : " + result);
		return "redirect:/beaudafest/main"; // 이동페이지 --> 샵 등록 페이지로 이동
	}

	// 회원정보수정 페이지로 이동
	@GetMapping("/modify")
	public String modifyMemberPage() {
		return "modify"; // 가입 페이지로 이동
	}

	// 회원정보수정
	@PostMapping("/modify")
	public String modifyMember(UserVO vo) {
		UserVO vo2 = new UserVO();
		vo2.setUserId("hana1");
		vo2.setUserName("둘");
		vo2.setUserEmail("dul@naver.com");
		vo2.setUserPhone("010-2222-2222");
		vo2.setUserPass("2222");
		int result = service.modify(vo2);
		System.out.println("수정 완료 : " + result);
		return "modify"; // 이동페이지넣기
	}

	// 회원삭제
	@PostMapping("/delete")
	public String deleteMember(String userId) {
		userId = "hana1";
		int result = service.delete(userId);
		System.out.println(result);
		return "deleteMember"; // 이동페이지넣기
	}

	// 특정 회원 조회
	@PostMapping("/findUser")
	public String findUser(String userId, Model m) {
		UserVO vo = service.findUser("hana1");
		System.out.println(vo.toString());
		return "회원조회창"; // 이동페이지넣기
	}
}

