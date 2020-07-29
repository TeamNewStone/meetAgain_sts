package com.kh.meetAgain.myPage.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.meetAgain.member.model.vo.UserTMI;

public interface MyPageDAO {

	List<Map<String, String>> selectMyBoardList(int cPage, int numPerPage);

	int selectMyBoardTotalContents();

	int totalFollwing(String userId);

	int totalFollwer(String userId);

	int totalGroup(String userId);

	UserTMI selectUserTMI(String userId);
	
	List<Map<String, String>> selectFollowerList(String userId);

	List<Map<String, String>> selectFollowingList(String userId);	
}
