package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;

import jakarta.servlet.http.HttpSession;

@Controller
public class UsrMemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public Object doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {
		if (Ut.isNullOrEmpty(loginId)) {
			return "아이디를 입력해주세요";
		}
		if (Ut.isNullOrEmpty(loginPw)) {
			return "비밀번호를 입력해주세요";
		}
		if (Ut.isNullOrEmpty(name)) {
			return "이름을 입력해주세요";
		}
		if (Ut.isNullOrEmpty(nickname)) {
			return "닉네임을 입력해주세요";
		}
		if (Ut.isNullOrEmpty(cellphoneNum)) {
			return "전화번호를 입력해주세요";
		}
		if (Ut.isNullOrEmpty(email)) {
			return "이메일을 입력해주세요";
		}

		int id = memberService.join(loginId, loginPw, name, nickname, cellphoneNum, email);

		if (id == -1) {
			return Ut.f("이미 사용중인 아이디(%s)입니다", loginId);
		}

		if (id == -2) {
			return Ut.f("이미 사용중인 이름(%s)과 이메일(%s)입니다", name, email);
		}

		Member member = memberService.getMember(id);

		return member;
	}
	
	
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public Object doLogin(String loginId, String loginPw, HttpSession session) {
		session.setAttribute("test", "로그인 테스트");
		
        if(!Ut.isEmpty(session.getAttribute("loginedMember"))){
			return "이미 로그인 되어있는 상태입니다.";
		}

		if (Ut.isNullOrEmpty(loginId)) {
			return "아이디를 입력해주세요";
		}
		if (Ut.isNullOrEmpty(loginPw)) {
			return "비밀번호를 입력해주세요";
		}
		
		Member member = memberService.getMemberByLoginId(loginId);
		if(Ut.isEmpty(member)) {
			return Ut.f("해당 로그인 id(%s)는 존재하지 않습니다.", loginId);
		}
		if(!member.getLoginPw().equals(loginPw.trim())) {
			return "비밀번호가 일치하지 않습니다.";
		}
		
		session.setAttribute("loginedMember", member);
		session.setAttribute("loginedMemberId", member.getId());
		

		return Ut.f("%s(%s)님이 로그인 하셨습니다.", member.getName(), member.getLoginId());
		
	}
	
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public Object doLogout(HttpSession session) {
		Member member = (Member)session.getAttribute("loginedMember");
		if(Ut.isEmpty(member)) {
			return "로그인 상태가 아닙니다.";
		}
		
		session.removeAttribute("loginedMember");
		session.removeAttribute("loginedMemberId");

		return Ut.f("%s(%s)님 안녕히 가십시오", member.getName(), member.getLoginId());
	}
}