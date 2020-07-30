package com.kh.meetAgain.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("admin/adLogin.do")
	public String adLogin() {
		return "admin/adLogin";
	}
}
