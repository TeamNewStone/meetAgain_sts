package com.kh.meetAgain.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MemberController {
	
	@RequestMapping("member/memberInsertForm.do")
	public String memberInsertForm() {
		return "member/memberInsertForm";
	}
	@RequestMapping("member/memberInsertSuccess.do")
	public String memberInsertSuccess() {
		return "member/memberInsertSuccess";
	}
	@RequestMapping("member/mTMIInsertForm.do")
	public String mTMIInsertForm() {
		return "member/mTMIInsertForm";
	}
	
	@RequestMapping("member/membership.do")
	public String membership() {
		return "member/membership";
	}
	@RequestMapping("member/login.do")
	public String login() {
		return "member/login";
	}
	@RequestMapping("member/callBack.do")
	public String callback() {
		return "member/callBack";
	}
}
