package com.kh.meetAgain.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.meetAgain.admin.model.service.AdminService;
import com.kh.meetAgain.board.model.vo.Board;
import com.kh.meetAgain.common.util.Utils;
import com.kh.meetAgain.member.model.vo.Member;
@SessionAttributes(value= {"member"})
@Controller
public class AdminController {
	
	@Autowired AdminService adminService;

	@RequestMapping("/admin/adLogin.do")
	public String adLogin() {
		return "admin/adLogin";
	}
	@RequestMapping("/admin/adminLogin.do")
	public String adminLogin(@RequestParam String adminId, @RequestParam String adminBirthday, @RequestParam String adminEmail, Model model) {
		ModelAndView mav = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		map.put("adminId", adminId);
		map.put("adminBirthday", adminBirthday);
		map.put("adminEmail", adminEmail);
		int result = adminService.selectAdmin(map);
		Member m = adminService.selectOneAdmin(map);
		String msg = "";
		String loc = "/";
		if(result > 0) {
			msg = "관리자 로그인 성공!";
			loc="/admin/adMain.do";
		}else {
			msg = "입력정보를 다시 한번 확인해 주세요.";
			loc="/admin/adLogin.do";
		}
		System.out.println(m);
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		model.addAttribute("member", m);
		return "common/msg";
	}
	@RequestMapping("/admin/adBoardDetail.do")
	public String adBoardDetail() {
		return "admin/adBoardDetail";
	}
	@RequestMapping("/admin/adBoardManage.do")
	public String adBoardManage() {
		return "admin/adBoardManage";
	}
	@RequestMapping("/admin/adCommentDetail.do")
	public String adCommentDetail() {
		return "admin/adCommentDetail";
	}
	@RequestMapping("/admin/adCommentManage.do")
	public String adCommentManage() {
		return "admin/adCommentManage";
	}
	@RequestMapping("/admin/adGroupManage1.do")
	public String adGroupManage1() {
		return "admin/adGroupManage1";
	}
	@RequestMapping("/admin/adGroupManage2.do")
	public String adGroupManage2() {
		return "admin/adGroupManage2";
	}
	@RequestMapping("/admin/adMain.do")
	public String adMain() {
		return "admin/adMain";
	}
	@RequestMapping("/admin/adMemeberDetail.do")
	public String adMemberDetail() {
		return "admin/adMemberDetail";
	}
	@RequestMapping("/admin/adMemberManage.do")
	public String adMemberManage() {
		return "admin/adMemberManage";
	}
	@RequestMapping("/admin/adNoticeManage.do")
	public String adNoticeManage(@RequestParam(value="cPage", required=false, defaultValue="1")
	int cPage, Model model
	) {
	// 한 페이지 당 게시글 수 
	int numPerPage = 10; // limit 역할
	
	// 1. 현재 페이지 게시글 목록 가져오기
	// 실제 데이터베이스의 데이터에서
	// 머릿글 : 키(key) , 실제 값 : 값(value) => 여러 개니까 List에 담기
	List<Map<String, String>> list
		= adminService.selectNoticeList(cPage, numPerPage);
	
	// 2. 페이지 계산을 위한 총 페이지 개수
	int totalContents = adminService.selectNoticeTotalContents();
	
	// 3. 패아자 HTML 생성
	String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "notice.do");
	
	model.addAttribute("list", list);
	
	model.addAttribute("totalContents", totalContents);
	model.addAttribute("numPerPage", numPerPage);
	model.addAttribute("pageBar", pageBar);
		return "admin/adNoticeManage";
	}
	@RequestMapping("/admin/logout.do")
	public String memberLogout(SessionStatus status) {
		// SessionStatus 는 현재 사용자가 접속한 웹 브라우저와
		// 서버 사이의 세션의 설정을 가지는 객체
		// 세션이 아직 완료되지 않았다면 세션을 종료시켜라!
		if(! status.isComplete())
			status.setComplete();
		
		return "admin/adLogin";
	}

}
