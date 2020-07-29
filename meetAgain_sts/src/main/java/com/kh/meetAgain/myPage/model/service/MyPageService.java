package com.kh.meetAgain.myPage.model.service;

import java.util.List;
import java.util.Map;

public interface MyPageService {

	List<Map<String, String>> selectMyBoardList(int cPage, int numPerPage);

	int selectMyBoardTotalContents();

	int totalFollowing(String userId);
	int totalFollower(String userId);

	int totalGroup(String userId);
}
