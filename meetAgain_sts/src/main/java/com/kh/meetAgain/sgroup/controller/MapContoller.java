package com.kh.meetAgain.sgroup.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.meetAgain.sgroup.model.service.SgroupService;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;

@SessionAttributes(value= {"member", "gid"})
@Controller
public class MapContoller {

	@Autowired
	SgroupService sgroupService;

	@RequestMapping("/sgroup/groupMap.do")
	public String groupMap(@RequestParam("gid") String gid, Model model, Sgroup sgw) {
		System.out.println(gid);
		// 등록 주소 가져오기
		Sgroup list = new Sgroup();

		list = sgroupService.createMapList(gid);

		System.out.println("\n" + list);
		System.out.println(" ↑ controller map");

		model.addAttribute("sg", list);
		model.addAttribute("gid", gid);
		
		return "sgroup/groupMap";
	}
	
}
