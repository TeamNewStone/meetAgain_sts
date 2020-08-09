
package com.kh.meetAgain.sgroup.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.meetAgain.admin.model.vo.Report;
import com.kh.meetAgain.common.util.Utils;
import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.myPage.model.vo.Review;
import com.kh.meetAgain.sgroup.model.exception.SgroupException;
import com.kh.meetAgain.sgroup.model.service.SgroupService;
import com.kh.meetAgain.sgroup.model.vo.GB_comment;
import com.kh.meetAgain.sgroup.model.vo.Gboard;
import com.kh.meetAgain.sgroup.model.vo.Joing;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;


@SessionAttributes(value= {"member", "gid"})

@Controller
public class SgroupController {

	@Autowired
	SgroupService sgroupService;

	// 모입 생성 페이지로 이동
	@RequestMapping("/sgroup/create.do")
	public String create() {
		return "sgroup/create";
	}

	@RequestMapping("/sgroup/sgroupCreateEnd.do")
	public String sgroupCreateEnd(Sgroup sgroup, Model model, HttpSession session,
			@RequestParam(value = "sgroupImg", required = false) MultipartFile[] sgroupImg,
			@RequestParam String userId) {

		System.out.println("sgroup : " + sgroup);
		System.out.println("sgroupImg : " + sgroupImg);
		String saveDir = session.getServletContext().getRealPath("/resources/upload/groupImg");

		File dir = new File(saveDir);

		System.out.println("폴더가 있나요? " + dir.exists());

		if (dir.exists() == false) dir.mkdirs();

		for (MultipartFile f : sgroupImg) {
			if (!f.isEmpty()) {

				String originName = f.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf(".") + 1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");

				int rndNum = (int) (Math.random() * 1000);

				String renamedName = sdf.format(new java.util.Date()) + "_" + rndNum + "." + ext;

				try {
					f.transferTo(new File(saveDir + "/" + renamedName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}

				sgroup.setGImg(renamedName);
				
			}
		}

		System.out.println("sgroup2222 : " + sgroup);
		int result = sgroupService.insertSgroup(sgroup);
		String loc = "/sgroup/group.do";
		String msg = "";

		if (result > 0) {
			msg = "모임 생성 완료";
			System.out.println("모임생성완료");
		} else {
			msg = "모임 생성 실패";
			System.out.println("모임생성완료");
		}

		model.addAttribute("loc", loc); 
		model.addAttribute("msg", msg);
		return "common/msg";

	}

	// 소모임 전체 리스트 출력
	@RequestMapping("/sgroup/group.do")
	public String group(@ModelAttribute("member") Member m, Model model) {
		
		List<Sgroup> list = sgroupService.selectSgroupList();
		List<CateInfo> cateInfo = sgroupService.selectCateInfo(m.getUserId());
		List<Joing> joUser = sgroupService.selectJoingUser(m.getUserId());
		
		int groupCount = 0;
		
		try {
			
			groupCount = sgroupService.selectGroupCount(m.getUserId());
		
		}catch(NullPointerException e) {
			groupCount = 0;
		}
		model.addAttribute("list", list);
		model.addAttribute("cateInfo", cateInfo);
		model.addAttribute("joUser", joUser);
		model.addAttribute("groupCount", groupCount);

		System.out.println("groupCount(group.do) : " + groupCount);
		System.out.println("cateInfo : " + cateInfo);

		return "sgroup/group";
	}
	
	@RequestMapping("/sgroup/distanceGroup.do")
	@ResponseBody
	public List<Sgroup> distanceGroup(Model model) {
		
		List<Sgroup> list = sgroupService.selectSgroupList();
		
		return list;
	}
	

	// 소모임 한개 출력

	@RequestMapping("/sgroup/groupInfo.do")

	public String groupInfo(@ModelAttribute("member") Member m, @RequestParam String gid, Model model) {
		
		Sgroup sr = sgroupService.selectOneSgroup(gid);

		List<Joing> joing = sgroupService.selectJoing(gid);
		int groupMem = 0;
		int groupCount = 0;
		
		try {
			
			groupCount = sgroupService.selectGroupCount(m.getUserId());
			groupMem = sgroupService.countGroupMember(gid);
		}catch(NullPointerException e) {
			groupCount = 0;
			groupMem = 0;
		}

		model.addAttribute("sgroup", sr);
		model.addAttribute("joing", joing);
		model.addAttribute("groupCount", groupCount);
		model.addAttribute("groupMem", groupMem);

		System.out.println("groupCount : " + groupCount);

		return "sgroup/groupInfo";
	}

	@RequestMapping("/sgroup/groupJoin.do")
	public String groupJoin(Joing joing, Model model) {

		int result = sgroupService.insertGroupJoin(joing);

		System.out.println("result : " + result);

		 String loc = "/sgroup/group.do"; 
		 String msg = "";
		 if(joing.getJoinType().equals("C")) {
			 if(result >0) msg = "가입 신청이 완료되었습니다. 승인이 완료 될 때까지 기다려주세요.";
			 else msg = "모임 신청 실패!";
		
		 } else {
		 
			 if(result > 0) msg = "모임 가입 성공!"; 
			 else msg = "모임 가입 실패!";

		 }
		 model.addAttribute("loc", loc); 
		 model.addAttribute("msg", msg);
		return "common/msg";
	}
	
	@RequestMapping("/sgroup/groupAlbum.do")
	public String groupAlbum(@RequestParam String gid, Model model) {
		model.addAttribute("gid", gid);
		return "sgroup/groupAlbum";
	}

	@RequestMapping("/sgroup/memberList.do")
	public String memberList(@RequestParam String gid, Model model) {
		List<Joing> joing = sgroupService.selectJoing(gid);
		
		
		model.addAttribute("joing", joing);
		model.addAttribute("gid", gid);
		return "sgroup/memberList";
	}

	@RequestMapping("/sgroup/joinSuccess.do")
	public String joinSuccess(@RequestParam String userId, @RequestParam String gid, Model model) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("userId", userId);
		map.put("gid", gid);
		
		int result = sgroupService.joinSuccess(map);
		

		return "common/msg";
	}

	@RequestMapping("/sgroup/groupLeave.do")
	public String groupLeave(@ModelAttribute("member") Member m, @RequestParam String gid, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("userId", m.getUserId());
		map.put("gid", gid);
		
		int result = sgroupService.groupLeave(map);
		
		 String loc = "/sgroup/group.do"; 
		 String msg = "";

		 if(result > 0) msg = "모임 탈퇴 성공!"; 
		 else msg = "모임 탈퇴 실패!";

		  model.addAttribute("loc", loc);
		  model.addAttribute("msg", msg);

		return "common/msg";
	}
	

	@RequestMapping("/sgroup/groupBoard.do")
	public String groupBoard(@RequestParam("gid") String gid,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model) {

		// 한 페이지 당 게시글 수
		int numPerPage = 10; // limit 역할

		// 1. 현재 페이지 게시글 목록 가져오기
		// 실제 데이터베이스의 데이터에서
		// 머릿글 : 키(key) , 실제 값 : 값(value) => 여러 개니까 List에 담기
		List<Map<String, String>> list = sgroupService.selectgBoardList(gid, cPage, numPerPage);

		// 2. 페이지 계산을 위한 총 페이지 개수
		int totalContents = sgroupService.selectgBoardTotalContents(gid);

		// 3. 패아자 HTML 생성
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "groupBoard.do");
		
		Sgroup s = sgroupService.selectOneSgroup(gid);
		model.addAttribute("sgroup", s);
		String loc = "/sgroup/groupBoard.do";
		String msg = "";
		
			loc = "/sgroup/groupBoard.do?gid=" + gid;

		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		
		System.out.println("list : " + list);
		System.out.println("Controller gid : " + gid);

		model.addAttribute("gid", gid);

		return "/sgroup/groupBoard";

	}
	
	@RequestMapping("/sgroup/groupBoardDetail.do")
	public String groupBoardDetail(@RequestParam int gbId, @RequestParam("gid") String gid, Model model) {
		
		Gboard gb = sgroupService.SelectOnegBoard(gbId);
		Sgroup s = sgroupService.selectOneSgroup(gid);
		List<GB_comment> list = sgroupService.selectCommentList(gbId);

		int gbRate = sgroupService.updateReadCount(gbId);
		model.addAttribute("sgroup", s);
		model.addAttribute("gbRate", gbRate);
		model.addAttribute("list", list);
		model.addAttribute("Gboard", gb);
		model.addAttribute("gid", gid);
		System.out.println("sgroup : "+s);
		System.out.println("Detail controller list : " + list);

		return "/sgroup/groupBoardDetail";
	}


	@RequestMapping("sgroup/gboardInsert.do")
	public String gboardInsert() {

		return "/sgroup/gboardInsert";

	}

	@RequestMapping(value="/sgroup/gbInsert.do", method=RequestMethod.POST)
	public String gbInsert(@RequestParam("gid") String gid, @RequestParam("userid") String userid,Gboard Gboard, Model model) {
		System.out.println("gid:"+gid+" userid:"+userid);
		System.out.println(Gboard);
		Gboard.setGId(gid);
		Gboard.setUserId(userid);
		int result = sgroupService.insertgBoard(Gboard);
		String loc = "/sgroup/groupBoard.do";
		String msg = "";
		if (result > 0) {
			msg = "게시글 등록 성공!";
			loc = "/sgroup/groupBoard.do?gid=" + gid;

		} else {
			msg = "게시글 등록 실패!";
		}

		model.addAttribute("loc", loc).addAttribute("msg", msg);
		System.out.println("Gboardcontroller : " + Gboard);
		System.out.println(msg);
		return "common/msg";

	}


	@RequestMapping("sgroup/groupBoardUpdate.do")
	public String gBoardUpdate(@RequestParam int gbId, @RequestParam String gid, Model model) {
		model.addAttribute("Gboard", sgroupService.SelectOnegBoard(gbId));
		model.addAttribute("gid", gid);
		System.out.println("model에 gbId가 있는지 확인 : " + model);

		return "/sgroup/groupBoardUpdateForm";
	}

	@RequestMapping("/sgroup/gbUpdate.do")
	public String gbUpdate(@RequestParam("gid") String gid,@RequestParam("gbId") int gbId, Gboard Gboard, Model model) {
		int result = sgroupService.updategBoard(Gboard);
		System.out.println("result ? : " + result);
		String loc = "sgroup/groupBoardDetail.do";
		String msg = "";

		if (result > 0) {
			msg = "게시글 수정이 완료되었습니다";
			loc = "/sgroup/groupBoardDetail.do?gbId="+gbId+"&gid="+gid; 
		} else {
			msg = "게시글 수정 실패. 다시 시도해주세요";
		}

		model.addAttribute("loc", loc).addAttribute("msg", msg);

		return "common/msg";
	}

	@RequestMapping("/sgroup/groupBoardDelete.do")
	public String groupBoardDelete(@RequestParam int gbId, @RequestParam String gid, Model model) {
		int result = sgroupService.deletegBoard(gbId);

		String loc = "sgroup/groupBoard.do";
		String msg = "";

		if (result > 0) {
			msg = "게시글 등록 성공!";
			loc = "/sgroup/groupBoard.do?&gid="+gid;
		} else {
			msg = "게시글 삭제 실패!";
		}

		model.addAttribute("gid", gid);
		model.addAttribute("loc", loc).addAttribute("msg", msg);

		System.out.println("deleteController model : " + model);
		return "common/msg";
	}


	@RequestMapping("sgroup/gotoGroup.do")
	public String gotoGroup(@RequestParam String gid, Model model) {

		String loc = "/sgroup/groupBoard.do?gid=" + gid;
		String msg = "";

		model.addAttribute("gid", gid);
		model.addAttribute("loc", loc);

		return "common/msg";
	}
	
	@RequestMapping("/sgroup/insertComment.do")
	public String insertComment(@RequestParam("gbId") int gbId,@RequestParam("gid") String gid , GB_comment GB_comment, Model model) {

		GB_comment.setGbId(gbId);
		int result = sgroupService.insertComment(GB_comment);
		

		String loc = "/sgroup/insertComment.do";
		String msg = "";
		if (result > 0) {
			msg = "댓글 등록 성공!";
			loc = "/sgroup/groupBoardDetail.do?gbId=" + gbId + "&gid="+ gid; 

		} else {
			msg = "댓글 등록 실패!";
		}

		model.addAttribute("loc", loc).addAttribute("msg", msg);
		System.out.println("controller GB" + GB_comment);
		return "common/msg";

	}
	@RequestMapping("/sgroup/commentUpdate.do")
	public String commentUpdate(@RequestParam("gbId") int gbId, @RequestParam("cId") int cId, @RequestParam("gid") String gid, GB_comment GB_comment, Model model) {

		GB_comment.setCId(cId);
		
		int result = sgroupService.commentUpdate(GB_comment);

		String loc = "/sgroup/insertComment.do";
		String msg = "";
		if (result > 0) {
			msg = "댓글 수정 성공!";
			loc = "/sgroup/groupBoardDetail.do?gbId=" + GB_comment.getGbId() + "&gid=" + gid;

		} else {
			msg = "댓글 수정 실패!";
		}

		model.addAttribute("GB_comment", sgroupService.commentUpdate(GB_comment));
		model.addAttribute("gid", gid);
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		System.out.println("controller GB" + GB_comment);
		return "common/msg";
		
	}
	


	@RequestMapping("/sgroup/commentDelete.do")
	public String commentDelete(@RequestParam("cId") int cId, Model model, @RequestParam("gbId") int gbId,@RequestParam("gid") String gid) {
			
		try { 
			int result = sgroupService.commentDelete(cId);
			
			String loc = "/sgroup/groupBoardDetail.do";
			String msg = "";
		//	int gid = gB_comment.getGbId();
			if(result > 0) {
				loc ="/sgroup/groupBoardDetail.do?gbId="+ gbId+"&gid="+gid;
				msg = "댓글 삭제 성공!";
			}
			else msg = "댓글 삭제 실패!";
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
			System.out.println("gB_comment.getGbId() : " +gbId);
		} catch(Exception e) {
			
			// 받은 에러를 서버 개발자가 의도한 형식으로 보내기
			throw new SgroupException(e.getMessage());
		}
		
		return "common/msg";
	}

	@RequestMapping("/sgroup/groupDetail.do")
	public String groupDetail(@RequestParam String gid, Model model) {
		Sgroup s = sgroupService.selectOneSgroup(gid);
		List<Joing> joing = sgroupService.selectJoing(gid);
		
		int groupMem = 0;
		
		try {
			groupMem = sgroupService.countGroupMember(gid);
		
		}catch(NullPointerException e) {
			groupMem = 0;
		}
		model.addAttribute("sgroup", s);
		model.addAttribute("joing", joing);
		model.addAttribute("gid", gid);
		model.addAttribute("groupMem", groupMem);
		System.out.println("joing-groupDetail : " + joing);

		return "sgroup/groupDetail";
	}

	@RequestMapping("/sgroup/aImgInsert.do")
	   @ResponseBody
	   public String sgroupImgInsert(
	              @RequestParam(value="file", required = false) MultipartFile[] file
	            , Model model, HttpSession session
	         ) {
	      
	      String saveDir = session.getServletContext().getRealPath("resources/upload/groupImg/desc");
	      
	      File dir = new File(saveDir);
	      if(dir.exists() == false) dir.mkdirs();
	      
	      String renamedName = "";
	      
	      for(MultipartFile f : file) {
	         
	         if(!f.isEmpty()) {
	            String originName = f.getOriginalFilename();
	            String ext = originName.substring(originName.lastIndexOf(".") + 1);
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
	            
	            int rndNum = (int)(Math.random() * 1000);
	            
	            renamedName = sdf.format(new Date(rndNum)) + "_" + rndNum + "." + ext;
	            
	            try {
	               f.transferTo(new File(saveDir + "/" + renamedName)); 
	               System.out.println("바뀐이름 : " + renamedName);
	            } catch (IllegalStateException | IOException e) {
	               e.printStackTrace();
	            }
	         }
	         
	      }
	      return "http://localhost:8088/meetAgain/resources/upload/groupImg/desc/" + renamedName;
	}


	@RequestMapping(value="/sgroup/searchGroup.do", method=RequestMethod.GET)
	@ResponseBody
	public List<Sgroup> searchGroup(@RequestParam(value="keyword", required=false) String keyword, @RequestParam(value="gType[]", required=false) List<String> gType, 
			@RequestParam(value="cateId[]", required=false) List<String> cateId, @RequestParam(value="limitGroup[]", required=false) List<String> limitGroup, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("keyword", keyword);
		map.put("gType", gType);
		map.put("cateId", cateId);
		map.put("limitGroup", limitGroup);
		
		List<Sgroup> list = sgroupService.searchGroup(map);
		System.out.println("map : " + map);
		System.out.println("searchGro" + list);
		model.addAttribute("list", list);
		return list;
	}
	

	@RequestMapping("/sgroup/bReportInsert.do")
	public String bReportInsert(Report r, Model model) {
		int result = sgroupService.bReportInsert(r);
		String msg="";
		String loc="/sgroup/groupBoardDetail.do?gbId="+r.getGbId();
		if(result > 0) {
			msg="신고가 완료되었습니다.";
		}else {
			msg="신고 중 에러가 발생하였습니다. 다시 시도해주세요.";
		}
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		return "common/msg";
	}


	@RequestMapping("/sgroup/cReportInsert.do")
	public String cReportInsert(Report r, Model model) {
		int result = sgroupService.cReportInsert(r);
		String msg="";
		String loc="/sgroup/groupBoardDetail.do?gbId="+r.getGbId();
		if(result > 0) {
			msg="신고가 완료되었습니다.";
		}else {
			msg="신고 중 에러가 발생하였습니다. 다시 시도해주세요.";
		}
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		return "common/msg";
	}	
		
   @RequestMapping(value="/sgroup/updateSgroup.do")
	public String updateSgroup(Sgroup sgroup, Model model, @RequestParam(value="sgImg", required = false) MultipartFile[] sgImg, 
			@RequestParam("gId") String gid, HttpSession session) {
	   
	   System.out.println("muti파트일하니 ? : " + sgImg);
	   String saveDir = session.getServletContext().getRealPath("/resources/upload/groupImg");
		File dir = new File(saveDir);
	   
	      if(dir.exists() == false) dir.mkdirs();
	      
	      for(MultipartFile f : sgImg) {
		         if(!f.isEmpty()) {
		        	 
		            String originName = f.getOriginalFilename();
		            String ext = originName.substring(originName.lastIndexOf(".")+1);
		            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		            
		            int rndNum = (int)(Math.random() * 1000);
		            
		            String renamedName = sdf.format(new java.util.Date()) + "_" + rndNum + "." + ext;

		            try {
		               f.transferTo(new File(saveDir + "/" + renamedName));
		            } catch (IllegalStateException | IOException e) {
		               e.printStackTrace();
		            }
		            
		            sgroup.setGImg(renamedName);
		         }
		      }
	     System.out.println("잘받옹니ㅣ ? : " + sgroup);
		int result = sgroupService.updateSgroup(sgroup);
		System.out.println("result : " + result);
		System.out.println("gid : " + gid);
		String msg="";
		String loc="/sgroup/groupDetail.do?gid="+gid;
		
		if(result > 0) {
			msg="모임 수정 완료!.";
		}else {
			msg="모임 수정 실패";
		}
		System.out.println("잘받옹니ㅣ ?22222222222222 : " + sgroup);
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		return "common/msg";
	}

}
