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
import com.kh.meetAgain.admin.model.vo.Report;
import com.kh.meetAgain.common.util.Utils;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.sgroup.model.vo.GB_comment;
import com.kh.meetAgain.sgroup.model.vo.Gboard;
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
	public String adBoardDetail(@RequestParam int rcId, Model model) {
		Report r = adminService.selectOneBoard(rcId);
		model.addAttribute("report", r);
		return "admin/adBoardDetail";
	}
	@RequestMapping("/admin/adBoardManage.do")
	public String adBoardManage(@RequestParam(value="cPage", required=false, defaultValue="1")
			int cPage, Model model
			) {
			// 한 페이지 당 게시글 수 
			int numPerPage = 10; // limit 역할
			
			// 1. 현재 페이지 게시글 목록 가져오기
			// 실제 데이터베이스의 데이터에서
			// 머릿글 : 키(key) , 실제 값 : 값(value) => 여러 개니까 List에 담기
			List<Map<String, String>> list
				= adminService.selectBoardList(cPage, numPerPage);
			
			// 2. 페이지 계산을 위한 총 페이지 개수
			int totalContents = adminService.selectBoardTotalContents();
			
			// 3. 패아자 HTML 생성
			String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adBoardManage.do");
			
			model.addAttribute("list", list);
			
			model.addAttribute("totalContents", totalContents);
			model.addAttribute("numPerPage", numPerPage);
			model.addAttribute("pageBar", pageBar);
		return "admin/adBoardManage";
	}
	@RequestMapping("/admin/adCommentDetail.do")
	public String adCommentDetail(@RequestParam int rcId, Model model) {
		Report r = adminService.selectOneComment(rcId);
		model.addAttribute("report", r);
		return "admin/adCommentDetail";
	}
	@RequestMapping("/admin/adCommentManage.do")
	public String adCommentManage(@RequestParam(value="cPage", required=false, defaultValue="1")
	int cPage, Model model
	) {
	// 한 페이지 당 게시글 수 
	int numPerPage = 10; // limit 역할
	
	// 1. 현재 페이지 게시글 목록 가져오기
	// 실제 데이터베이스의 데이터에서
	// 머릿글 : 키(key) , 실제 값 : 값(value) => 여러 개니까 List에 담기
	List<Map<String, String>> list
		= adminService.selectCommentList(cPage, numPerPage);
	
	// 2. 페이지 계산을 위한 총 페이지 개수
	int totalContents = adminService.selectCommentTotalContents();
	
	// 3. 패아자 HTML 생성
	String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adCommentManage.do");
	
	model.addAttribute("list", list);
	
	model.addAttribute("totalContents", totalContents);
	model.addAttribute("numPerPage", numPerPage);
	model.addAttribute("pageBar", pageBar);
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
	@RequestMapping("/admin/adMemberDetail.do")
	public String adMemberDetail(@RequestParam String userId, Model model) {
		Member m = adminService.selectOneMember(userId);
		model.addAttribute("member", m);
		return "admin/adMemberDetail";
	}
	@RequestMapping("/admin/adMemberManage.do")
	public String adMemberManage(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		int numPerPage = 10;
		
		List<Map<String, String>> list = adminService.selectMemberList(cPage, numPerPage);
		
		int totalContents = adminService.selectMemberTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adMemberManage.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
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
	String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adNoticeManage.do");
	
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
	@RequestMapping("/admin/reportReject.do")
	public String reportReject(Report report, Model model) {
		int result = adminService.reportReject(report);
		String msg = "";
		String loc = "/";
		if(result > 0) {
			msg="신고 처리를 완료하였습니다.";
			if(report.getCId()>0) {
				loc= "/admin/adCommentManage.do";
			}else {
				loc= "/admin/adBoardManage.do";
			}
		}else {
			msg = "신고 처리에 실패하였습니다 .다시 시도해주세요.";
			if(report.getCId()>0) {
				loc= "/admin/adCommentManage.do";
			}else {
				loc= "/admin/adBoardManage.do";
			}
			
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
		
	}
	@RequestMapping("/admin/reportUpdate.do")
	public String reportUdpate(@RequestParam int warn_cnt, @RequestParam String doDelete,GB_comment gbComment,
			Gboard gboard, Member member, Report report, Model model) {
		int result = adminService.reportUpdate(report, member, warn_cnt);
		int result2 = 0;
		System.out.println(doDelete);
		if(report.getCId()>0 && doDelete.equals("on")) {
			result2 = adminService.gcDelUpdate(gbComment);
		}else if(doDelete.equals("on")) {
			result2 = adminService.gbDelUpdate(gboard);
		}
		System.out.println(report.getWarn_cnt());
		System.out.println(member.getWarn_Cnt());
		String msg = "";
		String loc = "/";
		if(result > 0 && result2 > 0) {
			msg="신고 처리를 완료하였습니다.";
			if(report.getCId()>0) {
				loc= "/admin/adCommentManage.do";
			}else {
				loc= "/admin/adBoardManage.do";
			}
		}else {
			msg = "신고 처리에 실패하였습니다 .다시 시도해주세요.";
			if(report.getCId()>0) {
				loc= "/admin/adCommentManage.do";
			}else {
				loc= "/admin/adBoardManage.do";
			}
			
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	@RequestMapping("admin/adMemberManageOrder.do")
	public String adMemberManageOrder(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String orderBy,@RequestParam String howOrder,Member member, Model model) {
		int numPerPage = 10;
		Map<String, String> map = new HashMap<String, String>();
		map.put("orderBy", orderBy);
		map.put("howOrder", howOrder);
		List<Map<String, String>> list = adminService.selectMemberOrderList(cPage, numPerPage, map);
		
		int totalContents = adminService.selectMemberTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adMemberManage.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		return "admin/adMemberManage";
	}

}
