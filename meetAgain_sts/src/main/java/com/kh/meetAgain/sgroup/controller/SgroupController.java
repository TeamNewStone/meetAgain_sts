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
	         @RequestParam("gTitle") String gTitle) {
		
		System.out.println("gTitle : " + gTitle);
		System.out.println("sgroup : " + sgroup);
		System.out.println("멀티파트 : " + sgroupImg);
		String saveDir = session.getServletContext().getRealPath("/resources/upload/groupImg");
	      

	      // 2. 폴더 유무 확인 후 생성
	      File dir = new File(saveDir);
	      
	      System.out.println("폴더가 있나요? " + dir.exists());
	      
	      if(dir.exists() == false) dir.mkdirs(); // 폴더가 없다면 만들어줌
	      
	      // 3. 파일 업로드 시작 (MultipartFile 사용 시 )
	      for(MultipartFile f : sgroupImg) {
	         if(!f.isEmpty()) {
	            // 원본 이름 가져오기
	            String originName = f.getOriginalFilename();
	            String ext = originName.substring(originName.lastIndexOf(".")+1);
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
	            
	            int rndNum = (int)(Math.random() * 1000);
	            
	            // 서버에서 저장 후 관리할 파일 명
	            String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
	            
	            // 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
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
	   		
	   		return "redirect:/board/notice.do";
	   		
				/*
				 * int result = 0;
				 * 
				 * try {
				 * 
				 * result = sgroupService.insertSgroup(sgroup);
				 * 
				 * } catch(Exception e) {
				 * 
				 * e.getStackTrace();
				 * 
				 * }
				 * 
				 * System.out.println("result : " + result); String loc = "/board/notice.do";
				 * String msg = "";
				 * 
				 * if(result > 0) { msg = "게시글 등록 성공!"; loc = "/board/notice.do";
				 * 
				 * } else { msg = "게시글 등록 실패!"; }
				 * 
				 * model.addAttribute("loc", loc).addAttribute("msg", msg);
				 * 
				 * return "common/msg";
				 */

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
