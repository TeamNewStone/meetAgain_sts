package com.kh.meetAgain.sgroup.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
					@ModelAttribute("member") Member m, Model model) {
		System.out.println("컨트롤러 m 출력 : "+m);

		String userId = m.getUserId();
		Sgroup sr = sgroupService.selectOneSgroup(gId);
		// 등록 주소 가져오기				
		Sgroup sg = sgroupService.getMyPlace(gId);
				
		// 모임장 정보				
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("gid", gId);
		map.put("userId", userId);
		
		int mapResult = sgroupService.getMasterStatus(map);
		/////결과 : 모임장일경우 1, 아닐경우 0

		System.out.println("mapResult : " + mapResult);
		
		boolean result = (mapResult==1) ? true : false;
		
		model.addAttribute("gPlace", sg.getGPlace() );
 		model.addAttribute("isCptc",  result);
 		model.addAttribute("sgroup",sr);
		
		System.out.println(map);
		
		return "sgroup/groupMap";
	}

	@PostMapping("/sgroup/mapPlaceUpdate.do")
	public String mapPlaceUpdate(@RequestParam("gid") String gId1, @RequestParam("gPlace") String gPlace1, Model model) {
		
		System.out.println("gid : " + gId1 + ", " + "gPlace : " + gPlace1);		

		Map<String, String> map = new HashMap<String, String>();
		
		map.put("gid", gId1); // gid 세션
		map.put("gPlace", gPlace1); // 주소
		
		int result = sgroupService.groupMapUpdate(map);

		String msg = "";
		
		if(result > 0) msg = "반환";		
		else	 msg = "반환실패";
		System.out.println("결과 : " + msg);
		
		model.addAttribute("gid", gId1);
		model.addAttribute("gPlace", gPlace1);
		
		System.out.println("gid : " + gId1);
		System.out.println("gPlaceresulst : " + gPlace1);
		
		return "sgroup/groupMap";
	}
	
}

