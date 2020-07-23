package com.kh.meetAgain.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class BoardController {

	@RequestMapping("board/faq.do")
	public String faq() {
		
		return "board/faq";
	}
	@RequestMapping("board/notice.do")
	public String notice() {
		
		return "board/notice";
	}
	@RequestMapping("board/noticeDetail.do")
	public String noticeDetail() {
		
		return "board/noticeDetail";
	}
	@RequestMapping("board/review.do")
	public String review() {
		
		return "board/review";
	}
	
}
