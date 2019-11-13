package com.beaudafest.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.beaudafest.domain.MemberVO;
import com.beaudafest.service.MemberService;

@Controller
public class MainController {

	@Autowired
	MemberService memberService;

	// 메인 페이지로 이동
	@GetMapping("/")
	public String mainPage() {
		return "main/searchAvailability";// 메인페이지
	}

	// 로그인 페이지로 이동
	@GetMapping("/login")
	public String loginPage() {
		return "member/login";
	}
	
	//로그인
	@PostMapping("/login")
    public String login(MemberVO vo, HttpSession session, HttpServletResponse response) throws Exception {
        Map<String, Integer> login = memberService.login(vo);
        String success = String.valueOf(login.get("SUCCESS"));
        if(success.equals("0")) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('아이디 혹은 비밀번호가 틀립니다.');location.href='/beaudafest/login';</script>");
            out.flush();
            return "member/login";
        } else {
            System.out.println("로그인 성공");
            session.setAttribute("login", "success");
            session.setAttribute("loginId", vo.getMemberId());
            session.setAttribute("memberStatus", String.valueOf(login.get("MEMBERSTATUS")));
            System.out.println(session.getAttribute("memberStatus"));
            return "redirect:/";
        }
    }

	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
