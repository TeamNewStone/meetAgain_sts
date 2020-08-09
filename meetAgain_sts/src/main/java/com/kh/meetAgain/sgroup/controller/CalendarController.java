package com.kh.meetAgain.sgroup.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.sgroup.model.service.SgroupService;
import com.kh.meetAgain.sgroup.model.vo.Calendar;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;

@Controller
@SessionAttributes(value= {"member", "gid"}) // 페이지 세션
public class CalendarController {
	
	@Autowired
	SgroupService sgroupService;	
	 
	@PostMapping("sgroup/addCalendar.do")	
	public String addCalendar(		
				@RequestParam("gid") String gId,
				@RequestParam("gDate") String gDate,
				@RequestParam("gDateEnd") String gDateEnd,
				@RequestParam("gInfo") String gInfo,
				@RequestParam("gTime") String gTime,
				@RequestParam(value="isCtn", required = false, defaultValue = "N") String isCtn, ModelMap model) {
		
		Date date = Date.valueOf(gDate);
		Date date2 = Date.valueOf(gDateEnd);
		int hour = Integer.parseInt(gTime.substring(0, 2));
		int min = Integer.parseInt(gTime.substring(3));
		
		Timestamp time = Timestamp.valueOf(date.toString() + " " + hour + ":" + min + ":00"); // 20: + 14 + :00

		Calendar cal = new Calendar();
		
		cal.setGId(gId);
		cal.setGDate(date);
		cal.setGDateEnd(date2);
		cal.setGInfo(gInfo);
		cal.setGTime(time);
		cal.setIsCtn(isCtn);
		
		// System.out.println("insert 확인 : " + cal);

		int result = sgroupService.addCalendar(cal);

		return "redirect:groupCalendar.do";	
		
	}
	
	@RequestMapping("sgroup/groupCalendar.do")
	public String loadList(Model model, @ModelAttribute("member") Member m, @ModelAttribute("gid") String gId) {
		
		Sgroup sr = sgroupService.selectOneSgroup(gId);
		// 일정 조회
		List<Calendar> list = new ArrayList<Calendar>(); 
		Map <String,Object> isCtn = new HashMap<String,Object>();
		isCtn.put("gid", gId);
		isCtn.put("userId",m.getUserId());
		
		list = sgroupService.loadList(gId);
		int result = sgroupService.checkCtn(gId, m.getUserId());
		Sgroup group = sgroupService.selectOneSgroup(gId);
		System.out.println("list 조회 : "+list);
		if(group.getGType().equals("S")) {
			
			if(list.size() == 0) {
				Calendar cal = new Calendar();
				cal.setGId(gId);
				cal.setGDate(group.getDurate());
				cal.setGDateEnd(group.getDurate());
				cal.setGInfo("모임일");
				cal.setIsCtn("Y");
				Timestamp time = Timestamp.valueOf(group.getDurate().toString() + " 12:00:00"); 
				cal.setGTime(time);
				sgroupService.addCalendar(cal);
				list = sgroupService.loadList(gId);
			}
		}
		
		boolean ctnCheck = (result==1) ? true : false;
		
		// System.out.println("\n" + list);
		// System.out.println("controller");

		model.addAttribute("sclist", list);
		model.addAttribute("isCtn",ctnCheck);
		model.addAttribute("group",group);
		model.addAttribute("sgroup",sr);
		System.out.println("group : "+group);
		

		
		return "sgroup/groupCalendar";	

	}
	
	@RequestMapping("sgroup/deleteCalendar.do")
	// 일정 제거
	public String deleteCalendar(@RequestParam String cdId, Model model) {

		int sendResult = sgroupService.deleteCalendar(cdId);
		
		// System.out.println(sendResult);
		
		model.addAttribute("cdId", cdId);
		
		return "sgroup/groupCalendar";		
	}
	
	@RequestMapping("sgroup/modifyCalendar.do")
	@ResponseBody
	public Map<String,Object> modifyCalendar(@RequestParam("cdate") Date date, @RequestParam("cdid") String cdid, @RequestParam("cinfo") String info, @RequestParam("ctime") String time){
		Map<String,Object> map = new HashMap<String,Object>();
	
		int hour = Integer.parseInt(time.substring(0, 2));
		int min = Integer.parseInt(time.substring(3));
		
		Timestamp ctime = Timestamp.valueOf(date.toString() + " " + hour + ":" + min + ":00"); // 20: + 14 + :00
		
		System.out.println("modifycal 확인 : "+date+cdid+info+time);
		
		map.put("info", info);
		map.put("time", ctime);
		map.put("cdid", cdid);
		
		int result = sgroupService.modifyCalendar(map);
		
		if(result>0) {
			map.put("result",true);
		}else {
			map.put("result",false);
		}
		System.out.println("result : "+result);
		return map;
	}
	 
	@RequestMapping("sgroup/calCheckCpt.do")
	@ResponseBody
	public Map<String,Object> checkCpt(@RequestParam("userid") String userId, @RequestParam("gid") String gid, @RequestParam("cdId") String cdid){
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		int checkctn = sgroupService.checkCtn(gid, userId);
		//1 : 모임장, 2: 모임장아님
		Calendar cal = sgroupService.selectOneCal(cdid);
		String checkcal = cal.getIsCtn();
		
		if(checkctn==1) {
			map.put("result", true);
		}else {
			if(checkcal.equals("Y")) {
				map.put("result", false);
			}
			else map.put("result", true);
		}
		
		return map;
	}
}

