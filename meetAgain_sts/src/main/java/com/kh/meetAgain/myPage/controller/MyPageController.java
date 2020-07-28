package com.kh.meetAgain.myPage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.meetAgain.common.util.Utils;
import com.kh.meetAgain.myPage.model.service.MyPageService;


@Controller
public class MyPageController {
	
	
	  @Autowired MyPageService mpSvc;
	 
	
	@RequestMapping("myPage/myPage1.do")
	public String myPage1(@RequestParam(value="cPage", required=false, defaultValue="1")
	int cPage, Model model) {

		// 한 페이지 당 게시글 수 
		int numPerPage = 10; // limit 역할
		
		// 1. 현재 페이지 게시글 목록 가져오기
		// 실제 데이터베이스의 데이터에서
		// 머릿글 : 키(key) , 실제 값 : 값(value) => 여러 개니까 List에 담기
		List<Map<String, String>> list
			= mpSvc.selectMyBoardList(cPage, numPerPage);
		
		// 2. 페이지 계산을 위한 총 페이지 개수
		int totalContents = mpSvc.selectMyBoardTotalContents();
		
		// 3. 패아자 HTML 생성
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myPage1.do");
		System.out.println("controller : "+list);
		
		model.addAttribute("list", list);
		
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		

		
		return "myPage/myPage1";
	}
	
	/*
	 * @RequestMapping("myPage/myPage1.do") public String myPage1(
	 * 
	 * @RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
	 * Model model) {
	 * 
	 * // 한 페이지 당 게시글 수 int numPerPage = 10; // limit 역할
	 * 
	 * // 1. 현재 페이지 게시글 목록 가져오기 List<Map<String, String>> list =
	 * boardService.selectBoardList(cPage, numPerPage);
	 * 
	 * // 2. 페이지 계산을 위한 총 패이지 갯수 int totalContents =
	 * boardService.selectBoardTotalContents();
	 * 
	 * // 3. 페이지 HTML 생성 String pageBar = Utils.getPageBar(totalContents, cPage,
	 * numPerPage, "boardList.do");
	 * 
	 * model.addAttribute("list", list) .addAttribute("totalContents",
	 * totalContents) .addAttribute("numPerPage", numPerPage)
	 * .addAttribute("pageBar", pageBar);
	 * 
	 * return "myPage/myPage1"; }
	 */
	
	@RequestMapping("myPage/myPage2.do")
	public String myPage2() {
		return "myPage/myPage2";
	}
	@RequestMapping("myPage/myPageOther.do")
	public String myPageOther() {
		return "myPage/myPageOther";
	}	

}
