package com.kh.meetAgain.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.meetAgain.board.model.service.BoardService;
import com.kh.meetAgain.board.model.vo.Board;
import com.kh.meetAgain.common.util.Utils;
import com.kh.meetAgain.myPage.model.vo.Review;


@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;

	@RequestMapping("board/notice.do")
	public String notice(
			@RequestParam(value="cPage", required=false, defaultValue="1")
			int cPage, Model model
		) {
		// 한 페이지 당 게시글 수 
		int numPerPage = 10; // limit 역할
		
		// 1. 현재 페이지 게시글 목록 가져오기
		// 실제 데이터베이스의 데이터에서
		// 머릿글 : 키(key) , 실제 값 : 값(value) => 여러 개니까 List에 담기
		List<Map<String, String>> list
			= boardService.selectBoardList(cPage, numPerPage);
		
		// 2. 페이지 계산을 위한 총 페이지 개수
		int totalContents = boardService.selectBoardTotalContents();
		
		// 3. 패아자 HTML 생성
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "notice.do");
		
		model.addAttribute("list", list);
		
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		return "board/notice";
	}
	@RequestMapping("board/noticeDetail.do")
	public String noticeDetail(@RequestParam int bId, Model model) {
		
		Board b = boardService.SelectOneBoard(bId);
		int bRate = 0;
		if(!(b.getUserId()=="meetAgainAdmin")) {
			bRate = boardService.updateReadCount(bId); 			
		}
		model.addAttribute("bRate",bRate);

		
		model.addAttribute("board", b);
		
		return "board/noticeDetail";
	}
	
	@RequestMapping("board/noticeInsert.do")
	public String noticeInsert() {
		
		return "board/noticeInsert";
	}
	
	@RequestMapping("board/nInsert.do")
	public String nInsert(Board board, Model model) {
		
		int result = boardService.insertBoard(board);
		
		
		String loc = "/board/notice.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 등록 성공!";
			loc = "/board/noticeDetail.do?bId="+board.getBId();
			
		} else {
			msg = "게시글 등록 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	@RequestMapping("board/noticeUpdate.do")
	public String noticeUpdate(@RequestParam int bId, Model model) {
		model.addAttribute("board", boardService.SelectOneBoard(bId));
		return "board/noticeUpdateForm";
	}
	
	@RequestMapping("board/nUpdate.do")
	public String nUpdate(Board board, Model model) {
		int result = boardService.updateBoard(board);
		
		String loc = "/board/notice.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 수정이 완료되었습니다";
			loc = "/board/noticeDetail.do?bId="+board.getBId();
		} else {
			msg = "게시글 수정 실패. 다시 시도해주세요";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("board/review.do")
	public String review(Model model) {
		List<Review> rvlist = new ArrayList<Review>();
		
		rvlist = boardService.selectReviewList();
		System.out.println(rvlist);
		model.addAttribute("rvlist", rvlist);
		return "board/review";
	}
	
}
