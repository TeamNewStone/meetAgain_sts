package com.kh.meetAgain.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.meetAgain.admin.model.service.AdminService;

@Controller
public class AdminController {

	@Autowired AdminService adminService;
	
	@RequestMapping("admin/adLogin.do")
	public String adLogin() {
		return "admin/adLogin";
	}
	@RequestMapping("admin/adminLogin.do")
	public String adminLogin(@RequestParam String adminId, @RequestParam String adminBirthday, @RequestParam String adminEmail, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("adminId", adminId);
		map.put("adminBirthday", adminBirthday);
		map.put("adminEmail", adminEmail);
		int result = adminService.selectAdmin(map);
		String msg="";
		String loc="/";
		if(result > 0) {
			msg="관리자 로그인 성공!";
			loc="/admin/adMain.do";
		}else {
			msg="로그인에 실패하였습니다. 입력 정보를 다시 확인해주세요.";
			loc="/admin/adLogin.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	@RequestMapping("admin/adMain.do")
	public String adMain() {
		return "admin/adMain";
	}
	@RequestMapping("admin/adBoardManage.do")
	public String adBoardManage() {
		return "admin/adBoardManage";
	}
	@RequestMapping("admin/adCommentManage.do")
	public String adCommentManage() {
		return "admin/adCommentManage";
	}
	@RequestMapping("admin/adMemberManage.do")
	public String adMemberManage() {
		return "admin/adMemberManage";
	}
	@RequestMapping("admin/adGroupManage1.do")
	public String adGroupManage1() {
		return "admin/adGroupManage1";
	}
	@RequestMapping("admin/adGroupManage2.do")
	public String adGroupManage2() {
		return "admin/adGroupManage2";
	}
	@RequestMapping("admin/adNoticeManage.do")
	public String adNoticeManage() {
		return "admin/adNoticeManage";
	}
}
