package com.kh.meetAgain.sgroup.controller;

import java.sql.Timestamp;
import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
				@RequestParam String ginfo,
				@RequestParam String gdate, 
				@RequestParam String gtime,
				@RequestParam(required = false, defaultValue = "N") String isctn) {

		System.out.println(gtime); // 12:01
		
		Date date = Date.valueOf(gdate);
		int hour = Integer.parseInt(gtime.substring(0, 2));
		int min = Integer.parseInt(gtime.substring(3));
		
		Timestamp time = Timestamp.valueOf(date.toString() + " " + hour + ":" + min + ":00"); // 20: + 14 + :00
				
		System.out.println(min);
		//Timestamp time1 = Timestamp.valueOf(hour + ":" + min+":00");
		
		//System.out.println(date.toString());
		System.out.println(time);

		Calendar cal = new Calendar(null, date, ginfo, null, time, isctn);
		
		int result = sgroupService.addCalendar(cal);	
						
		String addMsg = "";
		
		/*
		if (result >0) {
			addMsg = "일정 생성됨";
			System.out.println("일정 생성됨");
		} else {
			addMsg = "생성 실패";
			System.out.println("생성 실패");
		}
		*/
		
		return "redirect:groupCalendar.do";	
	}

}
