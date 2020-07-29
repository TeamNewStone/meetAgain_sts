package com.kh.meetAgain.sgroup.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.kh.meetAgain.sgroup.model.service.SgroupService;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;



@Controller
public class SgroupController {

	@Autowired 
	SgroupService sgroupService;
	
	// 모입 생성 페이지로 이동
	@RequestMapping("sgroup/create.do")
	public String create() {
		return "sgroup/create";
	}
	
	@RequestMapping("sgroup/sgroupCreateEnd.do")
	public String sgroupCreateEnd(Sgroup sgroup,  Model model, HttpSession session,
	         @RequestParam(value="sgroupImg", required = false) MultipartFile[] sgroupImg,
	         @RequestParam String userId) {
		
		System.out.println("userId : " + userId);
		System.out.println("sgroup : " + sgroup);
		String saveDir = session.getServletContext().getRealPath("/resources/upload/groupImg");

	      File dir = new File(saveDir);
	      
	      System.out.println("폴더가 있나요? " + dir.exists());
	      
	      if(dir.exists() == false) dir.mkdirs();
	      
	      for(MultipartFile f : sgroupImg) {
	         if(!f.isEmpty()) {
	        	 
	            String originName = f.getOriginalFilename();
	            String ext = originName.substring(originName.lastIndexOf(".")+1);
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
	            
	            int rndNum = (int)(Math.random() * 1000);
	            
	            String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;

	            try {
	               f.transferTo(new File(saveDir + "/" + renamedName));
	            } catch (IllegalStateException | IOException e) {
	               e.printStackTrace();
	            }
	            
	            sgroup.setGImg(renamedName);

	         }
	      }
	
	      	int result = sgroupService.insertSgroup(sgroup);
	   		String msg = "";
	   		
	   		if (result >0) {
	   			msg = "모임 생성 완료";
	   			System.out.println("모임생성완료");
	   		} else {
	   			msg = "모임 생성 실패";
	   			System.out.println("모임생성완료");
	   		}
	   		
	   		return "redirect:/sgroup/group.do";
	   		

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
	@RequestMapping("sgroup/groupDetail.do")
	public String groupDetail() {
		return "sgroup/groupDetail";
	}
	@RequestMapping("sgroup/groupInfo.do")
	public String groupInfo() {
		return "sgroup/groupInfo";
	}
	@RequestMapping("sgroup/groupMap.do")
	public String groupMap() {
		return "sgroup/groupMap";
	}
	@RequestMapping("sgroup/memberList.do")
	public String memberList() {
		return "sgroup/memberList";
	}
	@RequestMapping("sgroup/gboardInsert.do")
	public String gboardInsert() {
		return "sgroup/gboardInsert";
	}
	
}
