package com.kh.meetAgain.sgroup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class SgroupController {

	@RequestMapping("sgroup/create.do")
	public String create() {
		return "sgroup/create";
	}
	@RequestMapping("sgroup/group.do")
	public String group() {
		return "sgroup/group";
	}
	@RequestMapping("sgroup/groupAlbum.do")
	public String groupAlbum() {
		return "sgroup/groupAlbum";
	}
	@RequestMapping("sgroup/groupBoard.do")
	public String groupBoard() {
		return "sgroup/groupBoard";
	}
	@RequestMapping("sgroup/groupCalendar.do")
	public String groupCalendar() {
		return "sgroup/groupCalendar";
	}
	@RequestMapping("sgroup/groupDetail")
	public String groupDetail() {
		return "sgroup/groupDetail";
	}
	@RequestMapping("sgroup/groupInfo")
	public String groupInfo() {
		return "sgroup/groupInfo";
	}
	@RequestMapping("sgroup/groupMap")
	public String groupMap() {
		return "sgroup/groupMap";
	}
	@RequestMapping("sgroup/memberList")
	public String memberList() {
		return "sgroup/memberList";
	}
	
}
