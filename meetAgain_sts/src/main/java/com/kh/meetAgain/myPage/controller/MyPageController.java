package com.kh.meetAgain.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MyPageController {
	@RequestMapping("myPage/mapMaker.do")
	public String mapMaker() {
		return "Mypage/mapMaker";
	}
	@RequestMapping("myPage/myPage1.do")
	public String myPage1() {
		return "myPage/myPage1";
	}
	@RequestMapping("myPage/myPage2.do")
	public String myPage2() {
		return "myPage/myPage2";
	}
	@RequestMapping("myPage/myPageOther.do")
	public String myPageOther() {
		return "myPage/myPageOther";
	}
	@RequestMapping("myPage/test_groupMap.do")
	public String test_groupMap() {
		return "myPage/test_groupMap";
	}

}
