package com.kh.meetAgain.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.meetAgain.board.model.service.BoardService;
import com.kh.meetAgain.myPage.model.vo.Review;

@Controller
public class MainController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("selectRvtop3.do")
	@ResponseBody
	public Map<String, Object> mainPage() {
		Map<String,Object> map = new HashMap<String,Object>();
		
		List<Review> rvtop3 = new ArrayList<Review>();
		rvtop3 = boardService.selectTop3rv();
		
		map.put("review", rvtop3);
		System.out.println(rvtop3);
		return map;	
	}
}
