package com.kh.meetAgain.sgroup.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.meetAgain.sgroup.model.service.SgroupService;
import com.kh.meetAgain.sgroup.model.vo.Joing;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;

@SessionAttributes(value= {"member", "gid"})
@Controller
public class MapContoller {

	@Autowired
	SgroupService sgroupService;

	@RequestMapping("/sgroup/groupMap.do")
	public Map<String, Object> groupMap(@RequestParam("gid") String gid, String userId, Model model) {
		System.out.println("컨트롤러 : " + gid);
		// 등록 주소 가져오기				
		Sgroup list = sgroupService.createMapList(gid);		
		
		Joing jg = new Joing();
						
		// 모임장 정보				
		Map<String, Object> map = new HashMap<String, Object>();
		
		// map.get("userId");
		map.put("gId", gid);
		map.put("userId", userId);
		
		System.out.println("ㅋ너트롤러 맵 " + map);
		int result = sgroupService.meetingPlaceMasterStatus(map);
						
		model.addAttribute("sg", list);
		model.addAttribute("jg", map);
		
		System.out.println("controller map result → "+ list);		
		System.out.println("controller meetingPlaceStatus result → " + map);
		
		return map;
	}
	
}
