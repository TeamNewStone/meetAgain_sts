package com.kh.meetAgain.myPage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetAgain.myPage.model.dao.MyPageDAO;

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

}