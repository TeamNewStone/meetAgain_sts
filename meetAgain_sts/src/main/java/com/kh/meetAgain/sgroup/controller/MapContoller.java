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
import com.kh.meetAgain.sgroup.model.vo.Joing;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;

@SessionAttributes(value= {"member", "gid"})
@Controller
public class MapContoller {

	@Autowired
	SgroupService sgroupService;

	@RequestMapping("/sgroup/groupMap.do")
	public String groupMap(
					@RequestParam("gid") String gId,
					@ModelAttribute("member") Member m, Sgroup sg) {
		System.out.println("컨트롤러 m 출력 : "+m);
		// 등록 주소 가져오기				
		String userId = m.getUserId();
		String gPlace = sg.getGPlace();
		
		System.out.println(gPlace);
		
//		Sgroup list = sgroupService.createMapList(gId);		
//		System.out.println("컨트롤러 : " + gId);
		
		Joing jg = new Joing();
		
		jg.setGId(gId);
		jg.setUserId(userId);
						
		// 모임장 정보				
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("gid", gId);
		map.put("userId", userId);
		map.put("gPlace", gPlace);
		
		int result = sgroupService.meetingPlaceMasterStatus(map);		
		
		System.out.println("컨트롤러 맵 " + map);	
		
		return "sgroup/groupMap";
	}
	
}
