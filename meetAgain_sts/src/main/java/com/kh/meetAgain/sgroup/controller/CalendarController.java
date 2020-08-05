package com.kh.meetAgain.sgroup.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.kh.meetAgain.sgroup.model.service.SgroupService;
import com.kh.meetAgain.sgroup.model.vo.Calendar;

@Controller
@SessionAttributes(value= {"member", "gid"})
public class CalendarController {
	
	@Autowired
	SgroupService sgroupService;	
	 
	@RequestMapping("sgroup/addCalendar.do")
	public String addCalendar(
				@RequestParam("gId") String gId,
				@RequestParam("gDate") String gDate,
				@RequestParam("gDateEnd") String gDateEnd,
				@RequestParam("gInfo") String gInfo,
				@RequestParam("gTime") String gTime,
				@RequestParam(value="isCtn", required = false, defaultValue = "N") String isCtn) {

		// System.out.println(gTime); // 12:01
		//***************gid임의지정
		//String gid = "1";		

		Date date = Date.valueOf(gDate);
		Date date2 = Date.valueOf(gDateEnd);
		int hour = Integer.parseInt(gTime.substring(0, 2));
		int min = Integer.parseInt(gTime.substring(3));
		
		Timestamp time = Timestamp.valueOf(date.toString() + " " + hour + ":" + min + ":00"); // 20: + 14 + :00
				
//		System.out.println(hour);
//		System.out.println(min);		
//		System.out.println(time);

		Calendar cal = new Calendar();
		
		cal.setGId(gId);
		cal.setGDate(date);
		cal.setGDateEnd(date2);
		cal.setGInfo(gInfo);
		cal.setGTime(time);
		cal.setIsCtn(isCtn);		
		
		System.out.println("insert 확인 : " + cal);
		
		//cal.setGId(gId);

		sgroupService.addCalendar(cal);	

		/*		
		String addMsg = "";

		if (result > 0) {
			addMsg = "일정 생성됨";
			System.out.println("일정 생성됨");
		} else {
			addMsg = "생성 실패";
			System.out.println("생성 실패");
		} */
		
		return "redirect:groupCalendar.do";	
	}
	
	@RequestMapping("sgroup/groupCalendar.do")
	public String loadList(@RequestParam String gid, Model model) {
		
		// 일정 조회
		List<Calendar> list = new ArrayList<Calendar>(); 

		list = sgroupService.loadList();

		System.out.println("\n" + list);
		System.out.println("controller");

		model.addAttribute("sclist", list);
		model.addAttribute("gid", gid);
		
		return "sgroup/groupCalendar";	

	}
	
	@RequestMapping("sgroup/deleteCalendar.do")
	//@RequestBody
	// 일정 제거
	public String deleteCalendar(@RequestParam String cdId, Model model) {

		int sendResult = sgroupService.deleteCalendar(cdId);
		
		System.out.println(sendResult);
		
		model.addAttribute("cdId", cdId);
		
		return "sgroup/groupCalendar";		
	}
	 
}

