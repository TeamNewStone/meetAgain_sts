package com.kh.meetAgain.member.controller;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.meetAgain.member.model.service.MemberService;
import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.member.model.vo.UserTMI;


@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "member/memberInsertForm.do", method= RequestMethod.POST)
	public String memberInsertForm(@RequestParam String email,
			@RequestParam String name, @RequestParam String gender, @RequestParam String age,
			@RequestParam String birth, Model model) {
		

		System.out.println(email+name+gender+age+birth);

		model.addAttribute("email",email);
		model.addAttribute("name",name);
		model.addAttribute("gender",gender);
		model.addAttribute("age",age);
		model.addAttribute("birth",birth);
		
		return "member/memberInsertForm";
	}
	@RequestMapping("member/memberInsertSuccess.do")
	public String memberInsertSuccess() {
		return "member/memberInsertSuccess";
	}
	@RequestMapping("member/mTMIInsertForm.do")
	public String mTMIInsertForm() {
		return "member/mTMIInsertForm";
	}
	
	@RequestMapping("member/membership.do")
	public String membership() {
		return "member/membership";
	}
	@RequestMapping("member/login.do")
	public String login() {
		return "member/login";
	}
	@RequestMapping("member/callBack.do")
	public String callback() {
		return "member/callBack";
	}
	
	@RequestMapping("/member/checkNnDuplicate.do")
	@ResponseBody
	public Map<String, Object> responseBodyProcess(@RequestParam String nickName){
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		boolean isUsable = memberService.checkNnDuplicate(nickName) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		// @ResponseBody 는 결과가 viewResolver로 가지 않고,
		// 직접 그 결과 자체를 화면으로 전달한다.
		return map;
	}
	
	@RequestMapping("member/mUpdate.do")
	public String mUpdate(Member member, Model model) {
		int result = memberService.mUpdate(member);
		String loc="/";
		String msg="";
		
		if(result > 0) {
			msg = "정보 수정이 완료되었습니다";
		}else {
			msg = "정보 수정 중 오류가 발생하였습니다. 다시 시도해주세요.";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}

	@RequestMapping(value = "/member/selectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> selectOne(HttpServletRequest request) {
		String email = request.getParameter("email");
		System.out.println(email);
		Map<String, Object> map = new HashMap<String,Object>(); 
		boolean isNew = memberService.selectOne(email)==null ? true : false;
		
		map.put("isNew", isNew);
		
		return map;
	}
	
	@RequestMapping("/member/mTMIUpdate.do")
	public String mTMIUpdate(UserTMI userTMI, Model model) {
		
		System.out.println("MemberController test3 : "+userTMI);
		int result = memberService.mTMIUpdate(userTMI);
		int result2 = 0;

		String loc="/";
		String msg="";
		
		if(result > 0) {
			msg="정보 수정이 완료되었습니다.";
		}else {
			msg="정보 수정 중 오류가 발생하였습니다. 다시 시도해 주세요.";
		}
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/mCateUpdate.do")
	public String mCateUpdate(CateInfo cateInfo, Model model,
			@RequestParam("cateId") String[] cateId) {
		
		System.out.println("cateInfo : " + cateInfo);
		
		int result = memberService.mCateUpdate(cateInfo, cateId);
		String loc = "/";
		String msg="";
		if(result > 0) {
			loc="/member/mTMIUpdate.do";			
		}else {
			msg="정보 수정 중 오류가 발생하였습니다. 다시 시도해주세요.";
		}
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		return "common/msg";
	}
}
