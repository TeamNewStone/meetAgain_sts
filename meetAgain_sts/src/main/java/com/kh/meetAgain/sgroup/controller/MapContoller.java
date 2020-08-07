package com.kh.meetAgain.sgroup.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.sgroup.model.service.SgroupService;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;

@SessionAttributes(value= {"member", "gid"})
@Controller
public class MapContoller {

	@Autowired
	SgroupService sgroupService;

	@RequestMapping("/sgroup/groupMap.do")
	public String groupMap(
					@RequestParam("gid") String gId,					
					@ModelAttribute("member") Member m, Model model) {
		System.out.println("컨트롤러 m 출력 : "+m);
		// 등록 주소 가져오기				
		String userId = m.getUserId();
		
		Sgroup sg = sgroupService.getMyPlace(gId);
		
		System.out.println("컨트롤러장소 : " + sg);

		// 모임장 정보				
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("gid", gId);
		map.put("userId", userId);
		
		int result = sgroupService.meetingPlaceMasterStatus(map);		
		
		System.out.println("컨트롤러 맵 " + map);	
		
		model.addAttribute("gPlace", sg.getGPlace() );
		
		return "sgroup/groupMap";
	}
	
}
