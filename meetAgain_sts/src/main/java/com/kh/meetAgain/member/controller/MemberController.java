package com.kh.meetAgain.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MemberController {
	
	@RequestMapping("member/memberInsertForm.do")
	public String memberInsertForm() {
		return "board/memberInsertForm";
	}
	@RequestMapping("member/memberInsertSuccess.do")
	public String memberInsertSuccess() {
		return "board/memberInsertSuccess";
	}
	@RequestMapping("member/mTMIInsertForm.do")
	public String mTMIInsertForm() {
		return "board/mTMIInsertForm";
	}

}
