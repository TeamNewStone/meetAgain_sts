package com.kh.meetAgain.myPage.model.dao;

import java.util.List;
import java.util.Map;

public interface MyPageDAO {

	List<Map<String, String>> selectMyBoardList(int cPage, int numPerPage);

	int selectMyBoardTotalContents();

	int totalFollwing(String userId);

	int totalFollwer(String userId);

	int totalGroup(String userId);
}
