package com.kh.meetAgain.serviceCenter.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.meetAgain.common.util.Utils;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.serviceCenter.model.service.ServCenterService;

@Controller
public class ServiceController {
	
	@Autowired ServCenterService scs;
	
	@RequestMapping("serviceCenter/faq.do")
	public String faq() {
		return "serviceCenter/faq";
	}

	@RequestMapping("serviceCenter/otoInquiry.do")
	public String otoInquiry() {
		return "serviceCenter/otoInquiry";
	}

	@RequestMapping("serviceCenter/reportStatus.do")
	public String reportStatus(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model, HttpSession session) {
		// 한 페이지 당 게시글 수 
		int numPerPage = 10; // limit 역할

		Member m = (Member)session.getAttribute("member");
		String userId = m.getUserId();
		// 1. 현재 페이지 게시글 목록 가져오기
		// 실제 데이터베이스의 데이터에서
		// 머릿글 : 키(key) , 실제 값 : 값(value) => 여러 개니까 List에 담기
		List<Map<String, String>> list = scs.selectReportList(cPage, numPerPage, userId);

		// 2. 페이지 계산을 위한 총 페이지 개수
		int totalContents = scs.selectReportTotalContents(userId);

		// 3. 패아자 HTML 생성
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "reportStatus.do");
		model.addAttribute("list", list);

		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "serviceCenter/reportStatus";
	}
}
