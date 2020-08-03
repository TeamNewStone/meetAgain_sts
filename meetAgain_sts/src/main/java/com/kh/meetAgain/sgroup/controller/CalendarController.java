package com.kh.meetAgain.sgroup.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.meetAgain.sgroup.model.service.SgroupService;
import com.kh.meetAgain.sgroup.model.vo.Calendar;

@Controller

public class CalendarController {
	
	@Autowired
	SgroupService sgroupService;	
	
	@RequestMapping("sgroup/addCalendar.do")
	public String addCalendar(
				// @RequestParam String gid,
				@RequestParam String gdate,
				@RequestParam String gdateEnd,
				@RequestParam String ginfo,
				@RequestParam String gtime,
				@RequestParam(required = false, defaultValue = "N") String isctn) {

		System.out.println(gtime); // 12:01
		//***************gid임의지정
		String gid = "1";		
		
		Date date = Date.valueOf(gdate);
		Date date2 = Date.valueOf(gdateEnd);
		int hour = Integer.parseInt(gtime.substring(0, 2));
		int min = Integer.parseInt(gtime.substring(3));
		
		Timestamp time = Timestamp.valueOf(date.toString() + " " + hour + ":" + min + ":00"); // 20: + 14 + :00
				
		System.out.println(min);
		
		System.out.println(time);

		Calendar cal = new Calendar(null, date, date2, ginfo, time, isctn);
		
		cal.setGid(gid);
		int result = sgroupService.addCalendar(cal);	
						
		String addMsg = "";

		if (result >0) {
			addMsg = "일정 생성됨";
			System.out.println("일정 생성됨");
		} else {
			addMsg = "생성 실패";
			System.out.println("생성 실패");
		}
		
		return "redirect:groupCalendar.do";	
	}
	
	@RequestMapping("sgroup/groupCalendar.do")
	public String loadList(Model model) {
		
		// 일정 조회
		List<Calendar> list = new ArrayList<Calendar>(); 

		list = sgroupService.loadList();

		System.out.println("\n" + list);
		System.out.println("controller");

		model.addAttribute("sclist", list);
		
		return "sgroup/groupCalendar";	

	}
	 
}
