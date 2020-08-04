package com.kh.meetAgain.member.controller;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.meetAgain.member.model.service.MemberService;
import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.member.model.vo.UserTMI;

@SessionAttributes(value= {"member"})
@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "member/memberInsertForm.do")
	public String memberInsertForm(@RequestParam String email,
			@RequestParam String name, @RequestParam String gender, @RequestParam String age,
			@RequestParam String birth, @RequestParam String id, Model model) {

		System.out.println(email+name+gender+age+birth+id);

		model.addAttribute("email",email);
		model.addAttribute("name",name);
		model.addAttribute("gender",gender);
		model.addAttribute("age",age);
		model.addAttribute("birth",birth);
		model.addAttribute("id",id);
		
		return "member/memberInsertForm";
	}
	@RequestMapping("member/memberInsertSuccess.do")
	public String memberInsertSuccess(Member member, Model model,
			@RequestParam("year") int year, @RequestParam("birth") String birth) {
		int month = Integer.parseInt(birth.substring(0, 2));
		int day = Integer.parseInt(birth.substring(3,5));
		System.out.println("year테스트 : "+year);
		
		Date date = new Date(year-1900,month-1,day);
		System.out.println("date 확인 : "+date);
		member.setBirthday(date);
		
		int result = memberService.insertMember(member);
		String loc = "/";
		String msg = "";
		
		if (result > 0) msg = "회원 가입 성공!";
		else msg = "회원 가입 실패!";
		
		
		model.addAttribute("loc", loc);  // like request.setAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "member/memberInsertSuccess";
	}
	@RequestMapping("member/mTMIInsertForm.do")
	public String mTMIInsertForm(@ModelAttribute("member") Member m, Model model) {
		
		Map<String, Object> map = memberService.selectOneTMI(m.getUserId());
		UserTMI ut = (UserTMI)map.get("ut");
		CateInfo cateInfo = (CateInfo)map.get("cateInfo");
		
		model.addAttribute("UserTMI", ut);
		model.addAttribute("CateInfo", cateInfo);
		
		return "member/mTMIInsertForm";
	}
	
	@RequestMapping("member/membership.do")
	public String membership() {
		return "member/membership";
	}
	@RequestMapping("member/login.do")
	public String login() {
		return "member/login";
	}
	@RequestMapping("member/callBack.do")
	public String callback() {
		return "member/callBack";
	}
	
	@RequestMapping("/member/checkNnDuplicate.do")
	@ResponseBody
	public Map<String, Object> responseBodyProcess(@RequestParam String nickName){
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		boolean isUsable = memberService.checkNnDuplicate(nickName) == 0 ? true : false;
		map.put("isUsable", isUsable);
		
		// @ResponseBody 는 결과가 viewResolver로 가지 않고,
		// 직접 그 결과 자체를 화면으로 전달한다.
		return map;
	}
	@RequestMapping("/member/checkNnDuplicate2.do")
	@ResponseBody
	public Map<String, Object> responseBodyProcess1(Member member,@RequestParam String nickName){
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		Map<String, String> map2 =  new HashMap<String, String>();
		map2.put("nickName", nickName);
		map2.put("email", member.getEmail());
		boolean isUsable2 = memberService.checkNnDuplicate2(map2) == 0 ? true : false;
		map.put("isUsable2", isUsable2);
		
		// @ResponseBody 는 결과가 viewResolver로 가지 않고,
		// 직접 그 결과 자체를 화면으로 전달한다.
		return map;
	}	
	@RequestMapping("member/mUpdate.do")
	@ResponseBody
	public String mUpdate( UserTMI userTMI,
			Member member, Model model, HttpSession session,
	         @RequestParam(value="userImg1", required = false) MultipartFile[] userImg1) {
		
		int result = memberService.mUpdate(member);
		System.out.println("되라될되로다 : "+userImg1);
		String loc="/";
		String msg="";
		System.out.println(member.getUserImg());
		String saveDir = session.getServletContext().getRealPath("/resources/upload/userImg");

	      File dir = new File(saveDir);
	      if(dir.exists() == false) dir.mkdirs();
	      
	      for(MultipartFile f : userImg1) {
	         if(!f.isEmpty()) {
	        	 
	            String originName = f.getOriginalFilename();
	            String ext = originName.substring(originName.lastIndexOf(".")+1);
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
	            
	            int rndNum = (int)(Math.random() * 1000+1000);
	            
	            String renamedName = sdf.format(new java.util.Date()) + "_" + rndNum + "." + ext;

	            try {
	               f.transferTo(new File(saveDir + "/" + renamedName));
	            } catch (IllegalStateException | IOException e) {
	               e.printStackTrace();
	            }
	            
	            userTMI.setUserImg(renamedName);

	         }
	      }
	      
	    int result2 = memberService.imgUpdate(userTMI);
	    
		if(result > 0 && result2 > 0) {
			msg = "정보 수정이 완료되었습니다";
		}else {
			msg = "정보 수정 중 오류가 발생하였습니다. 다시 시도해주세요.";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "redirect:/";
	}

	@RequestMapping(value = "/member/selectOne.do")
	@ResponseBody
	public Map<String,Object> selectOne(HttpServletRequest request) {
		String userId = request.getParameter("id");

		Map<String, Object> map = new HashMap<String,Object>();
		Member m = memberService.selectOne(userId);
		boolean isNew =true;
		
		if(m==null) {
			isNew = true;
		}else {
			isNew=false;
			map.put("wdYN",m.getWd_Yn());
			System.out.println("wdYN : "+m.getWd_Yn());
		}
		
		map.put("isNew", isNew);
		return map;
	}
	
	@RequestMapping(value="/member/userLogin.do")
	public ModelAndView userLogin(@RequestParam("userId") String userId) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		try {
		Member m = memberService.selectOne(userId);
		
		String msg = "로그인 성공!";
		String loc = "/";
		
		mav.addObject("member", m);
		mav.addObject("loc", loc);
		mav.addObject("msg", msg);
		mav.setViewName("common/msg");
		}catch(Exception e) {
		 throw new Exception();
		}
		return mav;
	}
	
	@RequestMapping("/member/mTMIUpdate.do")
	public String mTMIUpdate(UserTMI userTMI, CateInfo cateInfo, Model model) {
		
		
		System.out.println("MemberController test3 : "+userTMI);
		System.out.println(userTMI.getUserId()); 
		System.out.println(cateInfo);
		int result = 0;
		if(cateInfo.getCateId()!=null) {
			result = memberService.mTMIUpdate(userTMI, cateInfo);			
		}else {
			result = memberService.mTMIUpdate2(userTMI);
			result = memberService.mCateDelete(userTMI.getUserId());
		}
		 
		String loc="/";
		String msg="";
		
		if(result > 0) {
			msg="정보 수정이 완료되었습니다.";
		}else {
			msg="정보 수정 중 오류가 발생하였습니다. 다시 시도해 주세요.";
		}
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/logout.do")
	public String memberLogout(SessionStatus status) {
		// SessionStatus 는 현재 사용자가 접속한 웹 브라우저와
		// 서버 사이의 세션의 설정을 가지는 객체
		// 세션이 아직 완료되지 않았다면 세션을 종료시켜라!
		if(! status.isComplete())
			status.setComplete();
		
		return "redirect:/";
	}
	
	@RequestMapping("/member/memberOut.do")
	public String memberOut(@ModelAttribute("member") Member m, Model model, SessionStatus status) {
		String msg = "";
		String loc = "/";
		
		int result = memberService.memberOut(m);
		
		if(result<2) {
			msg = "오류가 발생했습니다.";
			model.addAttribute("loc",loc);
			model.addAttribute("msg",msg);
			return "common/msg";
		}
		else {
			msg = "회원 탈퇴가 완료되었습니다.";
			status.setComplete();
			
			return "redirect:/";
		}
		
	}
}
