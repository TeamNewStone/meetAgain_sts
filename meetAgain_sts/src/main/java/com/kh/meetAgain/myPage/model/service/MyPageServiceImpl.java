package com.kh.meetAgain.myPage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.member.model.vo.UserTMI;
import com.kh.meetAgain.myPage.model.dao.MyPageDAO;
import com.kh.meetAgain.myPage.model.vo.Review;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;

@Service("mpSvc")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired MyPageDAO mpDAO;

	@Override
	public List<Map<String, String>> selectMyBoardList(int cPage, int numPerPage) {
		return mpDAO.selectMyBoardList(cPage, numPerPage);
	}

	@Override
	public int selectMyBoardTotalContents() {
		return mpDAO.selectMyBoardTotalContents();
	}

	@Override
	public int totalFollowing(String userId) {
		return mpDAO.totalFollwing(userId);
	}

	@Override
	public int totalFollower(String userId) {
		return mpDAO.totalFollwer(userId);
	}

	@Override
	public int totalGroup(String userId) {
		return mpDAO.totalGroup(userId);
	}

	@Override
	public UserTMI selectUserTMI(String userId) {
		return mpDAO.selectUserTMI(userId);
	}
	
	@Override
	public List<Map<String, String>> selectFollowerList(String userId) {
		return mpDAO.selectFollowerList(userId);
	}
	
	@Override
	public List<Map<String, String>> selectFollowingList(String userId) {
		return mpDAO.selectFollowingList(userId);
	}

	@Override
	public List<Sgroup> getMyGroup(String userId) {
		return mpDAO.getMyGroup(userId);
	}

	@Override
	public List<Sgroup> getCreateGroup(String userId) {
		return mpDAO.getCreateGroup(userId);
	}

	@Override
	public int selectFollowYN(Map<String, String> map) {
		return mpDAO.selectFollowYN(map);
	}

	@Override
	public int insertFollow(Map<String, String> map) {
		return mpDAO.insertFollow(map);
	}

	@Override
	public int deleteFollow(Map<String, String> map) {
		return mpDAO.deleteFollow(map);
	}

	@Override
	public int insertReview(Review review) {
		return mpDAO.insertReview(review);
	}

	@Override
	public Review selectReview(String userId, String gId) {
		return mpDAO.insertReview(userId, gId);
	}

	@Override
	public Member selectMember(String userId) {
		return mpDAO.selectMember(userId);
	}

}
