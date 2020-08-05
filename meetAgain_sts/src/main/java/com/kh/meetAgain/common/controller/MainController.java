package com.kh.meetAgain.common.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.meetAgain.board.model.service.BoardService;
import com.kh.meetAgain.board.model.vo.Board;
import com.kh.meetAgain.myPage.model.vo.Review;

@Controller
public class MainController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("selectRvtop3.do")
	@ResponseBody
	public Map<String, Object> rvTop3() {
		Map<String,Object> map = new HashMap<String,Object>();
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");		
		String[] sdate = new String[3];
		String[] edate = new String[3];
		
		List<Review> rvtop3 = new ArrayList<Review>();
		rvtop3 = boardService.selectTop3rv();
		
		for(int i=0; i<rvtop3.size(); i++) {
			
			sdate[i] = sdFormat.format(rvtop3.get(i).getCreateDate());
			edate[i] = sdFormat.format(rvtop3.get(i).getDurate());
		}
		
		map.put("sdate",sdate);
		map.put("edate",edate);
		map.put("review", rvtop3);
		
		return map;	
	}
	
	@RequestMapping("selectAdtop3.do")
	@ResponseBody
	public Map<String, Object> adTop3() {
		Map<String,Object> map = new HashMap<String,Object>();
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");		
		String[] date = new String[3];
		
		List<Board> adtop3 = new ArrayList<Board>();
		adtop3 = boardService.selectTop3ad();
		
		for(int i=0; i<adtop3.size(); i++) {
		
			date[i] = sdFormat.format(adtop3.get(i).getBDate());
			
		}
		map.put("boardDate",date);
		map.put("adboard", adtop3);
		
		return map;	
	}
}
