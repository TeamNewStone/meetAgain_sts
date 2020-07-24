package com.kh.meetAgain.serviceCenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ServiceController {
	@RequestMapping("serviceCenter/faq.do")
	public String faq() {
		return "serviceCenter/faq";
	}
	
	@RequestMapping("serviceCenter/otoInquiry.do")
	public String otoInquiry() {
		return "serviceCenter/otoInquiry";
	}
	
	@RequestMapping("serviceCenter/reportStatus.do")
	public String reportStatus() {
		return "serviceCenter/reportStatus";
	}
}
