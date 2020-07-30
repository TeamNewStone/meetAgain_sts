package com.kh.meetAgain.sgroup.controller;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.meetAgain.sgroup.model.service.SgroupService;
import com.kh.meetAgain.sgroup.model.vo.Calendar;

@Controller

public class CalendarController {
	
	@Autowired
	SgroupService sgroupService;	
	
	@RequestMapping("sgroup/addCalendar.do")
	public String addCalendar(Calendar calendar) {
		
		String s = "[HH:mm]";
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm", Locale.KOREA);
		long ms;
		
		try {
			ms = sdf.parse(s).getTime();
			Time t = new Time(ms);		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		calendar.setGid("001");
		System.out.println("controller : " + calendar);
		int result = sgroupService.addCalendar(calendar);
		/* List<Calendar> list = sgroupService.addCalendar(); */
		
		return "redirect:groupCalendar.do";	
	}
	
}
