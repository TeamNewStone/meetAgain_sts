package com.kh.meetAgain.myPage.model.service;

import java.util.List;
import java.util.Map;

import com.kh.meetAgain.member.model.vo.UserTMI;
import com.kh.meetAgain.myPage.model.vo.Review;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;

public interface MyPageService {

	List<Map<String, String>> selectMyBoardList(int cPage, int numPerPage, String muserId);

	int selectMyBoardTotalContents();

	int totalFollowing(String userId);
	int totalFollower(String userId);

	int totalGroup(String userId);

	UserTMI selectUserTMI(String userId);
	
	List<Map<String, String>> selectFollowerList(String userId);

	List<Map<String, String>> selectFollowingList(String userId);

	List<Sgroup> getMyGroup(String userId);

	List<Sgroup> getCreateGroup(String userId);

	int selectFollowYN(Map<String, String> map);

	int insertFollow(Map<String, String> map);

	int deleteFollow(Map<String, String> map);

	int insertReview(Review review);

	Review selectReview(String userId, String gId);	
}
