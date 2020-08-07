package com.kh.meetAgain.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.kh.meetAgain.common.util.Utils;
import com.kh.meetAgain.member.model.service.MemberService;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.member.model.vo.UserTMI;
import com.kh.meetAgain.myPage.model.service.MyPageService;
import com.kh.meetAgain.myPage.model.vo.Review;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;

@SessionAttributes(value= {"member"})
@Controller
public class MyPageController {
	
	
	  @Autowired MyPageService mpSvc;
	 @Autowired MemberService mservice;
	
	@RequestMapping("myPage/myPage1.do")
	public String myPage1(@ModelAttribute("member") Member m, @RequestParam("uid") String userId, @RequestParam(value="cPage", required=false, defaultValue="1")
	int cPage, Model model) {
		
		/*===============프로필화면에 표시될 값 가져오기===============*/
		Member owner = mservice.selectOneMember(userId);//마이페이지 주인의 정보값
		int following = mpSvc.totalFollowing(userId);
		int follower = mpSvc.totalFollower(userId);
		int groupSum = mpSvc.totalGroup(userId);
		UserTMI tmi = (UserTMI)mservice.selectOneTMI(userId).get("ut");
		
		/*================팔로우 여부================*/
		String muserId = m.getUserId();
		Map<String, String> map = new HashMap<String, String>();
		map.put("muserId", muserId);
		map.put("userId", userId);
		int followYN = mpSvc.selectFollowYN(map);
		model.addAttribute("followYN", followYN);
		
		/*======================소모임 목록 가져오기======================*/
		List<Sgroup> group = new ArrayList<Sgroup>(); // 가입한 소모임
		List<Sgroup> mgroup = new ArrayList<Sgroup>();
		
		group = mpSvc.getMyGroup(userId);
		mgroup = mpSvc.getCreateGroup(userId);	
		
		System.out.println(group);
		System.out.println(mgroup);
		
		/*======================작성한 게시글 데이터 가져오기======================*/
		// 한 페이지 당 게시글 수 
		int numPerPage = 10; // limit 역할
		
		// 1. 현재 페이지 게시글 목록 가져오기
		// 실제 데이터베이스의 데이터에서
		// 머릿글 : 키(key) , 실제 값 : 값(value) => 여러 개니까 List에 담기
		List<Map<String, String>> list
			= mpSvc.selectMyBoardList(cPage, numPerPage, muserId);
		
		// 2. 페이지 계산을 위한 총 페이지 개수
		int totalContents = mpSvc.selectMyBoardTotalContents();
		
		// 3. 패아자 HTML 생성
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myPage1.do");
		System.out.println("controller : "+list);
		//System.out.println("왜 안되나요 해당 사진 가져와라 : " + owner.getUserImg());
		System.out.println(owner);
		model.addAttribute("list", list);
		
		model.addAttribute("owner",owner);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("following", following);
		model.addAttribute("follower", follower);
		model.addAttribute("groupSum", groupSum);
		model.addAttribute("tmi",tmi);
		model.addAttribute("mygroup",group);
		model.addAttribute("cgroup",mgroup);
		
		return "myPage/myPage1";
	}
	
	/*
	 * @RequestMapping("myPage/myPage1.do") public String myPage1(
	 * 
	 * @RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
	 * Model model) {
	 * 
	 * // 한 페이지 당 게시글 수 int numPerPage = 10; // limit 역할
	 * 
	 * // 1. 현재 페이지 게시글 목록 가져오기 List<Map<String, String>> list =
	 * boardService.selectBoardList(cPage, numPerPage);
	 * 
	 * // 2. 페이지 계산을 위한 총 패이지 갯수 int totalContents =
	 * boardService.selectBoardTotalContents();
	 * 
	 * // 3. 페이지 HTML 생성 String pageBar = Utils.getPageBar(totalContents, cPage,
	 * numPerPage, "boardList.do");
	 * 
	 * model.addAttribute("list", list) .addAttribute("totalContents",
	 * totalContents) .addAttribute("numPerPage", numPerPage)
	 * .addAttribute("pageBar", pageBar);
	 * 
	 * return "myPage/myPage1"; }
	 */
	
	@RequestMapping("myPage/myPage2.do")
	public String myPage2(@RequestParam("uid") String userId, Model model) {
		UserTMI userTMI = mpSvc.selectUserTMI(userId);
		model.addAttribute("userTMI", userTMI);
		return "myPage/myPage2";
	}
	@RequestMapping("myPage/myPageOther.do")
	public String myPageOther() {
		return "myPage/myPageOther";
	}	
	@RequestMapping("myPage/followerList.do")
	public String followerList(@RequestParam("uid") String userId, Model model) {
		List<Map<String, String>> list = mpSvc.selectFollowerList(userId);
		model.addAttribute("list", list);
		return "myPage/followerList";
	}
	@RequestMapping("myPage/followingList.do")
	public String followingList(@RequestParam("uid") String userId, Model model) {
		List<Map<String, String>> list = mpSvc.selectFollowingList(userId);
		model.addAttribute("list", list);
		return "myPage/followingList";
	}
	@RequestMapping("myPage/follow.do")
	public String follow(@RequestParam("uid") String userId, @RequestParam("muserId") String muserId, Model model) {
		String msg = "";
		String loc="/myPage/myPage1.do?uid="+userId;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("muserId", muserId);
		System.out.println("userId : "+userId);
		System.out.println("muserId : "+muserId);
		int result = mpSvc.insertFollow(map);
		
		if(result > 0) {
			msg = "팔로우를 완료하였습니다!";
		}else {
			msg = "팔로우에 실패하였습니다. 다시 시도해 주세요.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	@RequestMapping("myPage/unFollow.do")
	public String unFollow(@RequestParam("uid") String userId, @RequestParam("muserId") String muserId, Model model) {
		String msg = "";
		String loc = "/myPage/myPage1.do?uid="+userId;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("muserId", muserId);
		System.out.println("userId : "+userId);
		System.out.println("muserId : "+muserId);
		int result = mpSvc.deleteFollow(map);
		
		if(result != 0) {
			msg = "언팔로우를 완료하였습니다!";
		}else {
			msg = "언팔로우에 실패하였습니다. 다시 시도해 주세요.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}	

	@RequestMapping(value="myPage/reviewInsert.do")
	public String InsertReview (@RequestParam(value="reviewImage", required = false) MultipartFile[] reviewImage, 
			HttpSession session, Review review, Model model) {
		
		String saveDir = session.getServletContext().getRealPath("/resources/upload/reviewImg");
		File dir = new File(saveDir);
	      System.out.println("이미지확인~"+reviewImage);
	      System.out.println("폴더가 있나요? " + dir.exists());
	      
	      if(dir.exists() == false) dir.mkdirs();
	      
	      for(MultipartFile f : reviewImage) {
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
		            
		            review.setRvImage(renamedName);

		         }
		      }
		
		      
		System.out.println(review);
		
		int result = mpSvc.insertReview(review);
		String msg = "";
		String loc = "/myPage/myPage1.do?uid="+review.getUserId();
		if(result>0) {
			msg = "리뷰가 정상적으로 등록되었습니다!";
		}else {
			msg = "리뷰 생성 중 에러 발생!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("myPage/checkReview.do")
	@ResponseBody
	public Map<String,Object> checkReview(@RequestParam("userid") String userid, @RequestParam("gid") String gid) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		Review rv = mpSvc.selectReview(userid, gid);
		System.out.println("rv확인 : "+rv);
		
		boolean rvCount = true;
		if(rv==null) rvCount = false;
		else rvCount = true;
		
		map.put("result", rvCount);
		System.out.println("result 확인 ; "+map);
		
		return map;
	}
}